pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add any build steps if necessary
            }
        }
        stage('Astra Scan') {
            steps {
                script {
                    try {
                        withCredentials([string(credentialsId: 'docker-username', variable: 'DOCKER_USERNAME'), string(credentialsId: 'docker-password', variable: 'DOCKER_PASSWORD')]) {
                            // Perform Docker login
                            bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin"
                            
                            // Ensure Docker is installed and running on the Jenkins host
                            docker.image('astra/astra-cli-image:latest').inside {
                                sh 'astra scan --target https://heritageplus-notification.azurewebsites.net/api/PushNotification --output results.json'
                            }
                            
                            // Archive the scan results
                            archiveArtifacts artifacts: 'results.json', allowEmptyArchive: true
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }
        stage('Deploy') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                echo 'Deploying...'
                // Add deployment steps if necessary
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            // Add any cleanup steps if necessary
        }
    }
}
