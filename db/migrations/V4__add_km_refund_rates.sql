CREATE TABLE km_rate(
    "id" UUID PRIMARY KEY, 
    "threshold" INTEGER NOT NULL DEFAULT 5000,
    "before" DOUBLE PRECISION NOT NULL DEFAULT 0.68,
    "after" DOUBLE PRECISION NOT NULL DEFAULT 0.62
);
INSERT INTO km_rate (id, threshold, before, after)
VALUES
('185871ae-9810-11ed-a8fc-0242ac120002', '5000', '0.68', '0.62');