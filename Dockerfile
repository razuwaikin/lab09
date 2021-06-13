FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . doc/
WORKDIR doc/

RUN cmake .
RUN make

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

ENTRYPOINT ./solver
