pipeline {
    agent any

    tools {
        // Optional if configured
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Prem-krish-308/CPP-CI-Project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'make build'
            }
        }

        stage('Test') {
            steps {
                sh './runtests.sh'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'build/*', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ CI Passed'
        }
        failure {
            echo '❌ CI Failed'
        }
    }
}
