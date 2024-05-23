# Navigate to the directory containing your Dockerfile
cd /path/to/Dockerfile

# Build the Docker image
docker build -t your-docker-repo/astra-cli-image:latest .

# Push the Docker image to a container registry
docker push your-docker-repo/astra-cli-image:latest
