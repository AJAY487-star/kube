FROM centos:latest
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

CMD chmod +x kubectl
CMD mv kubectl /usr/bin/
RUN yum install sudo -y
RUN yum install openssh-server -y
RUN ssh-keygen -A
COPY ca.crt /root/
COPY client.key /root/
COPY myinfo /root/.kube/config