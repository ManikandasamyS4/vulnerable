pipeline {
    agent any
    
    stages {
        stage('Checkout SCM') {
            steps {
                // Checkout your source code from Git
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Build your Docker image
                script {
                    docker.build("astra-cli-image:latest", ".C:/Users/Manikandasamy/vulnerable")
                }
            }
        }
        stage('Astra Scan') {
            steps {
                // Inspect the Docker image
                script {
                    docker.image("astra-cli-image:latest").inspect()
                }
                // Pull the Docker image
                script {
                    docker.image("astra-cli-image:latest").pull()
                }
            }
        }
        stage('Deploy') {
            steps {
                // Add deployment steps here
            }
        }
    }
    
    post {
        always {
            // Clean up resources
            echo 'Cleaning up...'
            cleanWs()
        }
    }
}
