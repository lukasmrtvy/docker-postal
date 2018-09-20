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
docker run -d clamav
docker run -d spamd


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
