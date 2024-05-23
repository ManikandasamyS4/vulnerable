# Use a Python base image
FROM python:3.9-slim

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone Astra repository and install
RUN git clone https://github.com/flipkart-incubator/Astra.git && \
    cd Astra && \
    python setup.py install
