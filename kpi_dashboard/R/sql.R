
# ======================================================================================= #
# Script Name : SQL queries                                                                                            
# Purpose     : Calls to database                                                          
# Args        : 
# Date        : Tue Oct 08 11:44:11 2019   
# Author      : Pedro Magalhães                                                
# Email       : pedro.magalhaes@mosaic.pt                                           
# ======================================================================================= #

# ======================================================================================= #
# main kpi ----                                         
# ======================================================================================= #

q_sales_kpi <- "SELECT vat_number, account,year,month,value
          FROM
            (SELECT vat_number, account,year,month,value
            FROM statements
            WHERE account IN ('A00001','A00006','A00007','A00008','A00016','A00017','A00018')) AS t
          WHERE vat_number = ?vat;"

# ======================================================================================= #
# working capital kpi ----                                         
# ======================================================================================= #

q_wc <- "SELECT vat_number, account, year, month, value 
        FROM (SELECT vat_number, account,year,month,value
            FROM statements
            WHERE account IN ('A00125','A00124','A00119','A00117','A00156','A00151','A00149', 'A00001')) AS t
          WHERE vat_number = ?vat; "


# ======================================================================================= #
# financial statements ----                                         
# ======================================================================================= #


q_df <- "SELECT vat_number,account,name_pt, year, month, value, financial_statement
                FROM statements AS s
                INNER JOIN account AS a
                ON s.account = a.ies_id
                WHERE vat_number = ?vat;"


# ======================================================================================= #
# funcional balance sheet ----                                         
# ======================================================================================= #

q_fun_bal <- "
SELECT funcional_code, name_pt, vat_number, year, month, value
FROM(

    SELECT funcional_code, vat_number, year, month, SUM(value) AS value
    FROM statements AS s
    INNER JOIN account AS a ON a.ies_id = s.account
    WHERE a.sum_value != true AND
        funcional_code IS NOT NULL
    GROUP BY funcional_code, vat_number, year, month

    UNION

    SELECT 'F0005' AS funcional_code, vat_number, year, month, SUM(value) AS value
    FROM statements AS s
    INNER JOIN account AS a ON a.ies_id = s.account
    INNER JOIN funcional_account AS f USING (funcional_code)
    WHERE a.sum_value != true AND
        f.fmf = true AND
        f.funcional_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'F0011' AS funcional_code, vat_number, year, month, SUM(value) AS value
    FROM statements AS s
    INNER JOIN account AS a ON a.ies_id = s.account
    INNER JOIN funcional_account AS f USING (funcional_code)
    WHERE a.sum_value != true AND
        f.c_needs = true AND
        f.funcional_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION   

    SELECT 'F0016' AS funcional_code, vat_number, year, month, SUM(value) AS value
    FROM statements AS s
    INNER JOIN account AS a ON a.ies_id = s.account
    INNER JOIN funcional_account AS f USING (funcional_code)
    WHERE a.sum_value != true AND
        f.c_resources = true AND
        f.funcional_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'F0017' AS funcional_code, vat_number, year, month, SUM(value) AS value
    FROM statements AS s
    INNER JOIN account AS a ON a.ies_id = s.account
    INNER JOIN funcional_account AS f USING (funcional_code)
    WHERE a.sum_value != true AND
        f.nfm = true AND
        f.funcional_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'F0020' AS funcional_code, vat_number, year, month, SUM(value) AS value
    FROM statements AS s
    INNER JOIN account AS a ON a.ies_id = s.account
    INNER JOIN funcional_account AS f USING (funcional_code)
    WHERE a.sum_value != true AND
        f.tl = true AND
        f.funcional_code IS NOT NULL
    GROUP BY vat_number, year, month
    

) AS data
LEFT JOIN funcional_account USING (funcional_code)
WHERE vat_number = ?vat;"


# ======================================================================================= #
# cash flow ----                                         
# ======================================================================================= #

q_cashflow <- "
SELECT cf_code, name_pt, vat_number, year, month, value
FROM(

    SELECT cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12

    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    WHERE a.sum_value != true AND
        cf_code IS NOT NULL
    GROUP BY cf_code, vat_number, year, month

    UNION

    SELECT 'CF002' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_economico = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF006' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_corrente = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF007' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_operacional = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF012' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_gerado_tesouraria = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF018' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id 
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_financiamento = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month

    UNION

    SELECT 'CF019' AS cf_code, vat_number, year, month, SUM(var) AS value
    FROM (
        SELECT vat_number, account, month, year, 
            value - lag(value) OVER (PARTITION BY account, vat_number ORDER BY year, month) AS var
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value * (CASE WHEN account LIKE 'A00026' THEN -1 ELSE 1 END) AS va
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE 
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
        WHERE financial_statement = 'bs' AND month = 12

        UNION

        SELECT vat_number, account, month, year, value AS var 
        FROM statements AS s
        INNER JOIN account AS a ON s.account = a.ies_id
        WHERE financial_statement = 'pl' AND month = 12
    ) AS var
    INNER JOIN account AS a ON a.ies_id = var.account
    INNER JOIN cashflow_account AS cf USING (cf_code)
    WHERE a.sum_value != true AND
        cf.cf_aplicacoes = true AND
        cf.cf_code IS NOT NULL
    GROUP BY vat_number, year, month


) AS data
LEFT JOIN cashflow_account USING (cf_code)
WHERE vat_number = ?vat;
"
