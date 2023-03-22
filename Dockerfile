FROM amazonlinux:latest

LABEL maintainer="Trek10, Inc. <package-management@trek10.com>"

RUN yum update -y
RUN yum -y install \
  tar \
  gzip \
  gcc \
  openssl-devel \
  bzip2-devel \
  libffi-devel \
  zlib-devel \
  make

# python
RUN curl https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz -o /opt/Python-3.9.6.tgz
RUN cd /opt && tar xzf Python-3.9.6.tgz
RUN cd /opt/Python-3.9.6 && ./configure --enable-optimizations
RUN cd /opt/Python-3.9.6 && make install

# NodeJS
RUN curl -sL https://rpm.nodesource.com/setup_18.x | bash -
RUN yum install -y \
  nodejs

RUN pip3 install \
  awscli \
  aws-whoami \
  aws-sam-cli \
  yq \
  cfn-lint

RUN npm install -g \
  aws-organization-formation@1.0.9

# jq
RUN curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq
RUN chmod +x jq
RUN cp jq /usr/bin
