FROM centos:latest
MAINTAINER Nathanael Noblet <nathanael@noblet.ca>

RUN yum -C install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm http://rpms.famillecollet.com/enterprise/7/remi/x86_64/remi-release-7.6-2.el7.remi.noarch.rpm && rm -rf /var/cache/yum/* && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

RUN yum-config-manager --enable remi && yum clean all

RUN yum install -y git php74 php74-syspaths php74-gd php74-intl php74-tidy php74-pdo php74-cli php74-process php74-xml php74-mysql php74-mbstring php74-bcmath php74-php-pecl-imagick php74-php-pecl-zip which && yum update -y && rm -rf /var/cache/yum/* && echo 'date.timezone=America/Edmonton' > /etc/php.d/00-docker-php-date-timezone.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
