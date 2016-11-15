FROM ubuntu:16.04
MAINTAINER Serge Tchesmeli 
RUN DEBIAN_FRONTEND=noninteractive  apt-get update &&  apt-get install -y software-properties-common && apt-add-repository ppa:ansible/ansible && apt-get update && apt-get -y install ansible

CMD ["/bin/bash"]

