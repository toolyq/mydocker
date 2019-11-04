FROM node:10-alpine

MAINTAINER lyqu@qq.com

WORKDIR /data

ADD app /data/app

WORKDIR /data/app
RUN chmod 777 /data/app/web.sh 
RUN npm config set registry https://registry.npm.taobao.org 
RUN npm install
EXPOSE 88
ENTRYPOINT ["/data/app/web.sh"]