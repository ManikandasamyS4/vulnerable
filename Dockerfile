FROM alpine:3.14

# Install necessary packages
RUN apk add --no-cache \
    curl \
    git

# Clone the Astra repository
RUN git clone https://github.com/flipkart-incubator/Astra.git /opt/astra

# Set the working directory
WORKDIR /opt/astra

# Ensure the Astra CLI is executable
RUN chmod +x ./astra/astra

# Set /opt/astra in the PATH
ENV PATH="/opt/astra:${PATH}"

# Define the entrypoint
ENTRYPOINT ["astra"]
