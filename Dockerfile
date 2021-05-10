FROM debian:buster-slim

WORKDIR /tmp

# dependencies
RUN apt-get update && apt-get install -y \
  wget \
  chromium \
  chromium-l10n \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# copy install scripts
COPY install_jasper.sh ./
RUN chmod +x /tmp/install_jasper.sh && /tmp/install_jasper.sh

# copy configure scripts
COPY configure_jasper.sh ./
RUN chmod +x /tmp/configure_jasper.sh && /tmp/configure_jasper.sh

# clean
RUN rm -rf /tmp/* && apt-get remove wget -y && apt-get autoremove -y && apt-get clean

# expose apache tomcat port
EXPOSE 8080

# expose apache postgresql port
EXPOSE 5432

# postgresql data volume
VOLUME ["/home/jasper/jasperreports-server-cp-7.8.0/postgresql/data"]

# start server command
COPY start_jasper.sh /tmp/
RUN chmod +x start_jasper.sh

# HEALTHCHECK
RUN apt-get update && apt-get install -y \
  curl \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

HEALTHCHECK --start-period=2m \
  CMD curl -f -s --head http://localhost:8080/jasperserver/login.html | grep 200 || exit 1exit

CMD ["su", "-" ,"jasper", "-c", "/tmp/start_jasper.sh"]
