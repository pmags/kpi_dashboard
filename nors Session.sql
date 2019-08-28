SELECT vat_number,name_pt, year, month,value, financial_statement
FROM statements AS s
INNER JOIN account AS a 
ON s.account = a.ies_id 
WHERE vat_number = 513259236;
