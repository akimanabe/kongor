FROM rocker/rstudio:3.6.3

COPY . /kongor

ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen ja_JP.UTF-8 \
    && /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update && apt-get install -y \
  fonts-ipaexfont \
  fonts-noto-cjk

RUN apt-get -y update -qq \
  && apt-get install -y --no-install-recommends \
  libgsl0-dev \
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  libsasl2-dev \
  libgit2-dev \
  && install2.r --error \
    --deps TRUE \
    tidyverse \
    gridExtra \
    devtools \
    BiocManager\
    && R -e "devtools::install_dev_deps('/kongor', dep = TRUE)"

WORKDIR /kongor
