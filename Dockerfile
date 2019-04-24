FROM ubuntu as BowtieBin

RUN apt-get update
RUN apt-get install unzip

RUN mkdir /data
WORKDIR /data

ADD https://github.com/BenLangmead/bowtie2/releases/download/v2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip .

RUN unzip bowtie2-2.3.5.1-linux-x86_64
RUN ls

FROM ubuntu

COPY --from=BowtieBin /data/bin/samtools /bin
COPY --from=BowtieBin /data/bowtie2-2.3.5.1-linux-x86_64 /bin

COPY script.sh .
RUN chmod 755 script.sh