pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
                
            }


  stages {
    stage('Checkout') {
      steps {
        
        git(  url: 'git@github.com:AG-FrancoisP/odoo-16.git', branch: '16.0' ) 
        
      }
    }
x
    stage('Build Docker Image') {
      steps {
        
        sh 'docker build -t AG-FrancoisP/odoo-16:${shortCommit} .'
      }
    }

    stage('Push Docker Image') {
      steps {
        
        sh 'docker push AG-FrancoisP/odoo-16:${shortCommit} '
      }
    }

     stage('clean image') {
      steps {
        
        sh 'docker rmi -t AG-FrancoisP/odoo-16:${shortCommit} .'
      }
    }
  }
}