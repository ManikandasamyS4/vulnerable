pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/ManikandasamyS4/vulnerable.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build('astra:latest')
                }
            }
        }

        stage('Test API Endpoint') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'astra scan api https://heritageplus-notification.azurewebsites.net/api/PushNotification'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
