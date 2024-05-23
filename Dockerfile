# Use the base image with the necessary tools (e.g., Python, Git)
FROM python:3.9-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone Astra repository and install
RUN git clone https://github.com/flipkart-incubator/Astra.git && \
    cd Astra && \
    python setup.py install

# Set the working directory
WORKDIR /Astra

# Command to run when the container starts
CMD ["astra"]
