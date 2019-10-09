FROM python:3.7.4-alpine3.10
MAINTAINER lyqu@qq.com

RUN apk update
RUN apk add build-base
RUN pip install -U pip setuptools cython
RUN pip install bcolz==1.2.0
RUN pip install --upgrade rqalpha

WORKDIR /ws
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
RUN tar -zxvf ta-lib-0.4.0-src.tar.gz
WORKDIR /ws/ta-lib/
RUN ./configure --prefix=/usr
RUN make
RUN make install
RUN pip install ta-lib
RUN pip install better-exceptions==0.1.8

rqalpha version
