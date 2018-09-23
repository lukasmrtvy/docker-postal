# docker-postal

# Very beta

```
docker run -d \
--restart always \
--network my-bridge \
--name postal \
-p 5000:5000 \
-e DB_MIGRATE=true \
-e INIT_CONFIG=true \
-e USER_CREATE=true \
-e MAIN_DB_HOST=postal-mariadb \
-e MAIN_DB_PORT=3306 \
-e MAIN_DB_DATABASE=postal \
-e MAIN_DB_USERNAME=postal \
-e MAIN_DB_PASSWORD=postal \
-e MESSAGE_DB_HOST=postal-mariadb \
-e MESSAGE_DB_PORT=3306 \
-e MESSAGE_DB_PERFIX=postal \
-e MESSAGE_DB_USERNAME=postal \
-e MESSAGE_DB_PASSWORD=postal \
-e RABBITMQ_HOST=postal-rabbit \
-e RABBITMQ_PORT=5673 \
-e RABBITMQ_USERNAME=postal \
-e RABBITMQ_PASSWORD=postal \
-e RABBITMQ_VHOST.vhost=postal \
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
--network my-bridge \
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
--network my-bridge \
--hostname rabbit \
--name postal-rabbit  \
-e RABBITMQ_DEFAULT_USER=postal \
-e RABBITMQ_DEFAULT_PASS=postal \
-e RABBITMQ_DEFAULT_VHOST=postal \
rabbitmq:3.7.7-alpine
```
