#!/bin/bash

mkdir -p ${SSL_DIR}

if [ ! -f "${SSL_CERT}" ] || [ ! -f "${SSL_KEY}" ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "${SSL_KEY}" -out "${SSL_CERT}" \
	-subj "/C=KR/ST=SEOUL/L=GEPO/O=42Seoul/OU=student/CN=${DOMAIN_NAME}"
fi

echo "
server
{
	listen 443 ssl;
	ssl_protocols TLSv1.3;
	ssl_certificate ${SSL_CERT};
	ssl_certificate_key ${SSL_KEY};

	root /var/www/html;
	index index.php index.html index.htm;
	server_name ${DOMAIN_NAME};
" > /etc/nginx/sites-available/default

echo '
	location / {
		try_files $uri $uri/ =404;
	}
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;

		fastcgi_param SCRIPT_FILENAME /var/www/html/$fastcgi_script_name;
		fastcgi_pass my-wordpress:9000;
	}
} ' >> /etc/nginx/sites-available/default

nginx -g "daemon off;"
