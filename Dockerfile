FROM alpine:3.8
LABEL maintainer="sameer@damagehead.com"

ENV SQUID_VERSION=3.5.27-r2 \
    SQUID_CACHE_DIR=/var/spool/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=squid

RUN apk add --no-cache squid=${SQUID_VERSION} perl=5.26.3-r0

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
