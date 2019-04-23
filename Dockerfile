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

RUN mkdir /data
WORKDIR /data

ADD https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip/download .

RUN unzip download

ADD https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 .
RUN tar -xvf samtools-1.9.tar.bz2

WORKDIR samtools-1.9
RUN ./configure --prefix=/data
RUN make
RUN make install

WORKDIR /data/bin
RUN ls

FROM ubuntu

COPY --from=BowtieBin /data/bin/samtools /bin
COPY --from=BowtieBin /data/bowtie2-2.3.5.1-linux-x86_64/bowtie2 /bin

COPY script.sh .
RUN chmod 755 script.sh