pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Astra Scan') {
            steps {
                script {
                    try {
                        // Ensure Docker is installed and running on the Jenkins host
                        docker.image('C:/Users/Manikandasamy/vulnerable/astra-cli-image:latest').inside {
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
