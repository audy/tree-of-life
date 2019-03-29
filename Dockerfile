FROM ruby:2.6.0

WORKDIR /app

ADD * /app/

RUN bundle install

ENTRYPOINT ["rackup"]
