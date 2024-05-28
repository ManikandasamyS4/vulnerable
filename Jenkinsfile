pipeline {
    agent any
    tools {
        git 'Default'
    }
    environment {
        GIT_REPO_URL = 'https://github.com/ManikandasamyS4/vulnerable.git'
        BRANCH = 'main'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: "*/${BRANCH}"]], 
                          userRemoteConfigs: [[url: "${GIT_REPO_URL}"]]])
            }
        }
        stage('Docker Pull Dastardly from Burp Suite container image') {
            steps {
                script {
                    bat 'docker pull public.ecr.aws/portswigger/dastardly:latest'
                }
            }
        }
        stage('Docker run Dastardly from Burp Suite Scan') {
            steps {
                script {
                    bat """
                        docker run --rm ^
                        -v %cd%:/app ^
                        public.ecr.aws/portswigger/dastardly:latest ^
                        dastardly --url https://ginandjuice.shop/
                    """
                }
            }
        }
    }
    post {
        always {
            junit '**/target/surefire-reports/*.xml'
        }
    }
}
