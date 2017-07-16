# PostgresEvoDB

## What it is?
Project that contains initial installation of postgres environment in docker with ability to execute custom *.sql scripts against newly created postgres environment

## Evolutionary database design

This project will provide easy setup of database environment from every commit on github. sql scripts that were added for particular commit will also be included in Dockerfile with that particular commit which will enable consistency of current state of application vs. current state of database. 

## How to get started?

Instructions below will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

**Local environment:**

For local purposes of development and testing, I recommmend using Vagrant and Virtualbox. Before installing Vagrant on your local machine please download virtualbox. 

* Virtual box can be downloaded from: *
https://www.virtualbox.org/wiki/Downloads

* Vagrant will be installed per insturction below: * 
* Create folder: mkdir vagrant
* Run command in terminal from created folder: vagrant init ubuntu/xenial64 (you can use some other version of ubuntu image, but I recommend using latest one)

After you download all neccessary software you can easily run your virtual environment with command: 
```vagrant up```

More detailed instructions regarding vagrant and virtualbox can be find at: 
https://drupalize.me/videos/installing-vagrant-and-virtualbox?p=1526

**AWS environment:**

You only need to spinup ec2 instance (I recommend usage of ubuntu 16.04/xenial image) and Vagrant/Virtualbox installation is not mandatory

**Docker installation**

For both environments, you will need to install Docker. Instructions on how to install Docker can be found here:
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

### Usage

Commands below will tell you how to get a development env up & running

* Run docker for creating image from the Dockerfile. You can specify any name (for example: postgresevodb)

```docker build -t ${IMAGE_NAME} .```

* (OPTIONAL) Check that your image is created

```docker images```

* To create docker container from this image run:

```docker run --name ${CONTAINER_NAME} -d -p ${PORT_ON_LOCAL_MACHINE}:${PORT_INSIDE_CONTAINER} ${IMAGE_NAME}```

where ${PORT_ON_LOCAL_MACHINE} and ${PORT_INSIDE_CONTAINER} are needed if you want to enable port forwarding between host machine and container (good scenario where you will need this is if you want to access postgres database using postgres client installed on your machine)

* (OPTIONAL) Check logs for starting the container:

```docker logs -f ${CONTAINER_NAME}```

* Check does your container up & running:

```docker ps -a```

* To connect from your host machine (Vagrant, ec2...etc.) to this docker container, you can use following command:

```apt-get install postgres-client``` (if you don't have one)

```PGPASSWORD=postgres psql -h ${HOST_IP_ADDRESS} -p ${PORT_ON_LOCAL_MACHINE} -U docker```

## Section for update exiting DB
TBA...

**Author**
 	Tarik Dolovac
