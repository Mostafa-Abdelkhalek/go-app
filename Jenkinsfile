pipeline {
    agent any
    stages{
        stage('build app'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub',userNameVariable:'USERNAME',passwordVariable: 'PASSWORD')])
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker build -t mostafaabdelkhalek8/go-app .
                docker push mostafaabdelkhalek8/go-app  
                """
            }
        }
    }
}