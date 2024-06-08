#Lựa chọn images gốc cho container
FROM ubuntu
COPY data.csv /home/data.csv

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install python3
RUN apt-get -y install wget
RUN apt-get -y install tar
RUN apt-get -y install curl
RUN apt-get -y install python3-pip
RUN apt-get -y install net-tools
RUN apt-get -y install vim
RUN wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz
RUN tar xvf spark-3.5.1-bin-hadoop3.tgz
RUN mv spark-3.5.1-bin-hadoop3 /opt/spark
RUN rm spark-3.5.1-bin-hadoop3.tgz

ENV SPARK_HOME=/opt/spark 
ENV PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

