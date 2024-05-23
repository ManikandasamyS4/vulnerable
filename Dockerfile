# Use a base image (use the appropriate base image for Astra)
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    git

# Clone the Astra repository and install
RUN git clone https://github.com/flipkart-incubator/Astra.git /opt/astra && \
    cd /opt/astra && \
    ls -l && \  # List the contents of the directory for debugging
    cat README.md && \  # Print the contents of README.md for debugging
    bash scripts/install.sh  # Adjusted path to the installation script

# Expose necessary ports
EXPOSE 8080 9090

# Set the default command to run Astra
CMD ["/opt/astra/bin/astra", "start"]  # Adjust the command to how Astra is started
