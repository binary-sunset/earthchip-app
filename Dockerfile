FROM ruby:3.0.1-alpine

RUN apk add --update --virtual \
    runtime-deps \
    postgresql-client \
    build-base \
    libxml2-dev \
    libxslt-dev \
    libidn \
    libidn-dev \
    nodejs \
    yarn \
    libffi-dev \
    readline \
    build-base \
    postgresql-dev \
    libc-dev \
    linux-headers \
    readline-dev \
    file \
    imagemagick \
    git \
    tzdata \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
ENV RAILS_ENV production

RUN yarn
RUN bundle

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
