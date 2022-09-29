pipeline {
    agent any

    stages {

        stage('Checkout source') {
            steps {
                git url: 'https://github.com/matwolbec/terraform-on-jenkins.git', branch 'main'
            }
        }

        stage('Terraform Apply') {
            steps {
                environment {
                    resource_group_name = credentials('resource_group_name')
                    storage_account_name = credentials('storage_account_name')
                    container_name = credentials('container_name')
                    key = credentials('key')
                }
                script {
                    sh 'terraform init --backend-config "resource_group_name=${resource_group_name}" --backend-config "storage_account_name=${storage_account_name}" --backend-config "container_name=${container_name}" --backend-config "key=${key}"'
                }
            }
        }

    }
}