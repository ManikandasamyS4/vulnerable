pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ManikandasamyS4/vulnerable.git'
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
                        docker.image('astra/astra-cli-image:latest').inside {
                            sh 'astra scan --target https://heritageplus-notification.azurewebsites.net/api/PushNotification --output results.json'
                        }
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
