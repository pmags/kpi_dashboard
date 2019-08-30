
-- SQL script that creats financial statement from ledger and adds it to statement table
-- To work the script has to achieve the following: 
-- 
-- 1. Sums ledger values with similiar ies code
-- 2. Only include values that are not included yet on table statements
-- 3. Insert the query result into the table statements

INSERT INTO statements (input_method,account,vat_number,year,month,value)
-- selects all columns from the query result
SELECT 'ledger' AS input_method, *
FROM (
    -- sums all values based on fs_account (ies code)
    SELECT 
        ac.fs_account AS account,
        l.vat_number,
        l.year,
        l.month,
        -- COALESCE allows to create an option when the value returns NULL
        COALESCE(SUM(l.value),0) AS value
    FROM 
        -- Joins both tables for this query
        ledger AS l, 
        account_chart AS ac
    WHERE 
        -- Where the ledger account is equal on both tables
        l.account_chart = ac.ldg_account 
    GROUP BY 
        -- Group by ies account, year, month and vat_number 
        -- (all of them have to be present because they were select)
        ac.fs_account,  l.vat_number, l.year, l.month
    
    -- the except function returns all values which are included on query 1 but not on query 2
    EXCEPT

    -- Query 2 selects all values of table statements
    SELECT 
        account,vat_number,year,month,value
    FROM 
        statements

    ) AS bs;

