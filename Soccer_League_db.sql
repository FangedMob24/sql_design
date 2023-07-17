-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/lzHJzL
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Teams" (
    "ID" int   NOT NULL,
    "Name" text   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Goals" (
    "ID" int   NOT NULL,
    "Points" int   NOT NULL,
    "PlayerID" int   NOT NULL,
    "MatchID" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Players" (
    "ID" int   NOT NULL,
    "First_name" text   NOT NULL,
    "Last_name" text   NOT NULL,
    "TeamID" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Matches" (
    "ID" int   NOT NULL,
    "Team1" int   NOT NULL,
    "Team2" int   NOT NULL,
    "DateID" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Schedule" (
    "ID" int   NOT NULL,
    "StartDate" date   NOT NULL,
    "EndDate" date   NOT NULL,
    CONSTRAINT "pk_Schedule" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Referees" (
    "ID" int   NOT NULL,
    "First_name" text   NOT NULL,
    "Last_name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Referee_Match" (
    "ID" int   NOT NULL,
    "RefereeID" int   NOT NULL,
    "MatchID" int   NOT NULL,
    CONSTRAINT "pk_Referee_Match" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Rankings" (
    "ID" int   NOT NULL,
    "MatchID" int   NOT NULL,
    "Winner" int   NOT NULL,
    CONSTRAINT "pk_Rankings" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_PlayerID" FOREIGN KEY("PlayerID")
REFERENCES "Players" ("ID");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Matches" ("ID");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_TeamID" FOREIGN KEY("TeamID")
REFERENCES "Teams" ("ID");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_DateID" FOREIGN KEY("DateID")
REFERENCES "Schedule" ("ID");

ALTER TABLE "Referee_Match" ADD CONSTRAINT "fk_Referee_Match_RefereeID" FOREIGN KEY("RefereeID")
REFERENCES "Referees" ("ID");

ALTER TABLE "Referee_Match" ADD CONSTRAINT "fk_Referee_Match_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Matches" ("ID");

ALTER TABLE "Rankings" ADD CONSTRAINT "fk_Rankings_MatchID" FOREIGN KEY("MatchID")
REFERENCES "Matches" ("ID");

ALTER TABLE "Rankings" ADD CONSTRAINT "fk_Rankings_Winner" FOREIGN KEY("Winner")
REFERENCES "Teams" ("ID");

