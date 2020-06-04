FROM centos:latest
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x kubectl
RUN mv kubectl /usr/bin/
RUN yum install java -y
RUN yum install sudo -y
RUN yum install openssh-server -y
RUN ssh-keygen -A
RUN mkdir /root/jenkins
COPY client.key /root/
COPY ca.crt /root/
COPY client.key /root/
COPY myinfo /root/.kube/config
COPY deployment.yml /root/
CMD [ "/usr/sbin/sshd" , "D" ] 
CMD /bin/bash
