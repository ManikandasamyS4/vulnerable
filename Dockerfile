FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Clone the Astra repository
RUN git clone https://github.com/flipkart-incubator/Astra.git /opt/astra

# Make sure the Astra CLI is executable
WORKDIR /opt/astra
RUN chmod +x astra

# Set /opt/astra in the PATH
ENV PATH="/opt/astra:${PATH}"

# Command to keep the container running (useful for debugging)
CMD ["tail", "-f", "/dev/null"]
