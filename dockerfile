FROM python:3.7.4-alpine3.10

MAINTAINER lyqu@qq.com

RUN cat /etc/apk/repositories
# RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.10/main/">/etc/apk/repositories
# RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.10/community">>/etc/apk/repositories
# RUN echo "http://mirrors.ustc.edu.cn/alpine/edge/testing/">>/etc/apk/repositories
RUN echo "http://dl-3.alpinelinux.org/alpine/v3.10/community">>/etc/apk/repositories
RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/">>/etc/apk/repositories

RUN apk update
RUN apk add make automake gcc g++ subversion python3-dev
# RUN apk add py3-pandas
# RUN apk add py3-numpy
# RUN apk add py3-lxml
# RUN apk add py3-matplotlib
# RUN apk add py3-scikit-learn

# RUN /opt/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
# RUN /opt/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
# RUN /opt/conda/bin/conda config --set show_channel_urls yes

# RUN mkdir ~/.pip
# RUN echo "[global]">~/.pip/pip.conf
# RUN	echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple">>~/.pip/pip.conf
RUN pip install --upgrade pip

RUN pip install pandas
RUN pip install numpy

RUN apk add -q --progress libxml2-dev libxslt-dev libffi-dev
RUN pip install lxml

RUN pip install tushare
RUN pip install redis
RUN pip install threadpool

RUN apk add lapack lapack-dev gfortran 
RUN pip install statsmodels

RUN apk add freetype-dev
RUN pip install matplotlib

RUN apk add  cython
RUN pip install Cython
RUN pip install sklearn

# COPY $PWD /worker
WORKDIR /worker
# RUN ls 
# RUN python getdailystocks.py
# RUN python calculate.py
