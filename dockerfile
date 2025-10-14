FROM alpine:latest

RUN apk add --no-cache aria2 \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /conf
#COPY aria2.conf /conf/
RUN mkdir -p /mysh
COPY udr.sh /mysh/
RUN chmod +x /mysh/udr.sh

EXPOSE 3681

CMD ["aria2c", "--conf-path=/conf/aria2.conf"]