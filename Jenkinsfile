pipeline {
    agent any

    parameters {
        string(name: 'API_ENDPOINT', defaultValue: 'https://heritageplus-notification.azurewebsites.net/api/PushNotification', description: 'Enter the API endpoint URL')
    }

    stages {
        stage('Run Astra Tool') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    script {
                        // Ensure python is installed and available in the PATH environment variable
                        sh "python --version"
                        // Run the Astra tool directly
                        sh "python -c \"\$(curl -fsSL https://raw.githubusercontent.com/flipkart-incubator/Astra/master/astra.py)\" -u --api-endpoint ${params.API_ENDPOINT}"
                    }
                }
            }
        }
    }
}
