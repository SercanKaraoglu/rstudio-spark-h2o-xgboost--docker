if (nchar(Sys.getenv("SPARK_HOME")) < 1) {
  Sys.setenv(SPARK_HOME = "/home/rstudio/spark")
}
Sys.setenv('SPARKR_SUBMIT_ARGS'='"--packages" "com.databricks:spark-csv_2.11:1.3.0" "sparkr-shell"')
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sc <- sparkR.init(master = "local[*]", sparkEnvir = list(spark.driver.memory="2g"))

sqlContext <- sparkRSQL.init(sc)

#load csv
#train <- read.df(sqlContext, "/home/rstudio/git/homesite/data/train.csv", "com.databricks.spark.csv", header="true")