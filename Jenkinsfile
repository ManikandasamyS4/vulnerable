pipeline {
    agent any
    stages {
        stage('Checkout SCM') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                          userRemoteConfigs: [[url: 'https://github.com/ManikandasamyS4/vulnerable.git']]])
            }
        }
        // Other stages...
    }
}
