
FROM centos:latest
MAINTAINER Nathanael Noblet <nathanael@noblet.ca>

RUN yum install -y https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-11.noarch.rpm http://rpms.famillecollet.com/enterprise/7/remi/x86_64/remi-release-7.3-2.el7.remi.noarch.rpm 
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
RUN yum-config-manager --enable remi,remi-test && yum clean all
RUN yum install -y git php72 php72-php-gd php72-php-intl php72-php-tidy php72-php-pdo php72-php-cli php72-php-process php72-php-xml php72-php-mysql php72-php-mbstring php72-php-bcmath php72-php-pecl-imagick php72-php-pecl-zip && yum clean all
RUN yum update -y && yum clean all
RUN echo 'date.timezone=America/Edmonton' > /etc/opt/remi/php72/php.d/00-docker-php-date-timezone.ini && ln -s /opt/remi/php72/root/bin/php /usr/bin/php
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
