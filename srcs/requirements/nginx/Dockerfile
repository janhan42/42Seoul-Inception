FROM debian:11

RUN apt-get update -y
RUN apt-get install nginx openssl -y
RUN apt-get install dumb-init -y

COPY ./nginx-init.sh /

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "bash", "/nginx-init.sh"]
