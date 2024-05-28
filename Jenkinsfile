pipeline {
    agent any
    
    stages {
        stage('Checkout SCM') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                    doGenerateSubmoduleConfigurations: false, extensions: [], 
                    userRemoteConfigs: [[url: 'https://github.com/ManikandasamyS4/vulnerable.git']]])
            }
        }
        stage('Docker Pull Dastardly from Burp Suite container image') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'sudo docker pull burpsuite/dastardly'
                    } else {
                        bat 'docker pull burpsuite/dastardly'
                    }
                }
            }
        }
        stage('Docker run Dastardly from Burp Suite Scan') {
            when {
                expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                script {
                    if (isUnix()) {
                        sh 'sudo docker run --rm -v $(pwd):/mnt burpsuite/dastardly /mnt'
                    } else {
                        bat 'docker run --rm -v %cd%:/mnt burpsuite/dastardly /mnt'
                    }
                }
            }
        }
    }
    
    post {
        always {
            junit '**/test-reports/*.xml'
        }
        cleanup {
            cleanWs()
        }
    }
}
