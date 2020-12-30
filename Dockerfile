FROM centos:7
MAINTAINER Nathanael Noblet <nathanael@noblet.ca>

RUN yum -C install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm https://rpms.remirepo.net/enterprise/remi-release-7.rpm && rm -rf /var/cache/yum/* && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

RUN yum-config-manager --enable remi,remi-php74 && yum clean all

RUN yum install -y unzip git php php-gd php-intl php-tidy php-pdo php-cli php-process php-xml php-mysql php-mbstring php-bcmath php-pecl-imagick php-pecl-zip which && yum update -y && rm -rf /var/cache/yum/* && echo 'date.timezone=America/Edmonton' > /etc/php.d/00-docker-php-date-timezone.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
