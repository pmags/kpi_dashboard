
#servers <- list(ports = c(5433,5432), host = c("89.154.64.8","89.154.64.8"), user = c("pi","pedro"))
input <- list(server1 = c(ports = 5433, user ="pi"), server2=c(ports = 5432, user ="pedro"))

db_connect <- function(servers) {
  out <- tryCatch(
    {
      dbConnect(RPostgres::Postgres(),
                dbname = "nors",
                host = "89.154.64.8",
                port = servers [["ports"]],
                user = servers[["user"]],
                password = "admin")
    },
    
    error = function(cond) {
      # message(paste("db does not seem to exist:",servers))
      # message("Here's the original error message:")
      # message(cond)
      # Choose a return value in case of error
      return(NULL)
    },
    
    warning = function(cond) {
      # message(paste("db caused a warning:",servers))
      # message("Here's the original warning message:")
      # message(cond)
      # Choose a return value in case of warning
      return(NULL)
    },
    
    finally = {

      # Here goes everything that should be executed at the end,
      # regardless of success or error.
      # If you want more than one expression to be executed, then you
      # need to wrap them in curly brackets ({...}); otherwise you could
      # just have written 'finally=<expression>'
      message(paste("Acess successful to:",servers [["ports"]],"by",servers[["user"]]))
    }
  )
  return(out)
}

testing_con <- lapply(input,db_connect)

con <- ifelse(is.null(testing_con[1]),testing_con[2],testing_con[1])
con <- con[[1]]
