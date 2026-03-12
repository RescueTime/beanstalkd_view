FROM ruby:3.3-slim

RUN apt-get update && apt-get install -y build-essential \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile Gemfile.lock beanstalkd_view.gemspec ./
COPY lib/beanstalkd_view/version.rb lib/beanstalkd_view/
RUN bundle config set --local without development \
  && bundle config set --local with docker \
  && bundle install
COPY . .

ENV BUNDLE_WITH=docker

EXPOSE 5678

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "5678", "config.ru"]
