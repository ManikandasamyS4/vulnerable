pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Your build steps here
            }
        }
        stage('Astra Scan') {
            steps {
                script {
                    try {
                        // Adjust this command according to the actual Astra CLI syntax and requirements
                        bat 'astra scan --target https://heritageplus-notification.azurewebsites.net/api/PushNotification --output results.json'
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
                echo 'Deploying...'
                // Your deployment steps here
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            // Actions to perform after every build
        }
    }
}
