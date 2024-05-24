pipeline {
    agent any

    parameters {
        string(name: 'API_ENDPOINT', defaultValue: 'https://heritageplus-notification.azurewebsites.net/api/PushNotification', description: 'Enter the API endpoint URL')
    }

    stages {
        stage('Clone Astra Repository') {
            steps {
                git 'https://github.com/flipkart-incubator/Astra.git'
            }
        }

        stage('Run Astra Tool') {
            steps {
                sh "cd Astra && python astra.py -u --api-endpoint ${params.API_ENDPOINT}"
            }
        }
    }
}
