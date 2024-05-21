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
                    docker.build('my-image:latest', '.')
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
