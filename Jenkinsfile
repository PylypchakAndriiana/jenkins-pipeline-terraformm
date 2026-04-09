pipeline {
    agent any
    environment {
        GOOGLE_CREDS = credentials('Terraform-project')
    }
    stages {
        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                bat 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve'
            }
        }
    }
}
