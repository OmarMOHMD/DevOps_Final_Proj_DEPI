pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('docker-hub-credits-id') // Your Docker Hub credentials
        
    }

    stages {
            stage('DockerHub Login') {
            steps {
                script {
                    sh '''
                        echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin
                    '''
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                    echo "Building Docker image..."
                    docker build -t omardevmedock/myapp .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                    docker push omardevmedock/myapp
                '''
            }
        }

        // stage('Deploy to Kubernetes') {
        //     steps {
        //                 echo "Deploying to Dev namespace..."
                        
        //                 sh 'kubectl apply -f testdeploy.yaml -n dev'
                        
        //         }
            
        // }
    }

    post {
        success {
            echo "Deployment to successful!"
        }
        failure {
            echo "Deployment to failed!"
        }
    }
}