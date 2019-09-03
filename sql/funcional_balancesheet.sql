
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
LEFT JOIN funcional_account USING (funcional_code);

