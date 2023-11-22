DELETE FROM contribution
WHERE timesheet_id IN (
	SELECT id
	FROM timesheet
	WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' )
);

DELETE FROM expense
WHERE report_id IN (
	SELECT id
	FROM report
	WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' )
);
DELETE FROM mileage
WHERE report_id IN (
	SELECT id
	FROM report
	WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' )
);

DELETE FROM review
WHERE report_id IN (
	SELECT id FROM report
	WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' )
	UNION
	SELECT id FROM timesheet
	WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' )
);

DELETE FROM timesheet
WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' );

DELETE FROM report
WHERE employee_id IN ('dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1' );

INSERT INTO timesheet(id, employee_id, status, payed, start_date, end_date) 
VALUES
  ('2e77b4d7-1be8-41a7-ae16-c3999d2a1565', 'dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'draft','FALSE', '2023-01-01', null),
  ('2d13b44d-6998-4235-9ceb-93ef73dc0466', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'draft','FALSE', '2023-01-01', null),
  ('1304012f-5c4b-494b-97e1-4b26d0dc8767', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1', 'draft','FALSE', '2023-01-01', null);

INSERT INTO review ( id, report_id, comments, reviewer_id, updated_at, updated_by, is_timesheet)
VALUES
('a47a287f-2e6c-4699-a3e1-70b0c712ce78','2e77b4d7-1be8-41a7-ae16-c3999d2a1565', 'no comments', 'dYvmmHAgIbOqpXjrrBMd4UA8yAB2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('b47a287f-2e6c-4699-a3e1-70b0c712ce79','2d13b44d-6998-4235-9ceb-93ef73dc0466', 'no comments', 'dYvmmHAgIbOqpXjrrBMd4UA8yAB2', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE),
('c47a287f-2e6c-4699-a3e1-70b0c712ce80','1304012f-5c4b-494b-97e1-4b26d0dc8767', 'no comments', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', CURRENT_TIMESTAMP, 'f2f071e8-95bf-11ed-a1eb-0242ac120002', TRUE);