FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install piqueserver
RUN pip install --no-cache-dir piqueserver

WORKDIR /home/container

CMD ["piqueserver"]
