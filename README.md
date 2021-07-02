# Sample_Application

## Aplication:

Created using:https://docs.docker.com/language/python/

When running file it displays the text: 'Hello, Docker!'

After application docker image is running locally through use of command: <br />
$ docker-compose -f docker-compose.dev.yml up -d --build

Application also had the ability to create an empty database and can be connected locally through: <br />
$ curl http://localhost:5000/initdb <br />
$ curl http://localhost:5000/widgets

## Docker Compose

Allows the automated running of application file and Docker file and the setup of the application and Docker image.

## Requirments

Downloads libraries required to run application.

## Github main workflow

Allows the automated flow of docker images to and from dockerhub repository.

## Jenkinsfile

Only is linked to github (Still working out setting up )
