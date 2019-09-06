SELECT vat_number, account, month, year, value, 
    value - lag(value) OVER (PARTITION BY account ORDER BY year, month) AS var
FROM statements
WHERE vat_number = 513259236;