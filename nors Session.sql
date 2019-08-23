SELECT 
    ac.fs_account AS "codigo ies",
    a.name_pt AS "descrição",
    COALESCE(SUM(l.value),0) AS total, 
    a.financial_statement AS fs
FROM 
    ledger AS l, 
    account_chart AS ac,
    account AS a
WHERE 
    l.account_chart = ac.ldg_account,
    fs = "pl" 
GROUP BY 
    ac.fs_account,a.name_pt;



