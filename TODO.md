# Incetpion


NGINX를 포함하는 Docker 컨테이너 (TLSv1.2 또는 TLSv1.3만 지원).<br>
A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

NGINX 없이 WordPress + php-fpm을 포함하는 Docker 컨테이너 (nginx는 포함하지 않음).<br>
A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.

MariaDB를 포함하는 Docker 컨테이너 (nginx는 포함하지 않음).<br>
A Docker container that contains MariaDB only without nginx

WordPress 데이터베이스를 포함하는 볼륨.<br>
A volume that contains your WordPress database.

WordPress 웹사이트 파일을 포함하는 두 번째 볼륨<br>
A second volume that contains your WordPress website files

컨테이너 간 연결을 위한 <b>Docker-network</b>.<br>
A <b>docker-network</b> that establishes the connection between your containers.
