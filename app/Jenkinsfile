pipeline {
    agent any
    stages {
        stage('Build and Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    script {
                        // Log in to Docker Hub
                        sh "docker login -u ${USERNAME} -p ${PASSWORD}"

                        // Build and push the Docker image
                        sh "docker build -t mostafaabdelkhalek8/go-app ."
                        sh "docker push mostafaabdelkhalek8/go-app"
                    }
                }
            }
        }
    }
}
