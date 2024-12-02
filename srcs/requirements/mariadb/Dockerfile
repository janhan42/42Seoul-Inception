FROM debian:11

RUN apt-get update -y
RUN apt-get install mariadb-server -y
RUN apt-get install dumb-init -y

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./mariadb-init.sh /

EXPOSE 3306

# dumb-init을 PID 1 문제 해결을 위해 사용
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
# mariadb-init.sh 실행 후 MariaDB 데몬 시작
CMD [ "bash", "/mariadb-init.sh" ]
