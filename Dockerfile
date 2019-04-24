FROM ubuntu as BowtieBin

RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y gcc
RUN apt-get install libncurses5 libncurses5-dev
RUN apt-get install zlib1g-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y liblzma-dev
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install perl

RUN mkdir /data
WORKDIR /data

ADD https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 .
RUN tar -xvf samtools-1.9.tar.bz2

WORKDIR samtools-1.9
RUN ./configure --prefix=/data
RUN make
RUN make install

WORKDIR /data/bin
RUN ls -alh

FROM biocontainers/bowtie2:v2.2.9_cv2

COPY --from=BowtieBin /data/bin/samtools /bin

COPY script.sh .

USER root
RUN chmod 777 script.sh