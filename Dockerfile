FROM php:7.4-cli-alpine

RUN apk add bash git \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
	&& wget https://get.symfony.com/cli/installer -O - | bash \
	&& mv /root/.symfony/bin/symfony /usr/local/bin/symfony \
	&& chmod +x /usr/local/bin/symfony \
	&& mkdir -p /application

VOLUME /application

WORKDIR /application

ENTRYPOINT ["symfony"]
