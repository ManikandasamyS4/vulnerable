# Use a Windows Server Core base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set environment variables
ENV ASTRA_VERSION=1.2.3
ENV ASTRA_HOME="C:\\opt\\astra"

# Create the Astra home directory
RUN mkdir %ASTRA_HOME%

# Download and extract Astra tool
RUN powershell -Command `
    $ErrorActionPreference = 'Stop'; `
    Invoke-WebRequest -Uri https://github.com/astra-tool/astra/releases/download/v${env:ASTRA_VERSION}/astra_${env:ASTRA_VERSION}_windows_x86_64.zip -OutFile C:\astra.zip; `
    Expand-Archive -Path C:\astra.zip -DestinationPath %ASTRA_HOME%; `
    Remove-Item -Force C:\astra.zip

# Set the PATH environment variable
ENV PATH="%ASTRA_HOME%;%PATH%"

# Verify installation
RUN cmd /c %ASTRA_HOME%\astra.exe --version

# Set the working directory
WORKDIR %ASTRA_HOME%

# Set the entrypoint
ENTRYPOINT ["astra.exe"]
