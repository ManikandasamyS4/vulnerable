# Use an Alpine Linux base image
FROM alpine:3.14

# Install dependencies (curl and git)
RUN apk add --no-cache curl git

# Copy the Astra zip file from the host machine into the image
COPY ./Astra.zip /tmp/Astra.zip

# Extract the Astra zip file
RUN unzip /tmp/Astra.zip -d /opt \
    && rm /tmp/Astra.zip

# Set the working directory to the Astra directory
WORKDIR /opt/Astra

# Make the Astra executable file executable
RUN chmod +x astra

# Add /opt/Astra to the PATH environment variable
ENV PATH="/opt/Astra:${PATH}"

# Define the command to run when the container starts
CMD ["astra"]
