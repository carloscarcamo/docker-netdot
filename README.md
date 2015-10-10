Docker Netdot
=============

This project is base on https://github.com/42wim/docker-netdot_deploy

This will deploy all the Netdot stack on your Docker host. This project will pull a custom image based on GNU/Debian Jessie with all services (MariaDB, Apache) and configuration files needed to run netdot web interface.


**Netdot** is an open source tool designed to help network administrators collect, organize and maintain network documentation.

If you need more about about netdot, go to: https://osl.uoregon.edu/redmine/projects/netdot

#Usage

##Build Dockerfile

```
$ sudo docker build -t netdot .
```

##Run the new image

```
$ sudo docker run -i -t -p 8888:80 -p 4303:3306 -v /var/www/:/var/www/ \
  -v /var/local/dbs/:/var/lib/mysql --hostname="netdothost" -d netdot init
```

go to: http://localhost:8888/netdot/

You can also access to mysql on the container:

```
$ CONTAINER_ID=$(sudo docker ps | grep netdot | awk '{print $1}')
$ IP=$(sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER_ID)
$ mysql -u root -p -h $IP
```

**root password:** adminadmin
