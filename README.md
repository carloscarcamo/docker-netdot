Docker Netdot
=============

This project is inspired by https://github.com/42wim/docker-netdot_deploy

This will deploy all the Netdot stack on your Docker host. This project will pull a custom image based on GNU/Debian Jessie with all services (MariaDB, Apache) and configuration files needed to run netdot web interface.


**Netdot** is an open source tool designed to help network administrators collect, organize and maintain network documentation.

If you need more about about netdot, go to: https://osl.uoregon.edu/redmine/projects/netdot

# Prerequisites

* Docker (Of course! xD), see https://docs.docker.com/installation/

# Usage

## Clone this repo

```
$ git clone https://github.com/carloscarcamo/docker-netdot.git && cd docker-netdot
```

## Build Dockerfile

```
$ sudo docker build -t netdot .
```

**Note:** the point "." at the end of the command above is necessary to build the image

When finished, you should be able to see your new image on docker images, something like this:

```
$ sudo docker images
REPOSITORY                        TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
netdot                            latest              fd1d15cb70f7        About a minute ago   1.111 GB
```

## Run the new image

```
$ sudo docker run -i -t -p 8888:80 -p 4303:3306 -v /var/www/:/var/www/ \
  -v /var/local/dbs/:/var/lib/mysql --hostname="netdothost" -d netdot
```

List your containers and make sure that your netdot container is running

```
$ sudo docker dps
```

go to: http://localhost:8888/netdot/

You can also access to mysql on the container:

```
$ CONTAINER_ID=$(sudo docker ps | grep netdot | awk '{print $1}')
$ IP=$(sudo docker inspect --format='{{.NetworkSettings.IPAddress}}' $CONTAINER_ID)
$ mysql -u root -p -h $IP
```

**root password:** adminadmin

