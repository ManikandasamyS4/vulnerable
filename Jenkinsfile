pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone your GitHub repository
                git branch: 'main', credentialsId: 'your-github-credentials', url: 'https://github.com/your-username/your-repo.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build Docker image from Dockerfile in the repository
                script {
                    def customImage = docker.build('my-custom-image:latest', '.')
                }
            }
        }

        // Add more stages for your pipeline (e.g., testing, deployment, etc.)
    }
    
    post {
        always {
            // Clean up Docker resources
            cleanWs()
        }
    }
}
