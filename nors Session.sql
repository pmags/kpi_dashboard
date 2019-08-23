    COPY ledger (vat_number,year,month,account_chart,value)
    FROM 'c:\repos\kpi_dashboard\ldg.csv' DELIMITER ';' CSV HEADER;

SELECT COUNT(*) FROM ledger;