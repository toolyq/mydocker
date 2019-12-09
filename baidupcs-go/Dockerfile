FROM alpine:3.9

ENV BAIDUPCS_VERSION 3.7.0
WORKDIR /

RUN	set -x && \
	apk add --no-cache --update wget unzip && \
	#wget --no-check-certificate http://qiniu.zoranjojo.top/BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-amd64.zip && \
	#https://github.com/liuzhuoling2011/baidupcs-web/releases/download/3.6.8/BaiduPCS-Go-3.6.8-linux-amd64.zip
	wget --no-check-certificate https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${BAIDUPCS_VERSION}/BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-amd64.zip && \
	unzip BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-amd64.zip && \
	mv BaiduPCS-Go-${BAIDUPCS_VERSION}-linux-amd64 BaiduPCS && \
	mkdir -p /opt/BaiduPCS && \
	cp -f BaiduPCS/* /opt/BaiduPCS/ && \
	rm -rf BaiduPCS* && \
	apk del wget unzip

VOLUME ["/download"]
VOLUME ["/root/.config/BaiduPCS-Go"]
CMD ["/opt/BaiduPCS/BaiduPCS-Go"]

EXPOSE 5299