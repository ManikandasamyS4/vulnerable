# Use a base image with the desired operating system and tools
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set environment variables, if needed
ENV ASTRA_VERSION="1.2.3"
ENV ASTRA_HOME="C:\\opt\\astra"

# Download and install Astra tool
RUN mkdir %ASTRA_HOME% \
    && curl -sSL -o astra.tar.gz https://github.com/astra-tool/astra/releases/download/v%ASTRA_VERSION%/astra_%ASTRA_VERSION%_windows_amd64.tar.gz \
    && tar -xzf astra.tar.gz -C %ASTRA_HOME% --strip-components=1 \
    && del astra.tar.gz

# Add Astra to the PATH
ENV PATH="%ASTRA_HOME%\\bin;%PATH%"

# Set the working directory
WORKDIR /usr/src/app

# Copy your application files into the container
COPY . .

# Set any additional configurations or commands if needed
# For example:
# CMD ["astra", "scan", "--target", "https://example.com", "--output", "results.json"]
