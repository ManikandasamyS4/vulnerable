pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/ManikandasamyS4/vulnerable.git', branch: 'main'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Check if the Docker Daemon is accessible
                    bat 'docker --version'
                    // Build Docker Image
                    bat 'docker build -t my-image:latest .'
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
