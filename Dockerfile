FROM ruby:4.0.2-alpine3.23

ARG WORKDIR=/app

WORKDIR ${WORKDIR}

EXPOSE 8808

RUN gem install --no-document \
        commonmarker:2.8.0 \
        webrick:1.9.2 \
        yard:0.9.40 \
        && \
    rm -rf "${GEM_HOME}"/cache/*

RUN addgroup -g 1000 -S yard && \
    adduser -G yard -S -u 1000 yard

COPY --chown=yard:yard config.yml /home/yard/.yard/config

USER 1000:1000

VOLUME ${WORKDIR}

CMD ["yard", "server", "--reload"]
