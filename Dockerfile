FROM ruby:3.4.9-alpine3.23

ARG WORKDIR=/app

WORKDIR ${WORKDIR}

EXPOSE 8808

RUN apk add --no-cache --update --virtual .build-deps gcc libc-dev make && \
    gem install --no-document redcarpet webrick yard && \
    apk del .build-deps && \
    rm -rf "${GEM_HOME}"/cache/*

RUN addgroup -g 1000 -S yard && \
    adduser -G yard -S -u 1000 yard

COPY --chown=yard:yard config.yml /home/yard/.yard/config

USER 1000:1000

VOLUME ${WORKDIR}

CMD ["yard", "server", "--reload"]
