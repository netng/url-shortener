FROM ruby:3.0.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /url-shortener

WORKDIR /url-shortener

COPY Gemfile /url-shortener/Gemfile

COPY Gemfile.lock /url-shortener/Gemfile.lock

RUN bundle install

COPY . /url-shortener
