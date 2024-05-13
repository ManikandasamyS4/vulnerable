pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from GitHub
                git credentialsId: 'your-github-credentials', url: 'https://github.com/ManikandasamyS4/vulnerable.git'
            }
        }
        
        stage('Build') {
            steps {
                // Build your application
                sh 'mvn clean package'
            }
        }
        
        stage('Test') {
            steps {
                // Run unit tests
                sh 'mvn test'
            }
        }
        
        stage('Security Scan') {
            steps {
                // Perform security scanning (e.g., using OWASP Dependency-Check)
                sh 'mvn dependency-check:check'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy your application (e.g., to a web server)
                sh 'scp target/your-app.war user@your-server:/path/to/deploy'
            }
        }
    }
    
    post {
        always {
            // Clean up
            sh 'mvn clean'
        }
    }
}
