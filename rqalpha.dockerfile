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

# Install language pack
RUN apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
    apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk

# Iterate through all locale and install it
# Note that locale -a is not available in alpine linux, use `/usr/glibc-compat/bin/locale -a` instead
COPY ./locale.md /locale.md
RUN cat locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8

# Set the lang, you can also specify it as as environment variable through docker-compose.yml
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

RUN rqalpha version
