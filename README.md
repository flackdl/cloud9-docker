Cloud9 v3 Dockerfile
=============

This repository contains Dockerfile of Cloud9 IDE for Docker's automated build published to the public Docker Hub Registry.

# Base Docker Image
[kdelfour/supervisor-docker](https://registry.hub.docker.com/u/kdelfour/supervisor-docker/)

# Installation

## Install Docker.

Download automated build from public Docker Hub Registry: docker pull kdelfour/cloud9-docker

(alternatively, you can build an image from Dockerfile: docker build -t="kdelfour/cloud9-docker" github.com/kdelfour/cloud9-docker)

## Usage

    docker run -it -d -p 80:80 kdelfour/cloud9-docker
    
You can add a workspace as a volume directory with the argument *-v /your-path/workspace/:/workspace/* like this :

    docker run -it -d -p 80:80 -v /your-path/workspace/:/workspace/ kdelfour/cloud9-docker
    
## Build and run with custom config directory

Get the latest version from github

    git clone https://github.com/kdelfour/cloud9-docker
    cd cloud9-docker/

Build it

    sudo docker build --force-rm=true --tag="$USER/cloud9-docker:latest" .
    
And run

    sudo docker run -d -p 80:80 -v /your-path/workspace/:/workspace/ $USER/cloud9-docker:latest

### Enable basic authentication

Define `C9_USER` and `C9_PASS` environment variables.

    sudo docker run -d -p 80:80 -e C9_USER=demo -e C9_PASS=demo -v /your-path/workspace/:/workspace/ $USER/cloud9-docker:latest

### Run with Docker Compose

    docker-compose up -d

To run with basic authentication: copy `.env.template` to `.env`, update accordingly and re-run the docker-compose command.

*NOTE:* you must run `docker-compose down` first if you change the user/pass because the image will be cached otherwise.
    
Enjoy !!
