FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y \
    yarn \
    postgresql-client \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    yarn \
    libffi-dev \
    libreadline-dev \
    zlib1g-dev \
    liblzma-dev \
    tzdata \
    file \
    git

WORKDIR /jedis-project
COPY . .

ENV BUNDLE_PATH /gems
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["s", "-b", "0.0.0.0"]
