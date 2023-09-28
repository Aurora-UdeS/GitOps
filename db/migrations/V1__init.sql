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
    "id" UUID PRIMARY KEY, 
    "to" VARCHAR(255) NOT NULL,
    "from" VARCHAR(255) NOT NULL,
    "amount" VARCHAR(255) NOT NULL,
    "timesheet_id" VARCHAR(255) NOT NULL,
    "email_sent" BOOLEAN NOT NULL DEFAULT FALSE
);