FROM node:10-alpine

MAINTAINER lyqu@qq.com

WORKDIR /

RUN npm install -g sqlite3
RUN npm config set registry https://registry.npm.taobao.org 

