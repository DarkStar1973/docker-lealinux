FROM ubuntu:16.04

MAINTAINER Serge Tchesmeli 

RUN DEBIAN_FRONTEND=noninteractive  apt-get update &&  apt-get install -y software-properties-common && apt-add-repository ppa:ansible/ansible && apt-get update && apt-get -y install ansible openssh-server

RUN mkdir -p /var/run/sshd && chmod 0755 /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN /usr/bin/ssh-keygen -f /root/.ssh/id_rsa -N ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

