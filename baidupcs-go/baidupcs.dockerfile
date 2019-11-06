FROM alpine:3.9

COPY BaiduPCS-Go /usr/bin/

RUN chmod a+x /usr/bin/BaiduPCS-Go

CMD BaiduPCS-Go