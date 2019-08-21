CREATE TABLE "company" (
  "vatNumber" integer UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar(250),
  "street" varchar(250),
  "zipCode" varchar(10),
  "city" varchar(50),
  "country" varchar(15)
);
CREATE TABLE "account" (
  "iesID" varchar(10) PRIMARY KEY NOT NULL,
  "name" varchar(250) NOT NULL,
  "financialStatement" varchar(5),
  "current_NonCurrent" varchar(10),
  "AssetLiabilityEquity" varchar(10)
);
COMMENT ON COLUMN "account"."iesID" IS 'Código conforme declaração IES';
COMMENT ON COLUMN "account"."name" IS 'Nome conforme demonstrações financeiras';
COMMENT ON COLUMN "account"."financialStatement" IS 'bs para Balanço e pl para Demonstração de resultados';
COMMENT ON COLUMN "account"."current_NonCurrent" IS 'C para corrente e NC para não corrente ';
COMMENT ON COLUMN "account"."AssetLiabilityEquity" IS 'A para ativo, P para passivo e E para capital ';
CREATE TABLE "balanceSheet" (
  "bsID" serial PRIMARY KEY,
  "vatNumber_fk" integer NOT NULL,
  "accountID" varchar(250) NOT NULL,
  "year" int,
  "month" int,
  "value" float(2)
);
CREATE TABLE "profitLoss" (
  "plID" serial PRIMARY KEY,
  "vatNumber_fk" integer NOT NULL,
  "accountID" varchar(250) NOT NULL,
  "year" int,
  "month" int,
  "value" float(2)
);
CREATE TABLE "ledger" (
  "ledgerID" serial PRIMARY KEY,
  "vatNumber_fk" integer NOT NULL,
  "accountID" varchar(250) NOT NULL,
  "year" int,
  "month" int,
  "value" float(2)
);
ALTER TABLE
  "balanceSheet"
ADD
  CONSTRAINT "company_fkey" FOREIGN KEY ("vatNumber_fk") REFERENCES "company" ("vatNumber");
ALTER TABLE
  "profitLoss"
ADD
  CONSTRAINT "company_fkey" FOREIGN KEY ("vatNumber_fk") REFERENCES "company" ("vatNumber");
ALTER TABLE
  "ledger"
ADD
  CONSTRAINT "company_fkey" FOREIGN KEY ("vatNumber_fk") REFERENCES "company" ("vatNumber");
ALTER TABLE
  "ledger"
ADD
  CONSTRAINT "account_fkey" FOREIGN KEY ("accountID") REFERENCES "account" ("iesID");
ALTER TABLE
  "balanceSheet"
ADD
  CONSTRAINT "account_fkey" FOREIGN KEY ("accountID") REFERENCES "account" ("iesID");
ALTER TABLE
  "profitLoss"
ADD
  CONSTRAINT "account_fkey" FOREIGN KEY ("accountID") REFERENCES "account" ("iesID");