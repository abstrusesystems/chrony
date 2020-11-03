FROM alpine:latest
LABEL maintainer="github -at- abstruse -dot- systems"

ENV DATA=/srv/chrony

RUN apk add --update --no-cache chrony

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 123/udp

VOLUME ["${DATA}"]

ENTRYPOINT ["sh","/sbin/entrypoint.sh"]

CMD ["/usr/sbin/chronyd"]
