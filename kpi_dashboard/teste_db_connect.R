library(RPostgreSQL)

pwd <- "admin"

drv <- dbConnect(drv = "PostgreSQL", 
                 dbname = "nors",
                 host = "localhost",
                 port = 5432,
                 user = "psm",
                 password = pwd)
rm(pwd)

# testing
dbExistsTable(drv,"account")

# extract data
account <- dbGetQuery(drv, "
                      SELECT *
                      FROM account
                      WHERE financial_statement = 'bs';
                      ")
