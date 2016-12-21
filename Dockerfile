FROM ruby:2.3

MAINTAINER Bjoern Stierand <bjoern-github@innovention.de>

RUN ["/usr/bin/git", "clone", "https://github.com/egoexpress/sifttter-redux-known.git"]

WORKDIR "/sifttter-redux-known"
RUN ["/usr/local/bin/gem", "build", "sifttter-redux-known.gemspec"]
RUN ["/usr/local/bin/gem", "install", "sifttter-redux-known-1.0.gem"]

COPY files/logger_extensions.rb /usr/local/bundle/gems/cliutils-2.2.6/lib/cliutils/ext/logger_extensions.rb
