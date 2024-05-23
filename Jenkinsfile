pipeline {
    agent any
    stages {
        stage('Astra Scan') {
            steps {
                script {
                    // Ensure the working directory is an absolute path
                    def workspaceDir = pwd()
                    def absolutePath = workspaceDir + "C:\Program Files\Docker\Docker"

                    // Run Docker command with the absolute path
                    bat "docker inspect -f . astra/astra-cli-image:latest"
                }
            }
        }
    }
}
