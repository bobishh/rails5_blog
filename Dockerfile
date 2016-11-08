FROM ruby:2.3.1-alpine

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base git" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev" \
    RUBY_PACKAGES="ruby ruby-io-console ruby-json yaml nodejs"

RUN apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES && \
  gem install -N bundler

ENV APP_HOME /blog

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

VOLUME $APP_HOME/public

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install --retry 5

ADD . $APP_HOME

EXPOSE 4242
