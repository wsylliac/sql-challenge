-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "departments_ID" VARCHAR   NOT NULL,
    "departments_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "departments_ID"
     )
);

CREATE TABLE "Department_Employees" (
    "employee_ID" INTEGER   NOT NULL,
    "departments_ID" VARCHAR   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "employee_ID" INTEGER   NOT NULL,
    "departments_ID" VARCHAR   NOT NULL
);

CREATE TABLE "Employees" (
    "employee_ID" INTEGER   NOT NULL,
    "titel_ID" INTEGER   NOT NULL,
    "birth_date" INTEGER   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" INTEGER   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_ID"
     )
);

CREATE TABLE "Salaries" (
    "employee_ID" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

CREATE TABLE "Titles" (
    "title_ID" INTEGER   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_ID"
     )
);

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_employee_ID" FOREIGN KEY("employee_ID")
REFERENCES "Employees" ("employee_ID");

ALTER TABLE "Department_Employees" ADD CONSTRAINT "fk_Department_Employees_departments_ID" FOREIGN KEY("departments_ID")
REFERENCES "Departments" ("departments_ID");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_employee_ID" FOREIGN KEY("employee_ID")
REFERENCES "Employees" ("employee_ID");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_departments_ID" FOREIGN KEY("departments_ID")
REFERENCES "Departments" ("departments_ID");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_titel_ID" FOREIGN KEY("titel_ID")
REFERENCES "Titles" ("title_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_ID" FOREIGN KEY("employee_ID")
REFERENCES "Employees" ("employee_ID");