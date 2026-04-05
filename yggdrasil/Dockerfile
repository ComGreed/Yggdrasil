ARG BUILD_FROM
FROM $BUILD_FROM

LABEL ComGreed <thats@noemail.com>

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG=C.UTF-8

RUN apk add --no-cache --no-scripts \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    bash sudo yggdrasil=0.5.13-r0

COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
