FROM godatadriven/pyspark:2.4.4

ENV SPARK_HOME=/opt/miniconda3/lib/python3.7/site-packages/pyspark

RUN apt-get install -y procps curl htop unzip
RUN pip install pandas==0.23.4

ARG LIVY_BIN_ZIP_URL=https://downloads.apache.org/incubator/livy/0.7.0-incubating/apache-livy-0.7.0-incubating-bin.zip
ENV LIVY_UNZIPPED_DIR=/apache-livy-0.7.0-incubating-bin
RUN curl $LIVY_BIN_ZIP_URL --output livy.zip
RUN unzip livy.zip && rm livy.zip

RUN pip install geospark==1.3.1

ENTRYPOINT ["bash", "-c", "while :; do cd $LIVY_UNZIPPED_DIR && ./bin/livy-server start; sleep 60; done"]