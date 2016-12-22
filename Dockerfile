FROM ruby:2.3

MAINTAINER Bjoern Stierand <bjoern-github@innovention.de>
LABEL version="0.2"
LABEL description="Docker image for sifttter-redux-known"

# install sifttter-redux-known
RUN ["/usr/bin/git", "clone", "https://github.com/egoexpress/sifttter-redux-known.git"]
WORKDIR "/sifttter-redux-known"
RUN ["/usr/local/bin/gem", "build", "sifttter-redux-known.gemspec"]
RUN ["/usr/local/bin/gem", "install", "sifttter-redux-known-1.0.gem"]

# fix bug in ruby library
COPY files/logger_extensions.rb /usr/local/bundle/gems/cliutils-2.2.6/lib/cliutils/ext/logger_extensions.rb

# install Dropbox-Uploader
RUN mkdir /usr/local/opt
WORKDIR "/usr/local/opt"
RUN ["/usr/bin/git", "clone", "https://github.com/andreafabrizi/Dropbox-Uploader.git"]

# prepare base config for sifttter-redux-known
COPY files/sifttter_redux.yaml /root/.sifttter_redux
RUN mkdir /tmp/sifttter-redux-known && mkdir /tmp/sifttter

# change default encoding to UTF-8
RUN apt-get update && \
    apt-get install locales && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

COPY files/bashrc /root/.bashrc
WORKDIR "/"

# setup entrypoint
COPY files/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 555 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]