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
                sh 'rm -rf ${BUILD_DIR}'
                sh 'mkdir -p ${BUILD_DIR}'
            }
        }

        stage('Build') {
            steps {
                sh '''
                echo "Building project..."
                make clean || true
                make
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
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
