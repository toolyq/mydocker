FROM alpine:3.9
RUN apk update \
    && apk --no-cache add ca-certificates
COPY BaiduPCS-Go /usr/bin/

RUN chmod a+x /usr/bin/BaiduPCS-Go

CMD BaiduPCS-Go