FROM carloscarcamo/netdot
MAINTAINER carloscarcamo
RUN apt-get update && apt-get install -y supervisor
COPY init.sh /usr/local/bin/init
RUN chmod +x /usr/local/bin/init
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80
EXPOSE 3306
CMD ["/usr/bin/supervisord"]
