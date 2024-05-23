# Use an official Linux base image
FROM ubuntu:20.04

# Set environment variables
ENV ASTRA_VERSION=1.2.3
ENV ASTRA_HOME=/opt/astra

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl tar && \
    rm -rf /var/lib/apt/lists/*

# Download and install Astra tool
RUN mkdir -p $ASTRA_HOME && \
    curl -sSL https://github.com/astra-tool/astra/releases/download/v${ASTRA_VERSION}/astra_${ASTRA_VERSION}_linux_x86_64.tar.gz | tar -xzC $ASTRA_HOME

# Set the working directory
WORKDIR $ASTRA_HOME

# Set the PATH environment variable
ENV PATH=$ASTRA_HOME:$PATH

# Verify installation
RUN astra --version

# Set the entrypoint
ENTRYPOINT ["astra"]
