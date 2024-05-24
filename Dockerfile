FROM alpine:3.14

# Install necessary dependencies
RUN apk add --no-cache \
    curl \
    git

# Clone the Astra repository
RUN git clone https://github.com/flipkart-incubator/Astra.git /opt/astra

# Make sure the Astra CLI is executable
WORKDIR /opt/astra
RUN chmod +x astra

# Set /opt/astra in the PATH
ENV PATH="/opt/astra:${PATH}"

# Command to keep the container running (useful for debugging)
CMD ["tail", "-f", "/dev/null"]
