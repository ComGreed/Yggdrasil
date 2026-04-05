ARG BUILD_FROM
FROM $BUILD_FROM

LABEL That Vasket <thatv+codeforge@dismail.de>

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG=C.UTF-8

RUN echo "@edgecommunity https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --no-scripts bash sudo yggdrasil@edgecommunity=0.5.13-r0 \
    && rm -rf /var/cache/apk/*

COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
