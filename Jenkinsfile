pipeline {
    agent any

    environment {
        BUILD_DIR = "build"
        EXECUTABLE = "app"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Prem-krish-308/CPP-CI-Project.git'
            }
        }

        stage('Clean') {
            steps {
                bat 'rm -rf ${BUILD_DIR}'
                bat 'mkdir -p ${BUILD_DIR}'
            }
        }

        stage('Build') {
            steps {
                bat '''
                echo "Building project..."
                make clean || true
                make
                '''
            }
        }

        stage('Test') {
            steps {
                bat '''
                echo "Running tests..."
                chmod +x runtests.sh
                ./runtests.sh
                '''
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: '**/${EXECUTABLE}', fingerprint: true
            }
        }
    }

    post {
        success {
            echo '✅ Build & Tests Passed!'
        }
        failure {
            echo '❌ Build Failed!'
        }
        always {
            echo 'Pipeline finished.'
        }
    }
}

