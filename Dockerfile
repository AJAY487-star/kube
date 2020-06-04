FROM centos:latest
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

RUN chmod +x kubectl
RUN mv kubectl /usr/bin/
RUN yum install java -y
RUN yum install sudo -y
RUN yum install openssh-server -y
RUN ssh-keygen -A
RUN mkdir /root/jenkins
RUN mkdir /root/.kube
COPY client.key /root/
COPY ca.crt /root/
COPY client.crt /root/
COPY config /root/.kube
COPY deployment.yml /root/
CMD [ "/usr/sbin/sshd" , "D" ] && /bin/bash
CMD /bin/bash
