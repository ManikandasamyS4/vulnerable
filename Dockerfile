# Use a Windows base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install Git and curl
RUN powershell -Command " \
    Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.33.0.windows.2/MinGit-2.33.0.2-64-bit.zip -OutFile C:\git.zip ; \
    Expand-Archive C:\git.zip -DestinationPath C:\git ; \
    $env:Path += \";C:\git\cmd\" ; \
    Remove-Item C:\git.zip -Force ; \
    Invoke-WebRequest -Uri https://curl.se/windows/dl-7.79.1_1/curl-7.79.1_1-win64-mingw.zip -OutFile C:\curl.zip ; \
    Expand-Archive C:\curl.zip -DestinationPath C:\curl ; \
    $env:Path += \";C:\curl\bin\" ; \
    Remove-Item C:\curl.zip -Force"

# Clone the Astra repository
RUN git clone https://github.com/flipkart-incubator/Astra.git C:\astra

# Set working directory
WORKDIR C:\astra

# Set execution permission for astra file (not required in Windows)
# Ensure C:\astra is in the PATH (not required in Windows)
