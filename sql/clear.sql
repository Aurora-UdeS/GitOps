DELETE FROM contribution
WHERE timesheet_id IN (
	SELECT id
	FROM timesheet
	WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' )
);

DELETE FROM expense
WHERE report_id IN (
	SELECT id
	FROM report
	WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' )
);
DELETE FROM mileage
WHERE report_id IN (
	SELECT id
	FROM report
	WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' )
);

DELETE FROM review
WHERE report_id IN (
	SELECT id FROM report
	WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' )
	UNION
	SELECT id FROM timesheet
	WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' )
);

DELETE FROM timesheet
WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' );

DELETE FROM report
WHERE employee_id IN ('dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', '1u86JKdbFwVvMOQ9BXRehMKDxtI2' );

INSERT INTO timesheet
VALUES
  ('2e77b4d7-1be8-41a7-ae16-c3999d2a1512', 'dQ4SX8d6K2MCLeYL5i1f6VVbzEm1', 'draft','FALSE', '2023-01-01', null),
  ('2d13b44d-6998-4235-9ceb-93ef73dc04a3', 'dm46ZTknTiNcBoT5TuxqupUBv1v2', 'draft','FALSE', '2023-01-01', null),
  ('1304012f-5c4b-494b-97e1-4b26d0dc87f4', '1u86JKdbFwVvMOQ9BXRehMKDxtI2', 'draft','FALSE', '2023-01-01', null);
