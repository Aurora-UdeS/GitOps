ALTER TABLE report
ADD eos2cad_exchange_rate FLOAT NOT NULL DEFAULT 0.0,
ADD usd2cad_exchange_rate FLOAT NOT NULL DEFAULT 0.0,
ADD cad2eos_exchange_rate FLOAT NOT NULL DEFAULT 0.0,
ADD usd2eos_exchange_rate FLOAT NOT NULL DEFAULT 0.0;

ALTER TABLE timesheet
ADD eos2cad_exchange_rate FLOAT NOT NULL DEFAULT 0.0,
ADD cad2eos_exchange_rate FLOAT NOT NULL DEFAULT 0.0;
