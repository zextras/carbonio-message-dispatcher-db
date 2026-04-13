FROM registry.dev.zextras.com/dev/carbonio-sidecar:latest

# psql is needed by the bootstrap script to create the database
RUN apt-get update && apt-get install -y postgresql-client openssl && rm -rf /var/lib/apt/lists/*

# Service registration
COPY package/carbonio-message-dispatcher-db.hcl /consul/config/

# Setup files at the path the setup script expects
COPY package/service-protocol.json /etc/carbonio/message-dispatcher-db/service-discover/
COPY package/intentions.json       /etc/carbonio/message-dispatcher-db/service-discover/
COPY package/policies.json         /etc/carbonio/message-dispatcher-db/service-discover/

# Setup script
COPY package/carbonio-message-dispatcher-db /usr/local/bin/carbonio-message-dispatcher-db
RUN chmod +x /usr/local/bin/carbonio-message-dispatcher-db

# Bootstrap script (creates DB user, database, saves credentials to consul KV)
COPY package/carbonio-message-dispatcher-db-bootstrap /usr/local/bin/carbonio-message-dispatcher-db-bootstrap
RUN chmod +x /usr/local/bin/carbonio-message-dispatcher-db-bootstrap

# Entrypoint script
COPY docker/sidecar/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV SERVICE_NAME=carbonio-message-dispatcher-db
ENV PGPASSWORD=admin
ENV POSTGRES_USER=admin
ENV POSTGRES_HOST=localhost
ENV POSTGRES_PORT=5432

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
