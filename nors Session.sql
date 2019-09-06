SELECT cf_code, name_pt, vat_number, year, month, value
FROM(


    SELECT 'CF019' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs'

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl'
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_financiamento = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

   
    


) AS data
LEFT JOIN cashflow_account USING (cf_code);