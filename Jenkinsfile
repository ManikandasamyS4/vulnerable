jenkinsfile

pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/ManikandasamyS4/vulnerable.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('astra:latest')
                }
            }
        }

        stage('Test API Endpoint') {
            steps {
                script {
                    docker.image('astra:latest').inside {
                        // Replace 'http://example.com/api' with your actual API endpoint
                        sh 'astra scan api https://heritageplus-notification.azurewebsites.net/api/PushNotification'
                    }
                }
            }
        }
    }
}
