# docker-postal

# Very beta

```
docker run -d \
--restart always \
--name postal
-e DB_MIGRATE="true"
-e USER=
-e PASS=
lukasmrtvy/postal:latest
```
https://github.com/atech/postal/wiki/Spam-&-Virus-Checking
```
docker run -d --restart always --name clamav -p 3310:3310 dinkel/clamavd
docker run -d --restart always --name spamd -p 783:783  dinkel/spamassassin
```

```
docker run -d \
--restart always \
--name postal-mariadb \
-e MYSQL_ROOT_PASSWORD=root \
-e MYSQL_DATABASE=postal \
-e MYSQL_USER=postal \
-e MYSQL_PASSWORD=postal \
-v postal-mariadb:/var/lib/mysql \
mariadb:10.3.9-bionic
```

```
docker run -d \
--restart always \
--hostname rabbit \
--name postal-rabbit  \
-e RABBITMQ_DEFAULT_USER=postal \
-e RABBITMQ_DEFAULT_PASS=postal \
-e RABBITMQ_DEFAULT_VHOST=postal \
rabbit:3.7.7-alpine
```
