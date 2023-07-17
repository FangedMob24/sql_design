-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lzHJzL
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Medical_Centers" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    "Address1" string   NOT NULL,
    CONSTRAINT "pk_Medical_Centers" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Doctors" (
    "DoctorID" int   NOT NULL,
    "First_Name" text   NOT NULL,
    "Last_Name" text   NOT NULL,
    "MedicalCenterID" int   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "DoctorID"
     )
);

CREATE TABLE "Patients" (
    "PatientID" int   NOT NULL,
    "OrderID" int   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Diseases" (
    "DiseaseID" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "DiseaseID"
     )
);

CREATE TABLE "Patient_disease" (
    "ID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    "DiseaseID" int   NOT NULL,
    CONSTRAINT "pk_Patient_disease" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Patient_Doctor" (
    "ID" int   NOT NULL,
    "DoctorID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    CONSTRAINT "pk_Patient_Doctor" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_MedicalCenterID" FOREIGN KEY("MedicalCenterID")
REFERENCES "Medical_Centers" ("ID");

ALTER TABLE "Patient_disease" ADD CONSTRAINT "fk_Patient_disease_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

ALTER TABLE "Patient_disease" ADD CONSTRAINT "fk_Patient_disease_DiseaseID" FOREIGN KEY("DiseaseID")
REFERENCES "Diseases" ("DiseaseID");

ALTER TABLE "Patient_Doctor" ADD CONSTRAINT "fk_Patient_Doctor_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctors" ("DoctorID");

ALTER TABLE "Patient_Doctor" ADD CONSTRAINT "fk_Patient_Doctor_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patients" ("PatientID");

