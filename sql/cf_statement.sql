SELECT cf_code, name_pt, vat_number, year, month, value
FROM(

    SELECT cf_code, vat_number, year, month, SUM(var) AS value
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
    WHERE a.sum_value != true AND
        cf_code IS NOT NULL
    GROUP BY cf_code, vat_number, year, month

    UNION

    SELECT 'CF003' AS cf_code, vat_number, year, month, SUM(var) AS value
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
        cf.cf_economico = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF007' AS cf_code, vat_number, year, month, SUM(var) AS value
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
        cf.cf_corrente = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF008' AS cf_code, vat_number, year, month, SUM(var) AS value
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
        cf.cf_operacional = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF013' AS cf_code, vat_number, year, month, SUM(var) AS value
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
        cf.cf_gerado_tesouraria = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

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

    UNION

    SELECT 'CF020' AS cf_code, vat_number, year, month, SUM(var) AS value
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
        cf.cf_liquido_tesouraria = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF024' AS cf_code, vat_number, year, month, SUM(var) AS value
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
        cf.cf_aplicacoes = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month


) AS data
LEFT JOIN cashflow_account USING (cf_code);

