FROM ruby:2.6.4

ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

ENV BUILD_PACKAGES node.js default-libmysqlclient-dev default-mysql-client

RUN apt-get update -qq && apt-get install -y $BUILD_PACKAGES && rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT

COPY Gemfile.lock $APP_ROOT

RUN bundle install

