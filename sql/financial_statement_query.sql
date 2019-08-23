-- Query to create a balance sheet from a ledger
-- We use a double query in order to get as output a table with the ies code, name and value
-- The query inside FROM will agregate sum all values with similiar ies code
-- The outside query will join the account name
SELECT t."codigo ies", a.name_pt, t.total
FROM (
    SELECT 
        ac.fs_account AS "codigo ies",
        -- COALESCE allows to create an option when the value returns NULL
        COALESCE(SUM(l.value),0) AS total
    FROM 
        -- Joins both tables for this query
        ledger AS l, 
        account_chart AS ac
    WHERE 
        -- Where the ledger account is equal on both tables
        l.account_chart = ac.ldg_account
    GROUP BY 
        -- Group by ies account
        ac.fs_account
) AS t
INNER JOIN account AS a
ON t."codigo ies"=a.ies_id
WHERE a.financial_statement = 'bs'; 



-- Query to create a profit & loss statement from a ledger
-- We use a double query in order to get as output a table with the ies code, name and value
-- The query inside FROM will agregate sum all values with similiar ies code
-- The outside query will join the account name
SELECT t."codigo ies", a.name_pt, t.total
FROM (
    SELECT 
        ac.fs_account AS "codigo ies",
        -- COALESCE allows to create an option when the value returns NULL
        COALESCE(SUM(l.value),0) AS total
    FROM 
        -- Joins both tables for this query
        ledger AS l, 
        account_chart AS ac
    WHERE 
        -- Where the ledger account is equal on both tables
        l.account_chart = ac.ldg_account
    GROUP BY 
        -- Group by ies account
        ac.fs_account
) AS t
INNER JOIN account AS a
ON t."codigo ies"=a.ies_id
WHERE a.financial_statement = 'pl'; 