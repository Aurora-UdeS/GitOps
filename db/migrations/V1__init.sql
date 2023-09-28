-- create tables

CREATE TABLE activity(
    "id" UUID PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "is_rd_admissible" BOOLEAN NOT NULL
);
CREATE TABLE subproject(
    "id" UUID PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "project_number" INTEGER NOT NULL
);
CREATE TABLE contribution(
    "id" UUID PRIMARY KEY,
    "timesheet_id"   UUID NOT NULL,
    "date" DATE NOT NULL,
    "project_id" UUID NOT NULL,
    "subproject_id" UUID,
    "activity_id" UUID NOT NULL,
    "number_of_hours" DOUBLE PRECISION NOT NULL,
    "comments" VARCHAR(1023) NOT NULL
);
CREATE TABLE employee(
    "id" VARCHAR(255) PRIMARY KEY,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT TRUE,
    "reports_to" VARCHAR(255) NOT NULL,
    "start_date" DATE NOT NULL
);
CREATE TABLE expense_type(
    "id" UUID PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
CREATE TABLE expense(
    "id" UUID PRIMARY KEY,
    "report_id" UUID NOT NULL,
    "project_id" UUID NOT NULL,
    "subproject_id" UUID,
    "expense_type_id" UUID NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "currency" VARCHAR(255) NOT NULL,
    "description" VARCHAR(1023) NOT NULL,
    "receipt_url" VARCHAR(255),
    "date" DATE NOT NULL
);
CREATE TABLE project(
    "id" UUID PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "number" INTEGER NOT NULL
);
CREATE TABLE remuneration(
    "id" SERIAL PRIMARY KEY,
    "employee_id" VARCHAR(255) NOT NULL,
    "hourly_salary" DOUBLE PRECISION NOT NULL,
    "currency" VARCHAR(255) NOT NULL,
    "max_hours_per_week" DOUBLE PRECISION NOT NULL
);
CREATE TABLE report(
    "id" UUID PRIMARY KEY,
    "employee_id" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "requested_currency" VARCHAR(255) NOT NULL,
    "comments" VARCHAR(1023),
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP,
    "updated_by" VARCHAR(255)
);
CREATE TABLE review(
    "id" UUID PRIMARY KEY,
    "report_id" UUID NOT NULL,
    "comments" VARCHAR(1023) NOT NULL,
    "reviewer_id" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL,
    "is_expense" BOOLEAN NOT NULL DEFAULT FALSE,
    "is_timesheet" BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE timesheet(
    "id" UUID PRIMARY KEY,
    "employee_id" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "payed" BOOLEAN NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "hourly_salary" DOUBLE PRECISION,
    "salary_currency" VARCHAR(255)
);
CREATE TABLE wallet(
    "id" SERIAL PRIMARY KEY, 
    "employee_id" VARCHAR(255) NOT NULL,
    "wallet_id" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL
);
CREATE TABLE github_credentials(
    "employee_id" VARCHAR(255) PRIMARY KEY,
    "access_token" VARCHAR(255) NOT NULL,
    "username" VARCHAR(255) NOT NULL
);
CREATE TABLE mileage(
    "id" UUID PRIMARY KEY,
    "qty" INTEGER NOT NULL,
    "date" DATE NOT NULL,
    "report_id" UUID NOT NULL,
    "description" VARCHAR(255)
);
CREATE TABLE transaction(
    "id" VARCHAR(255) NOT NULL PRIMARY KEY, 
    "to" VARCHAR(255) NOT NULL,
    "from" VARCHAR(255) NOT NULL,
    "amount" VARCHAR(255) NOT NULL,
    "item_id" UUID NOT NULL,
    "item_type" VARCHAR(255) NOT NULL,
    "email_sent" BOOLEAN NOT NULL DEFAULT FALSE
);

-- inject data

INSERT INTO activity ( id, name, is_rd_admissible )
VALUES
('185871ae-9810-11ed-a8fc-0242ac120002','Meeting', FALSE),
('18586b64-9810-11ed-a8fc-0242ac120002','Common practice', FALSE),
('1858769a-9810-11ed-a8fc-0242ac120002','Technique already known in industry, in the public domain (internet, books, etc.) or taught at school', FALSE),
('18587442-9810-11ed-a8fc-0242ac120002','Training and apprenticeship', FALSE),
('18588068-9810-11ed-a8fc-0242ac120002','Quality control and routine testing', FALSE),
('18587e74-9810-11ed-a8fc-0242ac120002','Change in ergonomics, design or style', FALSE),
('185883b0-9810-11ed-a8fc-0242ac120002','Routine data collection', FALSE),
('18588248-9810-11ed-a8fc-0242ac120002','Commercial production', FALSE),
('185886bc-9810-11ed-a8fc-0242ac120002','Market research, marketing, sales, etc.', FALSE),
('18588540-9810-11ed-a8fc-0242ac120002','Investigation, Reverse engineering, Analysis', TRUE),
('185889d2-9810-11ed-a8fc-0242ac120002','Software architecture, Smart Contracts, design, algorithms, coding, engineering calculations', TRUE),
('18588856-9810-11ed-a8fc-0242ac120002','Technical specifications', TRUE),
('1858908a-9810-11ed-a8fc-0242ac120002','Computer programming or software engineering', TRUE),
('18588efa-9810-11ed-a8fc-0242ac120002','Design and validation of prototypes', TRUE),
('185893e6-9810-11ed-a8fc-0242ac120002','Troubleshooting', TRUE),
('18589206-9810-11ed-a8fc-0242ac120002','Data collection for analysis or testing', TRUE),
('18589207-9810-11ed-a8fc-0242ac120002','Quality assurance', TRUE);
INSERT INTO project ( id, number, name )
VALUES
('ba79a018-980e-11ed-a8fc-0242ac120002', 0, 'Accounting'),
('ba79a39c-980e-11ed-a8fc-0242ac120002', 0, 'Marketing'),
('ba79a54a-980e-11ed-a8fc-0242ac120002', 0, 'R&D'),
('ba79aab8-980e-11ed-a8fc-0242ac120002', 0, 'Legal'),
('ba79ac5c-980e-11ed-a8fc-0242ac120002', 0, 'Business development'),
('ba79ae00-980e-11ed-a8fc-0242ac120002', 0, 'Paid holiday'),
('ba79af86-980e-11ed-a8fc-0242ac120002', 0, 'Vacation'),
('ba79b1ac-980e-11ed-a8fc-0242ac120002', 0, 'Sick day'),
('ba79b33c-980e-11ed-a8fc-0242ac120002', 0, 'Other'),
('ba79b49a-980e-11ed-a8fc-0242ac120002', 1, 'Infrastructure'),
('ba79b95e-980e-11ed-a8fc-0242ac120002', 2, 'Mass adoption'),
('ba79bb16-980e-11ed-a8fc-0242ac120002', 3, 'Financial service'),
('ba79bca6-980e-11ed-a8fc-0242ac120002', 4, 'Clients');
INSERT INTO subproject ( id, project_number, name )
VALUES
('0dd30d26-980f-11ed-a8fc-0242ac120002', 1, 'IT'),
('0dd30b64-980f-11ed-a8fc-0242ac120002', 1, 'Block Production'),
('0dd309de-980f-11ed-a8fc-0242ac120002', 1, 'API'),
('0dd307c2-980f-11ed-a8fc-0242ac120002', 2, 'Pomelo'),
('0dd2ff5c-980f-11ed-a8fc-0242ac120002', 2, 'GEMS'),
('0dd2fe30-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - ENF Community Engagement'),
('0dd2fd40-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - VanCity Outbreak'),
('0dd2fc1e-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Provinz'),
('0dd2fade-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Street Gems'),
('0dd2f9c6-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Dream Big Art Challenge'),
('0dd2f8a4-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - GBK Chestahedrons'),
('0dd2ec10-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Kings of Quotes'),
('0dd2eda0-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Stikki & Stella Peaches'),
('0dd2ef1c-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - MySeat'),
('0dd2f08e-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Metaverse - CryptoVoxels'),
('0dd2f714-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Metaverse - Somnium'),
('0dd2ea76-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Metaverse - Upland'),
('0dd2e8dc-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Metaverse - The SandBox'),
('0dd2e710-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Metaverse - Uplift World'),
('0dd2df0e-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Metaverse - MVMF'),
('0dd2dd6a-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Gavinski drop'),
('0dd2dbc6-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Thangka drop'),
('0dd2b498-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - CYA'),
('0dd2b92a-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Ocean Defenders'),
('0dd2bab0-980f-11ed-a8fc-0242ac120002', 2, 'GEMS - Heidi NFT drop'),
('0dd2c0aa-980f-11ed-a8fc-0242ac120002', 3, 'SX'),
('0dd2c23a-980f-11ed-a8fc-0242ac120002', 4, 'EOS Nation inc'),
('0dd2c38e-980f-11ed-a8fc-0242ac120002', 4, '11066196 Canada inc'),
('0dd2c4e2-980f-11ed-a8fc-0242ac120002', 4, 'EOS Network Foundation');
INSERT INTO employee ( id, email, first_name, last_name, reports_to, start_date )
VALUES
('KU6LhC51L1XNulT52E6jaepsseI2', 'marieeve.castonguay@gmail.com', 'Marie-Eve', 'Castonguay', 'KU6LhC51L1XNulT52E6jaepsseI2', '2023-01-01'),
('JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', 'antoinelaberge16@gmail.com', 'Antoine', 'Laberge', 'JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', '2023-01-01'),
('LJQN6QBTWOYz83FC1HgNyi6KYBK2', 'adambeliveau16@gmail.com', 'Adam', 'Beliveau', 'LJQN6QBTWOYz83FC1HgNyi6KYBK2', '2023-01-01'),
('1Y0c3KMXVwNEU47XHTb1MPNfjAy1', 'faundez.joaquin@gmail.com','Joaquin', 'Faundez-Flores', '1Y0c3KMXVwNEU47XHTb1MPNfjAy1', '2023-01-01'),
('wdPtphMQaCbMI01BIX3i0jEm6ec2', 'pels1201@gmail.com', 'Simon', 'Pelletier', 'wdPtphMQaCbMI01BIX3i0jEm6ec2', '2023-01-01'),
('vndE887ZRTO7ksluA7COWsiitdx1', 'chac0902@usherbrooke.ca', 'Cedric', 'Charron', 'vndE887ZRTO7ksluA7COWsiitdx1', '2023-01-01'),
('9tZTXXEa3PVuubmVFdw63cFhUVq1', 'jordlepatineur@gmail.com', 'Jordan', 'Choquet', '9tZTXXEa3PVuubmVFdw63cFhUVq1', '2023-01-01'),
('xNVk48UQ7VXqaPWrgFDqFzd5GGK2', 'degoede.jonathan@gmail.com', 'Jonathan', 'Degeode', 'xNVk48UQ7VXqaPWrgFDqFzd5GGK2', '2023-01-01'),
('OQ7LomNuqBWvMq14SE8TP6x9NUb2', 'aurora@groupes.usherbrooke.ca', 'Aurora', 'Superuser', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2', '2023-01-01');
INSERT INTO expense_type (id, name)
VALUES 
('d7185478-7c62-4a7c-9ea9-6677c48d4f51', 'Do not know'),
('b4cda788-54e5-4a2a-9b9c-8c73a6092237', 'Association fees'),
('f44eb8a5-1e16-45ce-9b9c-dde60eaa5a5c', 'Convention & Seminars expenses'),
('b97aee6f-3d87-4b43-b86b-46eb6c962de6', 'Delivery, freight and express'),
('97a3c3f3-79f9-4d05-9546-929c96d16f6b', 'Hardware & Server Costs'),
('a60b34a9-9f7c-4485-b5c5-70f5d5e10b8d', 'Cloud Server Cost'),
('40d26b69-7121-4eab-b7d7-05d8fa7a844f', 'Data Center Cost'),
('d9cc0f7d-eb4e-4c3d-aa94-4c2f3e6aa29a', 'Entertainment expenses - Non deductible'),
('de39b52e-8705-41c8-ba50-ebc6cb0aa58e', 'Hotel & Lodging Expense'),
('2d14470a-90e5-42f5-a5f2-e742dfdd77cb', 'Marketing and promotion expenses'),
('c7d9251a-88b7-439f-9c5a-29d0cbfb2f62', 'Meal & Entertainment expenses - Company events - 100%'),
('3a5b5cb5-963e-49ed-8986-7c87ba34fc00', 'Meal & Entertainment expenses - Regular - 50%'),
('ed53f7e8-8a71-45ee-b417-c5f5de5a819a', 'Miscellaneous'),
('5ebd96eb-0d75-4d0e-b225-cf238dd96d8a', 'Office Supplies - General'),
('1b0d2c77-764c-4c39-a6ea-4d0b96c8b9b1', 'Office Supplies - Hardware'),
('2a166c8a-ba62-4b01-9e87-88da8f9de4a4', 'Phones & Internet expenses'),
('b8d3f3c3-cfeb-4d34-8c8e-b2c6c1a38d7e', 'Professional fees'),
('7f29324a-c90d-46f5-8f3a-3c3cf51f7b97', 'Software licenses & subscriptions'),
('0b60d0f2-1468-4239-a57e-2330b1d8f11a', 'Training expenses'),
('fd12a6d8-6a60-4a4f-b9c4-3b75e67d86fd', 'Travel expense - Auto rental, Train, Uber'),
('7d5bfb8e-5f36-46b9-9b45-43a60153b57e', 'Travel expense - Flight'),
('4fb8c414-14d6-45fc-a2f8-799e32c06d28', 'Travel expense - Fuel costs'),
('45b4846e-1d91-4369-a0a3-8c3d3a068e14', 'Travel expense - Ground'),
('fc1a2a87-6c22-4bfb-8ce7-c6e76d6a55a6', 'Travel expense - Motor vehicle expenses'),
('068d76de-f9a8-4413-b3e3-f70687c901d6', 'Travel Expense & Meal - 100%');
INSERT INTO remuneration (employee_id, hourly_salary, currency, max_hours_per_week)
VALUES
('KU6LhC51L1XNulT52E6jaepsseI2', '10.0', 'CAD', '40.0'),
('JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', '10.0', 'CAD', '40.0'),
('LJQN6QBTWOYz83FC1HgNyi6KYBK2', '10.0', 'CAD', '40.0'),
('1Y0c3KMXVwNEU47XHTb1MPNfjAy1', '10.0', 'CAD', '40.0'),
('wdPtphMQaCbMI01BIX3i0jEm6ec2', '10.0', 'CAD', '40.0'),
('vndE887ZRTO7ksluA7COWsiitdx1', '10.0', 'CAD', '40.0'),
('9tZTXXEa3PVuubmVFdw63cFhUVq1', '10.0', 'CAD', '40.0'),
('xNVk48UQ7VXqaPWrgFDqFzd5GGK2', '10.0', 'CAD', '40.0'),
('OQ7LomNuqBWvMq14SE8TP6x9NUb2', '10.0', 'CAD', '40.0');
INSERT INTO wallet (employee_id, wallet_id, type)
VALUES
('KU6LhC51L1XNulT52E6jaepsseI2','4756cb08-9811-11ed-a8fc-0242ac120004','bitcoin');
INSERT INTO timesheet (id, employee_id, status, payed, start_date, end_date) 
VALUES 
  ('59c369de-6bd2-44ed-b775-802f070e402c', 'KU6LhC51L1XNulT52E6jaepsseI2', 'draft','FALSE', '2023-01-01', null),
  ('e322e077-5e11-4f95-aa54-6fd27e9db393', 'JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', 'draft','FALSE', '2023-01-01', null),
  ('6466236e-d2df-4630-869e-cfcb31db9ae0', 'LJQN6QBTWOYz83FC1HgNyi6KYBK2', 'draft','FALSE', '2023-01-01', null),
  ('3bff591c-41f0-4913-acec-5638c21d650e', '1Y0c3KMXVwNEU47XHTb1MPNfjAy1', 'draft','FALSE', '2023-01-01', null),
  ('c60018d3-eab0-4769-9bf3-7ea3a618579c', 'wdPtphMQaCbMI01BIX3i0jEm6ec2', 'draft','FALSE', '2023-01-01', null),
  ('9e9edce2-cab7-4910-b5ef-7a08f14711f0', 'vndE887ZRTO7ksluA7COWsiitdx1', 'draft','FALSE', '2023-01-01', null),
  ('2e77b4d7-1be8-41a7-ae16-c3999d2a151f', '9tZTXXEa3PVuubmVFdw63cFhUVq1', 'draft','FALSE', '2023-01-01', null),
  ('2d13b44d-6998-4235-9ceb-93ef73dc04a8', 'xNVk48UQ7VXqaPWrgFDqFzd5GGK2', 'draft','FALSE', '2023-01-01', null),
  ('1304012f-5c4b-494b-97e1-4b26d0dc87f3', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2', 'draft','FALSE', '2023-01-01', null);
INSERT INTO review ( id, report_id, comments, reviewer_id, updated_at, updated_by, is_timesheet)
VALUES
('a47a287f-2e6c-4699-a3e1-70b0c712cee1','59c369de-6bd2-44ed-b775-802f070e402c', 'no comments', 'KU6LhC51L1XNulT52E6jaepsseI2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('b47a287f-2e6c-4699-a3e1-70b0c712cee2','e322e077-5e11-4f95-aa54-6fd27e9db393', 'no comments', 'JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('c47a287f-2e6c-4699-a3e1-70b0c712cee3','6466236e-d2df-4630-869e-cfcb31db9ae0', 'no comments', 'LJQN6QBTWOYz83FC1HgNyi6KYBK2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('d47a287f-2e6c-4699-a3e1-70b0c712cee4','3bff591c-41f0-4913-acec-5638c21d650e', 'no comments', '1Y0c3KMXVwNEU47XHTb1MPNfjAy1', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('e47a287f-2e6c-4699-a3e1-70b0c712cee5','c60018d3-eab0-4769-9bf3-7ea3a618579c', 'no comments', 'wdPtphMQaCbMI01BIX3i0jEm6ec2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('f47a287f-2e6c-4699-a3e1-70b0c712cee6','9e9edce2-cab7-4910-b5ef-7a08f14711f0', 'no comments', 'vndE887ZRTO7ksluA7COWsiitdx1', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('a47a287f-2e6c-4699-a3e1-70b0c712cee7','2e77b4d7-1be8-41a7-ae16-c3999d2a151f', 'no comments', '9tZTXXEa3PVuubmVFdw63cFhUVq1', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('a47a287f-2e6c-4699-a3e1-70b0c712cee8','2d13b44d-6998-4235-9ceb-93ef73dc04a8', 'no comments', 'xNVk48UQ7VXqaPWrgFDqFzd5GGK2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('a47a287f-2e6c-4699-a3e1-70b0c712cee9','1304012f-5c4b-494b-97e1-4b26d0dc87f3', 'no comments', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE);

-- create roles and grant permissions

CREATE GROUP readonly_group;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_group;

CREATE ROLE aurora_timesheet WITH LOGIN PASSWORD 'postgres' IN GROUP readonly_group;
CREATE ROLE aurora_expenses WITH LOGIN PASSWORD 'postgres' IN GROUP readonly_group;
CREATE ROLE aurora_git WITH LOGIN PASSWORD 'postgres' IN GROUP readonly_group;
CREATE ROLE aurora_organization WITH LOGIN PASSWORD 'postgres' IN GROUP readonly_group;

GRANT INSERT, UPDATE, DELETE  ON timesheet, review, contribution TO aurora_timesheet;
GRANT INSERT, UPDATE, DELETE  ON expense, report, review, expense_type, mileage TO aurora_expenses;
GRANT INSERT, UPDATE, DELETE  ON github_credentials TO aurora_git;
GRANT INSERT, UPDATE, DELETE  ON activity, employee, project, remuneration, subproject, wallet TO aurora_organization;
GRANT USAGE, SELECT ON SEQUENCE remuneration_id_seq, wallet_id_seq TO aurora_organization;