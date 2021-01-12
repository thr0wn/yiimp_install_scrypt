FROM jrei/systemd-ubuntu:18.04

RUN apt update
RUN apt upgrade -y
RUN apt-get -y install sudo git lsb-release pwgen software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt install -y php7.3-fpm php7.3-opcache php7.3 php7.3-common php7.3-gd php7.3-mysql php7.3-imap php7.3-cli \
    php7.3-cgi php-pear imagemagick libruby php7.3-curl php7.3-intl php7.3-pspell mcrypt\
    php7.3-recode php7.3-sqlite3 php7.3-tidy php7.3-xmlrpc php7.3-xsl memcached php-memcache php-imagick php-gettext php7.3-zip php7.3-mbstring \
    libpsl-dev libnghttp2-dev vim
RUN adduser pool
RUN adduser pool sudo
RUN su - pool

WORKDIR /yiimp_install_scrypt
COPY . .

VOLUME /run /tmp

SHELL ["/bin/bash", "-c"]
