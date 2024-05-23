pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build('astra-image', '.')
                }
            }
        }
        stage('Astra Scan') {
            steps {
                script {
                    docker.image('astra-image').inside {
                        bat 'astra scan --target https://heritageplus-notification.azurewebsites.net/api/PushNotification --output results.json'
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
                // Add your deployment steps here
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
