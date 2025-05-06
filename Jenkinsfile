pipeline {
    agent any

    tools {
        terraform 'terraform'  // This name must match the one in Jenkins Global Tool Config
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')      // Add in Jenkins Credentials
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')  // Add in Jenkins Credentials
        AWS_DEFAULT_REGION = 'ap-south-1'                      // Change region if needed
        S3_BUCKET = 'your-s3-bucket-name'                      // Replace with your bucket
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/pratheesh-dev-tech/dev_final_web.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform -v'
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Deploy Static Website to S3') {
            steps {
                dir('static') { // Change this if your website files are in another folder
                    sh 'aws s3 sync . s3://$S3_BUCKET --delete'
                }
            }
        }
    }
}
