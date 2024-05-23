pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'manikandasamy/astra'
        DOCKER_HUB_CREDENTIALS = '33'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git url: 'https://github.com/ManikandasamyS4/vulnerable.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    bat 'docker build -t astra:latest .'
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                // Placeholder step
                echo 'Testing Docker Image...'
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub using email address
                    withCredentials([usernamePassword(credentialsId: 33, usernameVariable: 'manikandan@astuto.ai', passwordVariable: 'Maniselvaraj@33')]) {
                        bat "docker login -u \"$manikandan@astuto.ai\" -p \"$Maniselvaraj@33\""
                    }

                    // Tag and push the image to Docker Hub
                    bat "docker tag astra:latest \"$manikandasamy/astra:latest\""
                    bat "docker push \"$manikandasamy/astra:latest\""
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up the Docker environment
                    bat 'docker rmi astra:latest'
                    bat "docker rmi $manikandasamy/astra:latest"
                }
            }
        }
    }
}
