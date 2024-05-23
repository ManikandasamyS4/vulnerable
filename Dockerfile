# Use a base image (use the appropriate base image for Astra)
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common

# Install Astra (replace this with the actual installation commands for Astra)
RUN curl -sSL https://https://github.com/flipkart-incubator/Astra.git | bash

# Expose necessary ports
EXPOSE 8080 9090

# Set the default command to run Astra
CMD ["astra", "start"]
