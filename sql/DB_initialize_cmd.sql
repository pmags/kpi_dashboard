-- Creates database tables
-- Step 1. Main tables: company, ledger and statemnents
-- Company: information regarding each company as addresse
-- ledger: information for monthly ledger which will be used to prepare financial statements
-- statements: table containing year end balance sheet and profit & loss. statements based on ledger will be recorded here too.

-- Company table with information regarding each company
CREATE TABLE company (
  vat_number INTEGER NOT NULL,
  name VARCHAR(250),
  street VARCHAR(250),
  zipCode VARCHAR(10),
  city VARCHAR(50),
  country VARCHAR(15),
  UNIQUE (vat_number),
  PRIMARY KEY(vat_number)
);

-- Table with monthly ledger information
CREATE TABLE ledger (
  id SERIAL,
  vat_number INTEGER NOT NULL,
  year INTEGER,
  month INTEGER,
  account_chart INTEGER NOT NULL,
  value FLOAT(2),
  PRIMARY KEY(id)
);

-- Table with financial statements
CREATE TABLE statements (
  id SERIAL,
  vat_number INTEGER NOT NULL,
  account VARCHAR(250) NOT NULL,
  year INTEGER,
  month INTEGER,
  value FLOAT(2),
  PRIMARY KEY (id)
);


-- Step 2: second tear entities created for helping with the relationship

-- Information regarding each financial statment account
CREATE TABLE account (
  ies_id VARCHAR(10) NOT NULL,
  name_pt VARCHAR(250) NOT NULL,
  name_en VARCHAR(250),
  financial_statement VARCHAR(5),
  current_nonCurrent VARCHAR(10),
  asset_liability_equity VARCHAR(10),
  sum_value BOOLEAN,
  UNIQUE(ies_id),
  PRIMARY KEY (ies_id)
);
    -- Adds comments to table for future use
    COMMENT ON COLUMN account.ies_id IS 'Código conforme declaração IES';
    COMMENT ON COLUMN account.name_pt IS 'Nome conforme demonstrações financeiras';
    COMMENT ON COLUMN account.name_en IS 'Nome conforme SABI';
    COMMENT ON COLUMN account.financial_statement IS 'bs para Balanço e pl para Demonstração de resultados';
    COMMENT ON COLUMN account.current_nonCurrent IS 'C para corrente e NC para não corrente';
    COMMENT ON COLUMN account.asset_liability_equity IS 'A para ativo, P para passivo e E para capital';
    COMMENT ON COLUMN account.sum_value IS 'TRUE se o valor em causa resultar do somatório de outros valores';



-- Creates table that will connect ledger to financial statement accounts
CREATE TABLE account_chart (
  ldg_account INTEGER,
  fs_account VARCHAR(10),
  PRIMARY KEY (ldg_account, fs_account),
  UNIQUE (ldg_account)
);

-- Adds comments to table for future use
    COMMENT ON COLUMN account_chart.ldg_account IS 'Nº de conta conforme balancete';
    COMMENT ON COLUMN account_chart.fs_account IS 'Código da IES conforme definido na tabela account';

-- Step 3: Create table relations
-- For one-one: use constraint
-- For one-many: create foreign key at the end of relation
-- For many-many: creates a new table which documents this relationship

-- 3.1. ONE company can have MULTIPLE financial statements

ALTER TABLE statements ADD 
  CONSTRAINT statements_fkey
  FOREIGN KEY (vat_number)
  REFERENCES company (vat_number)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- 3.2. ONE company can have MULTIPLE financial statements (various years and months)
-- each financial statement can only be related to one company

ALTER TABLE ledger ADD
  CONSTRAINT ledger_fkey
  FOREIGN KEY (vat_number)
  REFERENCES company (vat_number)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- 3.3. Each ONE ledger entry can only have ONE account account chart id
-- but ONE account chart can have MULTIPLE ledger entries

ALTER TABLE ledger ADD
  CONSTRAINT ledger_accountchart_fkey
  FOREIGN KEY (account_chart)
  REFERENCES account_chart (ldg_account)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- 3.4. Each ONE statement entry can have only ONE account
-- but ONE account can have MULTIPLE statement entries

ALTER TABLE statements ADD
  CONSTRAINT statements_account_fkey
  FOREIGN KEY (account)
  REFERENCES account (ies_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- 3.5. ONE account can be compose by MULTIPLE ledger accounts
-- but each ledger account can only be associated with one account

ALTER TABLE account_chart ADD
  CONSTRAINT account_chart_ies_fkey
  FOREIGN KEY (fs_account)
  REFERENCES account (ies_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
