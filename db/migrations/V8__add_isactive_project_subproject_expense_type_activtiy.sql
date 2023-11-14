ALTER TABLE project ADD COLUMN is_active boolean NOT NULL DEFAULT true;
ALTER TABLE subproject ADD COLUMN is_active boolean NOT NULL DEFAULT true;
ALTER TABLE activity ADD COLUMN is_active boolean NOT NULL DEFAULT true;
ALTER TABLE expense_type ADD COLUMN is_active boolean NOT NULL DEFAULT true;
