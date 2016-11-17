FROM ubuntu:16.04

MAINTAINER Serge Tchesmeli 
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:ansible/ansible && apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ansible 

CMD  ["/bin/bash"]
