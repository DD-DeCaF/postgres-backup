FROM postgres:9.6-alpine

RUN apk add --no-cache bash

COPY pgbkp.sh /opt/pgbkp.sh
RUN chmod u+x /opt/pgbkp.sh

ENTRYPOINT ["/opt/pgbkp.sh"]
