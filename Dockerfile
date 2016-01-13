FROM r-base

RUN useradd -ms /bin/bash rstudio

RUN apt-get update && apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
RUN echo 'deb http://httpredir.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
RUN apt-get update && apt-get install psmisc && apt-get -y install libedit2 && apt-get install libssl1.0.0
ENV LANG C.UTF-8

RUN mkdir -p /opt/sdk/java
WORKDIR /opt/sdk/java
RUN wget http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
RUN tar xvf jdk-7u79-linux-x64.tar.gz
RUN ln -s /opt/sdk/java/jdk1.7.0_79 /opt/sdk/java/default
ENV JAVA_HOME /opt/sdk/java/default
RUN export JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin

RUN apt-get update && apt-get install -y --no-install-recommends libfontconfig1 && rm -rf /var/lib/apt/lists/*

WORKDIR /home/rstudio
RUN wget http://ftp.itu.edu.tr/Mirror/Apache/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz
RUN tar zxvf spark-1.6.0-bin-hadoop2.6.tgz
RUN ln -s spark-1.6.0-bin-hadoop2.6 spark

ADD src/loadSpark.R /home/rstudio/loadSpark.R
ADD src/installPckgs.R /tmp/installPckgs.R
RUN R --vanilla --slave < /tmp/installPckgs.R

EXPOSE 8787

RUN wget https://cran.r-project.org/src/contrib/rJava_0.9-8.tar.gz
#RUN R CMD INSTALL rJava_0.9-8.tar.gz
#RUN R CMD javareconf
RUN wget https://download2.rstudio.org/rstudio-server-0.99.491-amd64.deb
RUN dpkg -i rstudio-server-0.99.491-amd64.deb
RUN echo "rstudio:rstudio" | chpasswd
ENV PATH /usr/lib/rstudio-server/bin/:$PATH
CMD /usr/lib/rstudio-server/bin/rserver --server-daemonize 0
