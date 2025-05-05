pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access')  // Jenkins credentials ID
    AWS_SECRET_ACCESS_KEY = credentials('aws-access')
  }

  stages {
    stage('Clone Repo') {
      steps {
        git 'https://github.com/your-username/your-repo.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Terraform Apply') {
      steps {
        sh 'terraform apply -auto-approve'
      }
    }

    stage('Deploy Static Website') {
      steps {
        sh './deploy.sh'
      }
    }
  }
}
