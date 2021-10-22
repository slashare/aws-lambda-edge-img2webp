FROM amazonlinux

WORKDIR /tmp

#install the dependencies
RUN yum -y install gcc-c++ && yum -y install findutils && yum -y install tar && yum -y install gzip && yum -y install make

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

RUN /bin/bash -c "source /root/.nvm/nvm.sh; nvm install 14.18"

RUN { \
  echo 'export NVM_DIR=~/.nvm'; \
  echo '. ~/.nvm/nvm.sh'; \
  } > /root/.bashrc

CMD /bin/bash -c "source /root/.nvm/nvm.sh; nvm use 14.18"

WORKDIR /build