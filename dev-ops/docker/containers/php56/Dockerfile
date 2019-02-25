FROM php:5.6-apache

RUN apt-get update -qq && apt-get install -y -qq apt-utils && mkdir -p /usr/share/man/man1 \
    && apt-get update -qq && apt-get install -y -qq openjdk-8-jre-headless \
    && apt-get update -qq && apt-get install -y -qq  openjdk-8-jdk && dpkg --configure -a

RUN apt-get update -qq && apt-get install -y -qq apt-utils && mkdir -p /usr/share/man/man1 \
    && apt-get update -qq && apt-get install -y -qq openjdk-8-jre-headless \
    && apt-get update -qq && apt-get install -y -qq  openjdk-8-jdk && dpkg --configure -a

RUN apt-get update -qq && apt-get install -y -qq \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libcurl4-openssl-dev \
        software-properties-common  \
        libcurl3 curl \
        git \
        zip \
        unzip \
        inotify-tools \
        build-essential \
        libxml2-dev libxslt1-dev zlib1g-dev \
        git \
        mysql-client \
        sshpass \
        gnupg \
        nano \
        sudo \
        vim \
        graphviz \
        netcat-openbsd \
        ant

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs build-essential

RUN docker-php-ext-install iconv mcrypt mbstring opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install curl \
    && docker-php-ext-install intl \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysql \
    && docker-php-ext-install soap

RUN pecl install apcu-4.0.11 && docker-php-ext-enable apcu

RUN pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug

RUN pecl install redis \
    && docker-php-ext-enable redis

RUN cd /tmp \
    && curl -o ioncube.tar.gz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar -xvvzf ioncube.tar.gz \
    && mv ioncube/ioncube_loader_lin_5.6.so /usr/local/lib/php/extensions/* \
    && rm -Rf ioncube.tar.gz ioncube \
    && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/ioncube_loader_lin_5.6.so" > /usr/local/etc/php/conf.d/00_docker-php-ext-ioncube_loader_lin_5.6.ini

RUN docker-php-ext-install bcmath

ADD server-apache2-vhosts.conf /etc/apache2/sites-enabled/000-default.conf
ADD server-apache2-run-as.conf /etc/apache2/conf-available
RUN ln -s /etc/apache2/conf-available/server-apache2-run-as.conf /etc/apache2/conf-enabled

ADD php-config.ini /usr/local/etc/php/conf.d/php-config.ini
ADD timezone-berlin.ini /usr/local/etc/php/conf.d/timezone.ini
ADD xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN a2enmod rewrite

COPY createuser.sh /tmp/createuser.sh
RUN chmod +rwx /tmp/createuser.sh
RUN /tmp/createuser.sh

RUN echo "alias ll='ls -ahl'" >> /etc/bash.bashrc

WORKDIR /var/www/shopware

COPY wait.sh /tmp/wait.sh
RUN chmod +x /tmp/wait.sh

COPY id_rsa /home/app-shell/.ssh
COPY id_rsa.pub /home/app-shell/.ssh

COPY run-container.sh /run-container.sh
RUN chmod +x /run-container.sh

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer
RUN php -r "unlink('composer-setup.php');"

CMD /run-container.sh
