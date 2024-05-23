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
                    // Build the Docker image
                    sh 'docker build -t astra:latest .'
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    // Run tests on the Docker image
                    // Add your test script or commands here
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: '33', usernameVariable: 'manikandasamy', passwordVariable: 'Maniselvaraj@33')]) {
                        sh "docker login -u $manikandasamy -p $Maniselvaraj@33"
                    }
                    // Tag and push the image to Docker Hub
                    sh 'docker tag astra:latest $manikandasamy/astra:latest'
                    sh 'docker push $manikandasamy/astra:latest'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up the Docker environment
                    sh 'docker rmi astra:latest'
                    sh 'docker rmi $manikandasamy/astra:latest'
                }
            }
        }
    }
}
