pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository with the specified branch
                sh 'git clone -b docker-cli https://github.com/flipkart-incubator/Astra.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Navigate to the cloned repository directory
                dir('Astra') {
                    // Build the Docker image
                    sh 'docker build -t astra-cli .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container with the specified options
                sh 'docker run --rm -it --link astra-mongo:mongo astra-cli python astra.py -u https://heritageplus-notification.azurewebsites.net/api/PushNotification'
            }
        }
    }
}
