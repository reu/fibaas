FROM ruby:3.3.0-preview1 AS base
ENV RUBY_YJIT_ENABLE=1
WORKDIR /app

FROM base AS prod
# Gems
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install 
# App
COPY config.ru .
# Expose and run
EXPOSE 4000
CMD ["rackup"]
