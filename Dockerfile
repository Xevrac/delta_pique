# Pull the slim Python image
FROM python:3.13-slim-bookworm

LABEL author="Xevrac" maintainer="accounts@deltanetworks.au"

# Install system dependencies
RUN apt update && apt install -y \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Add a non-root container user
RUN useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Default command
CMD ["bash"]