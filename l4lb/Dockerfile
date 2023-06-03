FROM ubuntu:22.04

WORKDIR /usr/src

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    sudo \
    curl \
    git \
    vim \
    clang \
    cmake \
    make \
    g++ \
    gcc \
    gdb

RUN apt-get install -y \
    build-essential \
    ssh \
    rsync \
    net-tools \
    iptables \
    iproute2 \
    inetutils-ping \
    host \
    mtr-tiny \
    tcpdump \
    python3-pip \

RUN echo no | apt-get install -y tshark

# RUN apt-get install python3-pip
RUN pip3 install scapy && pip3 install pyshark

# RUN wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tar.xz && \
#     tar -xf Python-3.9.0.tar.xz && \
#     cd Python-3.9.0 && \
#     ./configure && \
#     make altinstall && \
#     cd .. && rm -rf Python-3.9.0.tar.xz

# RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update
# ENV TZ=Europe/Minsk
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN apt-get install -y python3.9
# RUN alias=/usr/bin/python3.9
# RUN apt-get install -y python3-pip
# RUN pip3 install scapy

#sudo apt-get install linux-headers-generic
#sudo apt-get install -y build-essential cmake pciutils libnuma-dev

COPY . /usr/src

COPY sshd_config_test_clion /etc/ssh/sshd_config_test_clion

RUN mkdir /run/sshd


RUN apt-get update && apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN /etc/init.d/ssh restart
RUN echo 'root:mypassword' | chpasswd
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN useradd -m user && yes password | passwd user

RUN usermod -s /bin/bash user
RUN usermod -aG sudo user
RUN chmod 777 loadBalancer.py


EXPOSE 8888/udp
EXPOSE 22

# CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]
ENTRYPOINT ["/usr/src/load-balancer-command.sh"]
# the load balancer should be run in sudo mode