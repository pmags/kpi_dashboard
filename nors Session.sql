      

COPY  statements(vat_number,year, month,account,value, input_method)
FROM 'c:\repos\kpi_dashboard\statements.csv' DELIMITER ';' CSV HEADER;