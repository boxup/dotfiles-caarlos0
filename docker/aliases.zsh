#!/bin/sh
# ------------------------------------
# Docker alias and function
# ------------------------------------

alias d='docker $*'
alias dc='docker-compose $*'
alias dm='docker-machine $*'


# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Convert docker-machine commands to aliases directly
alias dmactive="docker-machine active"
alias dmcreate="docker-machine create"
alias dmconfig="docker-machine config"
alias dminspect="docker-machine inspect"
alias dmip="docker-machine ip"
alias dmkill="docker-machine kill"
alias dmls="docker-machine ls"
alias dmregenerate-certs="docker-machine regenerate-certs"
alias dmrestart="docker-machine restart"
alias dmrm="docker-machine rm"
alias dmenv="docker-machine env"
alias dmssh="docker-machine ssh"
alias dmstart="docker-machine start"
alias dmstop="docker-machine stop"
alias dmupgrade="docker-machine upgrade"
alias dmurl="docker-machine url"
alias dmhelp="docker-machine help"

# customized aliases

# list all docker processes included stop containers.
alias dpa="docker ps -a"

# list all untagged images (dangling)
alias dangline="docker images -f "dangling=true" -q"

# get dockerfile from image

# Usages: dfimage <image> [-f], example: dfimage nginx
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm centurylink/dockerfile-from-image"

# list images and merge with tags
alias dit="docker images |awk 'NR==1{l=length(\$0)}{printf \"%-20s %-20s %-20s\t%s:%s\n\",substr(\$0,l-51,20),substr(\$0,l-31,20),substr(\$0,l-11),\$1,\$2}'"

# run jq via container. So you can run all commands in http://stedolan.github.io/jq/tutorial/ as normal, just replace jq with djq

# example: curl 'https://api.github.com/repos/stedolan/jq/commits?per_page=5' |djq '.[0] | {message: .commit.message, name: .commit.committer.name}'
alias djq='docker run --rm ryfow/jq'

# list the last container id
alias dl='docker ps -l -q'
