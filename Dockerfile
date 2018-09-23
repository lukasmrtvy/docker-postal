FROM alpine:3.8

ENV UID 1337
ENV GID 1337
ENV USER postal
ENV GROUP postal

RUN   addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP} 

RUN apk add --no-cache ruby ruby-rdoc npm git bash supervisor mariadb-client

RUN mkdir -p /opt/postal && git clone https://github.com/atech/postal /opt/postal

RUN gem install bundler && gem install procodile

RUN chmod +x /opt/postal/bin/postal

RUN apk add ruby-dev build-base libxml2-dev libxslt-dev
RUN apk add mariadb-dev

RUN bundle config build.nokogiri --use-system-libraries --with-xml2-include=/usr/include/libxml2

RUN echo "" >> /opt/postal/Gemfile
RUN echo "gem 'bigdecimal'" >> /opt/postal/Gemfile
RUN echo "gem 'etc'" >> /opt/postal/Gemfile
RUN echo "gem 'tzinfo-data'" >> /opt/postal/Gemfile

RUN /opt/postal/bin/postal bundle /opt/postal/vendor/bundle

#RUN  /opt/postal/bin/postal initialize-config

#RUN cat /opt/postal/config/postal.yml

COPY /src/postal.template.yml /opt/postal/config/

COPY /scripts/entrypoint.sh /
COPY /scripts/supervisord.conf /

RUN chmod +x /entrypoint.sh

RUN chown -R ${USER}:${GROUP} /opt/postal/

RUN apk add --no-cache libcap 

RUN setcap 'cap_net_bind_service=+ep' /usr/local/bin/ruby

USER postal

ENTRYPOINT ["/entrypoint.sh"]

CMD ["supervisord","-c","/supervisord.conf"]
