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
-e main_db.host=postal-rabbit \
-e main_db.port=3306 \
-e main_db.database=postal \
-e main_db.username=postal \
-e main_db.password=postal \
-e message_db.host=postal-rabbit \
-e message_db.port=3306 \
-e message_db.database=postal \
-e message_db.username=postal \
-e message_db.password=postal \
-e rabbitmq.host=postal-rabbit \
-e rabbitmq.port=5672 \
-e rabbitmq.username=postal \
-e rabbitmq.password=postal \
-e rabbitmq.vhost=postal \
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
