FROM debian:11

RUN apt-get update -y
RUN apt-get install dumb-init -y
RUN apt-get install php7.4-fpm php7.4-mysql -y
RUN apt-get install mariadb-client -y
RUN apt-get install curl -y

COPY ./wordpress-init.sh /

EXPOSE 9000

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "bash", "/wordpress-init.sh" ]

