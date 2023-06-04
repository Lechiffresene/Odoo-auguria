pipeline {
  agent any

  environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
                
            }


  stages {
    stage('Checkout') {
      steps {
        
        git(  url: 'git@github.com:Lechiffresene/Odoo-auguria.git', branch: 'production' ) 
        
      }
    }

    stage('Build Docker Image') {
      steps {
        
        sh 'docker build -t Lechiffresene/Odoo-auguria:${shortCommit} .'
      }
    }

    stage('Push Docker Image') {
      steps {
        
        sh 'docker push Lechiffresene/Odoo-auguria:${shortCommit} '
      }
    }

     stage('clean image') {
      steps {
        
        sh 'docker rmi -t Lechiffresene/Odoo-auguria:${shortCommit} .'
      }
    }
  }
}