# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables
ENV ASTRA_VERSION=1.2.3
ENV ASTRA_HOME=/opt/astra

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl tar && \
    rm -rf /var/lib/apt/lists/*

# Download Astra tool and extract it
RUN mkdir -p $ASTRA_HOME && \
    curl -sSL -o /tmp/astra.tar.gz https://github.com/astra-tool/astra/releases/download/v${ASTRA_VERSION}/astra_${ASTRA_VERSION}_linux_x86_64.tar.gz && \
    tar -xzf /tmp/astra.tar.gz -C $ASTRA_HOME && \
    rm /tmp/astra.tar.gz

# Set the working directory
WORKDIR $ASTRA_HOME

# Set the PATH environment variable
ENV PATH=$ASTRA_HOME:$PATH

# Verify installation
RUN astra --version

# Set the entrypoint
ENTRYPOINT ["astra"]
