pipeline {
    agent any
    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Docker Pull Dastardly from Burp Suite container image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker pull burpsuite/dastardly'
                    } else {
                        bat 'docker pull burpsuite/dastardly'
                    }
                }
            }
        }
        stage('Docker run Dastardly from Burp Suite Scan') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'nohup docker run burpsuite/dastardly &'
                    } else {
                        bat 'start /B docker run burpsuite/dastardly'
                    }
                }
            }
        }
    }
    post {
        always {
            junit '**/target/test-*.xml'
        }
    }
}
