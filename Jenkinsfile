pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Build steps (e.g., compiling code, running unit tests)
            }
        }
        stage('Astra Scan') {
            steps {
                script {
                    try {
                        sh 'astra scan --target https://heritageplus-notification.azurewebsites.net/api/PushNotification --output results.json'
                        archiveArtifacts artifacts: 'results.json', allowEmptyArchive: true
                        // Optional: Add logic to parse results and fail the build if critical issues are found
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps
            }
        }
    }
    post {
        always {
            // Actions to perform after every build, such as sending notifications or archiving artifacts
        }
    }
}
