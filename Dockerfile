# Use a lightweight Linux distribution as the base image
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y curl

# Install Astra CLI
RUN curl -sSL https://install.astrasecurity.io | bash

# Set the entrypoint to the Astra CLI
ENTRYPOINT ["astra"]
