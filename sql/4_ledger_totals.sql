
-- This sql scripts calculates all subtotals from ledger information 
-- and inserts the results into statements table

INSERT INTO statements (input_method,account,vat_number,year,month,value)
SELECT 'ledger' AS input_method, flag AS account, vat_number, year, month, value
FROM(
    SELECT vat_number, 
        year, 
        month,
        CAST(sum(value) AS float) AS value,
        CASE 
            WHEN 
                a.current_noncurrent LIKE 'nc' AND
                a.asset_liability_equity LIKE 'a'
            THEN 'A00112'
            
            WHEN
                a.current_noncurrent LIKE 'c' AND
                a.asset_liability_equity LIKE 'a' 
            THEN 'A00125'

            WHEN
                a.current_noncurrent LIKE 'nc' AND
                a.asset_liability_equity LIKE 'p' 
            THEN 'A00145'

            WHEN
                a.current_noncurrent LIKE 'c' AND
                a.asset_liability_equity LIKE 'p' 
            THEN 'A00156'

            WHEN
                a.ebitda = TRUE
            THEN 'A00018'
            
            ELSE 'unk'
        END AS flag
    FROM statements AS s
    INNER JOIN account AS a
    ON account = ies_id
    WHERE sum_value = FALSE AND s.input_method NOT LIKE 'import'
    -- based on groups/flags created above it sums values
    GROUP BY vat_number, year, month, flag

    UNION ALL

    SELECT vat_number, 
        year, 
        month,
        CAST(sum(value) AS float) AS value,
        CASE

            WHEN 
                a.asset_liability_equity LIKE 'a'
            THEN 'A00126' 
            
            WHEN 
                a.asset_liability_equity LIKE 'p'
            THEN 'A00157'

            WHEN
                a.asset_liability_equity LIKE 'e'
            THEN 'A00139'

            WHEN
                a.ebit = TRUE
            THEN 'A00021'

            ELSE 'unk'
        END AS flag
    FROM statements AS s
    INNER JOIN account AS a
    ON account = ies_id
    WHERE sum_value = FALSE  AND s.input_method NOT LIKE 'import'
    GROUP BY vat_number, year, month, flag

    UNION ALL

    SELECT vat_number, 
        year, 
        month,
        CAST(sum(value) AS float) AS value,
        CASE 
            WHEN 
                a.asset_liability_equity LIKE 'p' OR 
                    a.asset_liability_equity LIKE 'e'
            THEN 'A00158'

            WHEN
                a.ebt = TRUE
            THEN 'A00024'

            ELSE 'unk'
        END AS flag
    FROM statements AS s
    INNER JOIN account AS a
    ON account = ies_id
    WHERE sum_value = FALSE  AND s.input_method NOT LIKE 'import'
    GROUP BY vat_number, year, month, flag

    UNION ALL

    SELECT vat_number, 
        year, 
        month,
        CAST(sum(value) AS float) AS value,
        CASE 
            WHEN
                a.net_results = TRUE
            THEN 'A00026'

            ELSE 'unk'
        END AS flag
    FROM statements AS s
    INNER JOIN account AS a
    ON account = ies_id
    WHERE sum_value = FALSE  AND s.input_method NOT LIKE 'import'
    GROUP BY vat_number, year, month, flag
) AS filter

WHERE filter.flag NOT LIKE 'unk'

-- the except function returns all values which are included on query 1 but not on query 2
EXCEPT

-- Query 2 selects all values of table statements
SELECT 
    input_method,account,vat_number,year,month, value
FROM 
    statements;


