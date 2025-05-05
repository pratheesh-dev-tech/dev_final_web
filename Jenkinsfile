pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    tools {
        terraform 'terraform'  // Make sure this matches the name configured in Jenkins Global Tool Configuration
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/pratheesh-dev-tech/dev_final_web.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds', // Use your Jenkins AWS credentials ID
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Deploy Static Website to S3') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh '''
                        aws s3 sync ./static s3://goblinpk123 --delete
                        aws s3 website s3://goblinpk123/ --index-document index.html --error-document error.html
                    '''
                }
            }
        }
    }
}
