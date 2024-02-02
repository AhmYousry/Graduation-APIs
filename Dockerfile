FROM ruby:3.2.2-alpine


ENV USER=apis

WORKDIR /app
RUN apk --no-cache --available upgrade
RUN apk add --no-cache build-base \
  git \
  postgresql-dev \
  postgresql-client \
  tzdata \
  curl bash vim \
  openssh bash-completion \
  nodejs npm \
  yarn



COPY Gemfile Gemfile.lock /app/
RUN bundle config set --local path '/usr/local/bundle'

RUN adduser -D ${USER} && bundle install && chown -R ${USER}:${USER} /usr/local/bundle
COPY --chown=${USER}:${USER} . .

USER ${USER}

EXPOSE 4000

CMD [ "bundle","exec","rails", "server", "-b", "0.0.0.0", "-e", "production" ]
