pipeline {
    agent any
    tools {
        git 'Default'
    }
    environment {
        GIT_REPO_URL = 'https://github.com/ManikandasamyS4/vulnerable.git'
        BRANCH = 'main'
        BURP_START_URL = 'https://ginandjuice.shop/' // Your target URL
        BURP_REPORT_FILE_PATH = 'C:/Users/Manikandasamy/Documents/zap-reports/Burp' // Path where the report will be saved
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
                        -e BURP_START_URL='https://ginandjuice.shop/' -e ^
                        -e BURP_REPORT_FILE_PATH='C:/Users/Manikandasamy/Documents/zap-reports/Burp' ^
                        -v C:/ProgramData/Jenkins/.jenkins/workspace/Dastardly-DAST:/app ^
                        public.ecr.aws/portswigger/dastardly:latest dastardly
                    """
                }
            }
        }
    }
    post {
        always {
            junit testResults: 'dastardly-report.xml', skipPublishingChecks: true
        }
    }
}
