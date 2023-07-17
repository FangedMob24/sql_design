-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lzHJzL
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Posts" (
    "ID" int   NOT NULL,
    "title" text   NOT NULL,
    "description" text   NOT NULL,
    "UserID" int   NOT NULL,
    "LocationID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "CategoriesID" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Regions" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Users" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    "Preferred_region" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Categories" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Locations" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    "RegionID" int   NOT NULL,
    CONSTRAINT "pk_Locations" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_UserID" FOREIGN KEY("UserID")
REFERENCES "Users" ("ID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_LocationID_RegionID" FOREIGN KEY("LocationID", "RegionID")
REFERENCES "Locations" ("ID", "RegionID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_CategoriesID" FOREIGN KEY("CategoriesID")
REFERENCES "Categories" ("ID");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_Preferred_region" FOREIGN KEY("Preferred_region")
REFERENCES "Regions" ("ID");

ALTER TABLE "Locations" ADD CONSTRAINT "fk_Locations_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Regions" ("ID");

