# Use a public Python base image
FROM --platform=$TARGETOS/$TARGETARCH python:3.13-slim-bookworm

LABEL author="Xevrac" maintainer="accounts@deltanetworks.au"

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps tini && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -d /home/container container

# Switch to non-root user
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Set stop signal
STOPSIGNAL SIGINT

# Copy entrypoint script
COPY --chown=container:container ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]
