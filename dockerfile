FROM alpine:latest

RUN apk add --no-cache aria2 \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /conf
#COPY aria2.conf /conf/
COPY udr.sh /root
RUN chmod +x /root/udr.sh

EXPOSE 3681

CMD ["aria2c", "--conf-path=/conf/aria2.conf"]