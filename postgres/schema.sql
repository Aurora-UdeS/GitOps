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
    "contributionId" UUID PRIMARY KEY,
    "date" DATE NOT NULL,
    "project_id" UUID NOT NULL,
    "client_id" UUID NOT NULL,
    "activity_id" UUID NOT NULL,
    "numberOfHours" DOUBLE PRECISION NOT NULL,
    "comments" VARCHAR(255) NOT NULL
);
CREATE TABLE employee(
    "id" VARCHAR(255) PRIMARY KEY,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL DEFAULT '',
    "github_username" VARCHAR(255) NOT NULL DEFAULT '',
    "is_active" BOOLEAN NOT NULL DEFAULT TRUE,
    "role_id" INTEGER NOT NULL DEFAULT 0,
    "reports_to" VARCHAR(255) NOT NULL
);
CREATE TABLE expense(
    "id" UUID PRIMARY KEY,
    "report_id" UUID NOT NULL,
    "project_id" UUID NOT NULL,
    "subproject_id" UUID,
    "activity_id" UUID NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "currency" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
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
    "max_hours_per_week" DOUBLE PRECISION NOT NULL
);
CREATE TABLE report(
    "id" UUID PRIMARY KEY,
    "employee_id" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "comments" VARCHAR(255),
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP,
    "updated_by" VARCHAR(255)
);
CREATE TABLE review(
    "id" UUID PRIMARY KEY,
    "report_id" UUID NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "comments" VARCHAR(255) NOT NULL,
    "reviewer_id" VARCHAR(255) NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    "updated_by" VARCHAR(255) NOT NULL,
    "is_expense" BOOLEAN NOT NULL DEFAULT FALSE,
    "is_timesheet" BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE role(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
CREATE TABLE timesheet(
    "id" UUID PRIMARY KEY,
    "employee_id" VARCHAR(255) NOT NULL,
    "review_id" UUID NOT NULL,
    "approved_at" TIMESTAMP NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "payed" BOOLEAN NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
CREATE TABLE wallet(
    "id" SERIAL PRIMARY KEY, 
    "employee_id" VARCHAR(255) NOT NULL,
    "wallet_id" VARCHAR(255) NOT NULL,
    "type" VARCHAR(255) NOT NULL
);