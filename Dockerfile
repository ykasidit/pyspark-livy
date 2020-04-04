FROM godatadriven/pyspark:2.4.4

ARG LIVY_BIN_ZIP_URL=https://downloads.apache.org/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip
ENV SPARK_HOME=/opt/miniconda3/lib/python3.7/site-packages/pyspark

RUN apt-get install -y procps curl htop unzip
RUN pip install pandas==0.23.4
RUN curl $LIVY_BIN_ZIP_URL --output livy.zip
RUN unzip livy.zip && rm livy.zip

WORKDIR /livy
ENTRYPOINT ["bash", "-c", "while :; do ./bin/livy-server start; sleep 5; done"]