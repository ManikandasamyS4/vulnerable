# Navigate to the directory containing your Dockerfile
cd C:\Program Files\Docker\Docker

# Build the Docker image
docker build -t astra/astra-cli-image:latest .

# Push the Docker image to a container registry
docker push astra/astra-cli-image:latest
