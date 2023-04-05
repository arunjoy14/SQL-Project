CREATE SCHEMA "covid";

CREATE TABLE "covid"."source" (
  "source_id" int,
  "source_name" varchar,
  "source_website" varchar,
  PRIMARY KEY ("source_id")
);

CREATE TABLE "covid"."locations" (
  "location_id" int ,
  "location_name" varchar,
  "iso_code" varchar,
  "last_observation_date" date,
  "source_id" int,
  PRIMARY KEY ("location_id")
);

CREATE TABLE "covid"."vaccines" (
  "vaccine_id" int PRIMARY KEY,
  "vaccine_name" varchar
);

CREATE TABLE "covid"."vaccination_location" (
  "location_id" int,
  "vaccine_id" int,
  "total_supplied" int
);

CREATE TABLE "covid"."vaccination" (
  "location_id" int,
  "date_vaccine" date,
  "vaccine_id" int,
  "total_vaccinations" int,
  "people_fully_vaccinated" int,
  "people_partially_vaccinated" int,
  PRIMARY KEY ("location_id", "date_vaccine", "vaccine_id")
);

ALTER TABLE "covid"."locations" ADD FOREIGN KEY ("source_id") REFERENCES "covid"."source" ("source_id");

ALTER TABLE "covid"."vaccination_location" ADD FOREIGN KEY ("location_id") REFERENCES "covid"."locations" ("location_id");

ALTER TABLE "covid"."vaccination_location" ADD FOREIGN KEY ("vaccine_id") REFERENCES "covid"."vaccines" ("vaccine_id");

ALTER TABLE "covid"."vaccination" ADD FOREIGN KEY ("location_id") REFERENCES "covid"."locations" ("location_id");

ALTER TABLE "covid"."vaccination" ADD FOREIGN KEY ("vaccine_id") REFERENCES "covid"."vaccines" ("vaccine_id");