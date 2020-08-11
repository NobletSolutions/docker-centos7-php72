FROM centos:7
MAINTAINER Nathanael Noblet <nathanael@noblet.ca>

RUN yum -C install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm https://rpms.remirepo.net/enterprise/remi-release-7.rpm && rm -rf /var/cache/yum/* && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

RUN yum-config-manager --enable remi,remi-safe && yum clean all

RUN yum install -y git php80 php80-syspaths php80-php-gd php80-php-intl php80-php-tidy php80-php-pdo php80-php-cli php80-php-process php80-php-xml php80-php-mysql php80-php-mbstring php80-php-bcmath php80-php-pecl-imagick php80-php-pecl-zip which && yum update -y && rm -rf /var/cache/yum/* && echo 'date.timezone=America/Edmonton' > /etc/php.d/00-docker-php80-date-timezone.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
