FROM alpine:3.8

RUN apk add --no-cache ruby ruby-rdoc npm git bash supervisor

RUN mkdir -p /opt/postal && git clone https://github.com/atech/postal /opt/postal

RUN gem install bundler && gem install procodile

RUN chmod +x /opt/postal/bin/postal

RUN apk add ruby-dev build-base libxml2-dev libxslt-dev
RUN apk add mariadb-dev

RUN bundle config build.nokogiri --use-system-libraries --with-xml2-include=/usr/include/libxml2

RUN /opt/postal/bin/postal bundle /opt/postal/vendor/bundle

#RUN  /opt/postal/bin/postal initialize-config

#RUN cat /opt/postal/config/postal.yml

COPY /scripts/entrypoint.sh /
COPY /scripts/supervisord.conf /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["supervisord","-c","/supervisord.conf"]
