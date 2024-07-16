-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "category" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category" VARCHAR(50)   NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp  NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory" VARCHAR(50)   NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp  NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(50)   NOT NULL,
    "description" VARCHAR(100)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" VARCHAR(25)   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" VARCHAR(5)   NOT NULL,
    "currency" VARCHAR(5)   NOT NULL,
    "launched_date" TIMESTAMP   NOT NULL,
    "end_date" TIMESTAMP   NOT NULL,
    "category_id" VARCHAR(10)   NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp  NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(25)   NOT NULL,
    "last_name" VARCHAR(25)   NOT NULL,
    "email" VARCHAR(50)   NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp  NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

