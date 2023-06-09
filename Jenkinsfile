pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
    registry = '981162472741.dkr.ecr.us-east-1.amazonaws.com/devops-terraform'
    registryCredential = 'aws-credentials'
    dockerimage = ''
  }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/CHOUPAGUY/hello-word-2023.git'
            }
        }
        stage('Sonarqube scan') {
            steps{
            withSonarQubeEnv('sonar') {
          sh ''
            }
            }
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean install package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
        stage('Deploy image') {
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}
