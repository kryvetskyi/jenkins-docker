pipeline {
    agent any
    
    environment {
        USER = 'jenkins'
    }
    
    stages {
        
        stage('Docker version') {
            steps {
                sh 'echo ${USER}'
                sh 'docker --version'
            }
        }
        
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/kryvetskyi/jenkins-docker'
            
            sh 'pwd'
            sh 'ls -la'
            }
        }

        stage('Build docker image') {
            steps {
                sh 'docker build -t anatollucky/test-jenkins:server3.0 .'
            }
        }

        stage('Push image to Dockerhub') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub-cred-anatollucky', url: 'https://index.docker.io/v1/') {
                    sh 'docker push anatollucky/test-jenkins:server3.0'
                }
            }
        }

        stage('Delete docker image locally') {
            steps {
            sh 'docker rmi anatollucky/test-jenkins:server3.0'
            }
        }
        
    }
}