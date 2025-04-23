FROM ruby:3.4-alpine

RUN apk add --no-cache --update gcc libc-dev make && \
    gem install --no-document redcarpet webrick yard && \
    apk del gcc libc-dev make && \
    rm -rf "${GEM_HOME}"/cache/*

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN addgroup -g 1000 -S yard && \
    adduser -G yard -S -u 1000 yard

USER 1000:1000

COPY config.yml /home/yard/.yard/config

WORKDIR /app

VOLUME /app

EXPOSE 8808

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["yard", "server", "--reload"]
