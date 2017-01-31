FROM postgres:9.6-alpine

RUN apk add --no-cache bash

COPY pgbkp.sh /pgbkp.sh
RUN chmod u+x /pgbkp.sh

ENTRYPOINT ["/pgbkp.sh"]
