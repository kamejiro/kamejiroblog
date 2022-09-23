FROM ruby:2.7.5-alpine

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
ENV ROOT=/myapp \
    GEM_HOME=/bundle \
    BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH
ENV BUNDLER_VERSION 2.2.22
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=1
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

WORKDIR $ROOT

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
      gcc \
      g++ \
      libc-dev \
      libxml2-dev \
      linux-headers \
      make \
      nodejs \
      postgresql \
      postgresql-dev \
      tzdata \
      imagemagick \
      yarn && \
    apk add --virtual build-packs --no-cache \
      build-base \
      curl-dev

COPY Gemfile $ROOT
COPY Gemfile.lock $ROOT

RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install -j4
# 不要ファイル削除
RUN rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/* && \
apk del build-packs

COPY . $ROOT

#Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "/usr/bin/entrypoint.sh" ]
CMD sh -c "rm -f tmp/pids/server.pid && bundle exec puma -C config/puma.rb"
EXPOSE 3000