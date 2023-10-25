-- Step 1: Add the 'project_id' column to the 'subproject' table with a default value of NULL
ALTER TABLE subproject
ADD COLUMN project_id UUID DEFAULT NULL;

-- Step 2: Update the 'project_id' column with corresponding 'id' values from the 'project' table
UPDATE subproject AS s
SET project_id = p.id
FROM project AS p
WHERE s.project_number = p.number;

-- Step 3: Modify the 'project_id' column to remove the default value and set it as NOT NULL
ALTER TABLE subproject
ALTER COLUMN project_id SET NOT NULL;

-- Step 4: Remove the 'project_number' column from the 'subproject' table
ALTER TABLE subproject
DROP COLUMN project_number;

-- Step 5: Remove the 'number' column from the 'project' table
ALTER TABLE project
DROP COLUMN number;