FROM docker.io/centos:7.6.1810
MAINTAINER zhangzlyuyx
WORKDIR /

#copy setup file
COPY setup/* /usr/local/setup/

ENV TIME_ZONE Asia/Shanghai
ENV TZ Asia/Shanghai

#RUN
RUN chmod +x /etc/rc.local \ 
&& echo "" >> /etc/rc.local \ 
&& echo "###setup" >> /etc/rc.local \ 
&& echo "cd /usr/local/setup;sed -i 's/\r//' setup.sh;sh setup.sh;" >> /etc/rc.local \ 
&& echo "" >> /etc/rc.local \ 
&& echo "###startup" >> /etc/rc.local \ 
&& echo "cd /usr/local/app;sed -i 's/\r//' startup.sh;sh startup.sh;" >> /etc/rc.local \ 
&& echo "" >> /etc/rc.local \ 
&& echo "/bin/bash" >> /etc/rc.local \ 
&& echo "exit 0" >> /etc/rc.local \ 
&& mkdir -p /usr/local/setup \ 
&& mkdir -p /usr/local/app \ 
&& cp /usr/local/setup/startup.sh /usr/local/app/startup.sh \ 
&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
&& echo "Asia/Shanghai" > /etc/timezone \ 
&& yum -y install net-tools \ 
&& yum -y install telnet \ 
&& yum -y install fontconfig \ 
&& yum -y install kde-l10n-Chinese \ 
&& yum -y install glibc-common \ 
&& yum -y install epel-release \ 
&& yum clean all \ 
&& rm -rf /var/cache/yum/* \ 
&& localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 \ 
&& echo "run finish!"


ENV LC_ALL zh_CN.UTF-8

CMD ["/etc/rc.local"]