# Base image: PyTorch + Jupyter + dev tools
FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

# Set working directory
WORKDIR /workspace

# Install Node.js for your Node app
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Qdrant GPU binary
RUN curl -L https://github.com/qdrant/qdrant/releases/download/v1.14.1/qdrant_v1.14.1-gpu-nvidia_linux_amd64.tar.gz -o /tmp/qdrant.tar.gz && \
    tar -xzf /tmp/qdrant.tar.gz -C /usr/local/bin && \
    rm /tmp/qdrant.tar.gz

# Expose ports
EXPOSE 8888
EXPOSE 3000
EXPOSE 6333
EXPOSE 6334
