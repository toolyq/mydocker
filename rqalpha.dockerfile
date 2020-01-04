FROM lyqu/aiworker:20190819
MAINTAINER lyqu@qq.com

RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.10/main/">/etc/apk/repositories
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.10/community">>/etc/apk/repositories
RUN echo "http://mirrors.ustc.edu.cn/alpine/edge/testing/">>/etc/apk/repositories

RUN apk update
#RUN apk add build-base
RUN apk add git
RUN pip install -U pip setuptools
RUN pip install bcolz==1.2.0
RUN pip install git+https://github.com/rkern/line_profiler.git
RUN pip install --upgrade rqalpha

WORKDIR /ws
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
RUN tar -zxvf ta-lib-0.4.0-src.tar.gz
WORKDIR /ws/ta-lib/
RUN ./configure --prefix=/usr
RUN make
RUN make install
RUN pip install ta-lib
RUN pip install baostock
#RUN pip install better-exceptions==0.1.8

cp simsun.ttc /usr/share/fonts/win/simsun.ttc
RUN chmod 777 /usr/share/fonts/win/simsun.ttc
RUN apk add font-adobe-100dpi

fc-cache -f
fc-list
RUN rqalpha version
