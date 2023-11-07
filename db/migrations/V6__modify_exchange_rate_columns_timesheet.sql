-- Remove extra column that won't be used
ALTER TABLE timesheet
DROP COLUMN eos2cad_exchange_rate;

-- Add new exchange rate columns (salary can only be in usd/cad and payments can be done in eos/cad/usd)
ALTER TABLE timesheet
ADD usd2eos_exchange_rate FLOAT NOT NULL DEFAULT 0.0,
ADD usd2cad_exchange_rate FLOAT NOT NULL DEFAULT 0.0;

-- Add new currency column
ALTER TABLE timesheet
ADD timesheet_currency VARCHAR(255);