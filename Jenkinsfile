pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'manikandasamy/astra'
        DOCKER_HUB_CREDENTIALS = '33'  // This should be the ID of your Jenkins credentials
        API_ENDPOINT = 'https://heritageplus-notification.azurewebsites.net/api/PushNotification'
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
                echo 'Testing Docker Image...'
            }
        }

        stage('Verify Astra CLI Installation') {
            steps {
                script {
                    // Verify the Astra CLI installation
                    bat 'docker run astra:latest which astra'
                    bat 'docker run astra:latest ls -l /opt/astra/astra'
                }
            }
        }

        stage('Run Astra CLI Command') {
            steps {
                script {
                    // Run the Astra CLI command with the Docker image
                    bat "docker run -e API_ENDPOINT=${API_ENDPOINT} astra:latest ./astra command"
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub using credentials
                    withCredentials([usernamePassword(credentialsId: 33, usernameVariable: 'manikandan@astuto.ai', passwordVariable: 'Maniselvaraj@33')]) {
                        bat "docker login -u \"%manikandan@astuto.ai%\" -p \"%Maniselvaraj@33%\""
                    }

                    // Tag and push the image to Docker Hub
                    bat "docker tag astra:latest ${manikandasamy/astra}:latest"
                    bat "docker push ${manikandasamy/astra}:latest"
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up the Docker environment
                    bat 'docker rmi astra:latest'
                    bat "docker rmi ${manikandasamy/astra}:latest"
                }
            }
        }
    }
}
