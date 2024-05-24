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
                script {
                    try {
                        // Run Docker container with necessary options
                        def command = "docker run --rm -it --link astra-mongo:mongo astra-cli"
                        if (isUnix()) {
                            // Execute the command directly on Unix systems
                            sh command
                        } else {
                            // For Windows systems, wrap the command in a PowerShell script
                            bat "powershell -command \"& { $command }\""
                        }
                    } catch (Exception e) {
                        // Handle any exceptions
                        echo "Error running Docker container: ${e.getMessage()}"
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    }
}
