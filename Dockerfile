# Use a base image with the desired operating system and tools
FROM ubuntu:latest

# Set environment variables, if needed
ENV ASTRA_VERSION="1.2.3"
ENV ASTRA_HOME="/opt/astra"

# Install necessary packages
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install Astra tool
RUN mkdir -p $ASTRA_HOME \
    && curl -sSL https://github.com/astra-tool/astra/releases/download/v${ASTRA_VERSION}/astra_${ASTRA_VERSION}_linux_x86_64.tar.gz | tar -xzC $ASTRA_HOME

# Add Astra to the PATH
ENV PATH="${ASTRA_HOME}/bin:${PATH}"

# Set the working directory
WORKDIR /usr/src/app

# Copy your application files into the container
COPY . .

# Set any additional configurations or commands if needed
# For example:
# CMD ["astra", "scan", "--target", "https://example.com", "--output", "results.json"]
