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
INSERT INTO employee ( id, first_name, last_name, reports_to )
VALUES
('KU6LhC51L1XNulT52E6jaepsseI2', 'Marie-Eve', 'Castonguay', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', 'Antoine', 'Laberge', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('LJQN6QBTWOYz83FC1HgNyi6KYBK2', 'Adam', 'Beliveau', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('49VzgEJmQJMMPfVpcj9CVgyJx8F3', 'Joaquin', 'Faundez-Flores', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('u5j6A3PeS5Mf0OCr1e27pdpgrOH3', 'Simon', 'Pelletier', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('vndE887ZRTO7ksluA7COWsiitdx1', 'Cedric', 'Charron', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('9tZTXXEa3PVuubmVFdw63cFhUVq1', 'Jordan', 'Choquet', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('xNVk48UQ7VXqaPWrgFDqFzd5GGK2', 'Jonathan', 'Degeode', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2'),
('OQ7LomNuqBWvMq14SE8TP6x9NUb2', 'Aurora', 'Superuser', 'OQ7LomNuqBWvMq14SE8TP6x9NUb2');
INSERT INTO report ( id, employee_id, name, status, created_at )
VALUES
('d47a287f-2e6c-4699-a3e1-70b0c712cee5', 'KU6LhC51L1XNulT52E6jaepsseI2', 'test report','not under review yet', CURRENT_TIMESTAMP);
INSERT INTO review ( id, report_id, status, comments, reviewer_id, updated_at, updated_by, is_expense)
VALUES
('496e191e-9b4f-11ed-a8fc-0242ac120002', 'd47a287f-2e6c-4699-a3e1-70b0c712cee5', 'draft', 'no comments', 'f2f071e8-95bf-11ed-a1eb-0242ac120002', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE);
INSERT INTO expense ( id, report_id, project_id, subproject_id, activity_id, amount, currency, description, date)
VALUES
('4756c0ae-9811-11ed-a8fc-0242ac120002','d47a287f-2e6c-4699-a3e1-70b0c712cee5','ba79bca6-980e-11ed-a8fc-0242ac120002','0dd2c23a-980f-11ed-a8fc-0242ac120002','185871ae-9810-11ed-a8fc-0242ac120002','50.5', 'CAD','itemized expense 1', NOW()),
('4756c91e-9811-11ed-a8fc-0242ac120002','d47a287f-2e6c-4699-a3e1-70b0c712cee5','ba79bca6-980e-11ed-a8fc-0242ac120002','0dd2c23a-980f-11ed-a8fc-0242ac120002','185871ae-9810-11ed-a8fc-0242ac120002','10.0', 'CAD','itemized expense 2', NOW()),
('4756cb08-9811-11ed-a8fc-0242ac120002','d47a287f-2e6c-4699-a3e1-70b0c712cee5','ba79bca6-980e-11ed-a8fc-0242ac120002','0dd2c23a-980f-11ed-a8fc-0242ac120002','185871ae-9810-11ed-a8fc-0242ac120002','5.0', 'CAD','itemized expense 3', NOW());
INSERT INTO role (name)
VALUES
('employee'),
('manager'),
('CEO');
INSERT INTO remuneration (employee_id, hourly_salary, max_hours_per_week)
VALUES
('KU6LhC51L1XNulT52E6jaepsseI2', '10.0', '40.0'),
('JAbUfiAVbuOOKZXUbJ2yqYzsdoN2', '10.0', '40.0'),
('LJQN6QBTWOYz83FC1HgNyi6KYBK2', '10.0', '40.0'),
('49VzgEJmQJMMPfVpcj9CVgyJx8F3', '10.0', '40.0'),
('u5j6A3PeS5Mf0OCr1e27pdpgrOH3', '10.0', '40.0'),
('vndE887ZRTO7ksluA7COWsiitdx1', '10.0', '40.0'),
('9tZTXXEa3PVuubmVFdw63cFhUVq1', '10.0', '40.0'),
('xNVk48UQ7VXqaPWrgFDqFzd5GGK2', '10.0', '40.0'),
('OQ7LomNuqBWvMq14SE8TP6x9NUb2', '10000.0', '1.0');
INSERT INTO wallet (employee_id, wallet_id, type)
VALUES
('KU6LhC51L1XNulT52E6jaepsseI2','4756cb08-9811-11ed-a8fc-0242ac120004','bitcoin');

