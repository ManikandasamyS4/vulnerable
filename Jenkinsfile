pipeline {
    agent any

    parameters {
        string(name: 'API_ENDPOINT', defaultValue: 'https://heritageplus-notification.azurewebsites.net/api/PushNotification', description: 'Enter the API endpoint URL')
    }

    stages {
        stage('Clone Astra Repository') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    git 'https://github.com/flipkart-incubator/Astra.git'
                }
            }
        }

        stage('Run Astra Tool') {
            steps {
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh "cd Astra && python astra.py -u --api-endpoint ${params.API_ENDPOINT}"
                }
            }
        }
    }
}
