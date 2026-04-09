pipeline {
    agent any

    environment {
        GOOGLE_CREDS = credentials('gcp-sa-json')
        TF_IN_AUTOMATION = 'true'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh '''
                    export GOOGLE_APPLICATION_CREDENTIALS="$GOOGLE_CREDS"
                    terraform init -input=false
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    export GOOGLE_APPLICATION_CREDENTIALS="$GOOGLE_CREDS"
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    export GOOGLE_APPLICATION_CREDENTIALS="$GOOGLE_CREDS"
                    terraform plan -input=false -out=tfplan -var-file="terraform.tfvars"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Запустити Terraform Apply?'
                sh '''
                    export GOOGLE_APPLICATION_CREDENTIALS="$GOOGLE_CREDS"
                    terraform apply -input=false -auto-approve tfplan
                '''
            }
        }

        stage('Show Outputs') {
            steps {
                sh '''
                    export GOOGLE_APPLICATION_CREDENTIALS="$GOOGLE_CREDS"
                    terraform output
                '''
            }
        }
    }
}
