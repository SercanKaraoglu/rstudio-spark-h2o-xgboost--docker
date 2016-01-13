# Docker container -> RStudio Spark h2o xgboost

This is a dockerfile for rstudio which contains one most useful packages for those who wants to develop machine learning & quantitative trading models;

  - PerformanceAnalytics
  - quantstrat
  - blotter
  - devtools
  - dplyr
  - data.table
  - caret
  - Metrics
  - ggplot2
  - h2o
  - ProjectTemplate
  - log4r
  - xts
  - foreach
  - doParallel
  - xgboost
  - SparkR
  - readr

You can create models using xgboost, h2o, SparkR and test them using quant-trading tools like quantstrat, PerformanceAnalytics, blotter. Maybe you want to run this image on computation intensive instances of AWS.
It also includes script named loadSpark.R for loading Spark under src/ folder

### Version
0.0.1

### Tech

This project contains open source projects below

* [xgboost] - eXtreme Gradient Boosting Machince Algorithm
* [SparkR] -  Fast and general-purpose cluster computing system
* [h2o] - Fast scalable machine learning platform for smarter applications
* [docker] - Container
* [rstudio] - R IDE

### Installation


```sh
$ docker build -t ${tag} .
```

```sh
$ docker run -p 8787:8787 ${tag}:latest
```

   [xgboost]: <https://github.com/dmlc/xgboost>
   [SparkR]: <https://spark.apache.org/docs/1.6.0/sparkr.html>
   [h2o]: <http://www.h2o.ai/>
   [docker]: <https://www.docker.com/>
   [rstudio]: <https://www.rstudio.com/>