-- total asset non current values from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00112' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE a.financial_statement LIKE 'bs' AND
                a.current_noncurrent LIKE 'nc' AND
                a.asset_liability_equity LIKE 'a' AND
                a.sum_value = FALSE) 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;


-- #########################################################################
-- 
-- total asset current values from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00126' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE a.financial_statement LIKE 'bs' AND
                a.current_noncurrent LIKE 'c' AND
                a.asset_liability_equity LIKE 'a' AND
                a.sum_value = FALSE) 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;

-- #########################################################################
-- 
-- total equity values from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00139' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE a.financial_statement LIKE 'bs' AND
                a.asset_liability_equity LIKE 'e' AND
                a.sum_value = FALSE) 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;

-- #########################################################################
-- 
-- total non current liabilities values from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00145' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE a.financial_statement LIKE 'bs' AND
                a.current_noncurrent LIKE 'nc' AND
                a.asset_liability_equity LIKE 'p' AND
                a.sum_value = FALSE) 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;

-- #########################################################################
-- 
-- total current liabilities values from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00156' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE a.financial_statement LIKE 'bs' AND
                a.current_noncurrent LIKE 'c' AND
                a.asset_liability_equity LIKE 'p' AND
                a.sum_value = FALSE) 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;


-- #########################################################################
-- 
-- total total liabilities from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00157' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE a.financial_statement LIKE 'bs' AND
                a.asset_liability_equity LIKE 'p' AND
                a.sum_value = FALSE) 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;

-- #########################################################################
-- 
-- total total liabilities & equity from ledger
INSERT INTO statements (account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 
    'A00158' AS account,
    vat_number,
    year,
    month,
    -- COALESCE allows to create an option when the value returns NULL
    COALESCE(SUM(value),0) AS value
FROM 
    statements AS s,(
            SELECT ies_id
            FROM account AS a
            WHERE 
                a.asset_liability_equity LIKE 'p' OR 
                a.asset_liability_equity LIKE 'e   ') 
        AS f
        
WHERE s.account = f.ies_id AND month != 12
GROUP BY vat_number,year,month

 EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month, value
    FROM 
        statements;