pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ManikandasamyS4/vulnerable.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Astra Scan') {
            steps {
                script {
                    try {
                        // Check Docker version and status
                        sh 'docker --version'
                        sh 'docker info'

                        // Pull and run the Astra CLI Docker image
                        docker.image('your-docker-repo/astra-cli-image:latest').inside {
                            sh 'astra scan --target https://heritageplus-notification.azurewebsites.net/api/PushNotification --output results.json'
                        }

                        // Archive the scan results
                        archiveArtifacts artifacts: 'results.json', allowEmptyArchive: true
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
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
