pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REPO = '399707826241.dkr.ecr.ap-south-1.amazonaws.com/webapplication'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    tools {
        maven 'maven 3.9.15'
    }

    stages {

        stage('Checkout Code') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/master']],
                    extensions: [],
                    userRemoteConfigs: [[
                        credentialsId: '0251c2a1-34c7-4564-875a-b6a9df876ea1',
                        url: 'https://github.com/armaan-devops4282/maven-web-application.git'
                    ]]
                )
            }
        }

        stage('Build Package') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('ECR Login') {
            steps {
                sh '''
                aws ecr get-login-password --region ap-south-1 | \
                docker login --username AWS --password-stdin 399707826241.dkr.ecr.ap-south-1.amazonaws.com
                '''
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t $ECR_REPO:$IMAGE_TAG .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $ECR_REPO:$IMAGE_TAG'
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh '''
                aws eks update-kubeconfig --region $AWS_REGION --name my-EKS-cluster

                sed -i "s|IMAGE_PLACEHOLDER|$ECR_REPO:$IMAGE_TAG|g" MavenWebApplication.yaml

                kubectl apply -f MavenWebApplication.yaml
                kubectl apply -f ingress.yaml
                kubectl apply -f HPA.yaml

                kubectl rollout status deployment/webpage-deployment -n production
                '''
            }
        }

    }
}
