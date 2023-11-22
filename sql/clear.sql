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

INSERT INTO timesheet
VALUES
  ('2e77b4d7-1be8-41a7-ae16-c3999d2a1545', 'dYvmmHAgIbOqpXjrrBMd4UA8yAB2', 'draft','FALSE', '2023-01-01', null, null, null, 0, 0, 0, null),
  ('2d13b44d-6998-4235-9ceb-93ef73dc0446', 'ZRFiYaPe1lgaRUMOuMPOYvfywfi1', 'draft','FALSE', '2023-01-01', null, null, null, 0, 0, 0, null),
  ('1304012f-5c4b-494b-97e1-4b26d0dc8747', 'Sx4ukvieqcZsU7pyhl23eRvSsoi1', 'draft','FALSE', '2023-01-01', null, null, null, 0, 0, 0, null);
