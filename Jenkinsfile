pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ManikandasamyS4/vulnerable.git'
            }
        }
        stage('Docker Pull Dastardly from Burp Suite container image') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-credentials') {
                        docker.image('portswigger/dastardly').pull()
                    }
                }
            }
        }
        stage('Docker run Dastardly from Burp Suite Scan') {
            steps {
                script {
                    docker.image('portswigger/dastardly').inside {
                        sh 'dastardly scan'
                    }
                }
            }
        }
    }
    post {
        always {
            junit 'test-results/*.xml'
        }
    }
}
