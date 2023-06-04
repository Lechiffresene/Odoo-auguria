pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        // Vérifiez le code à partir de votre référentiel GitHub
        git 'git@github.com:Lechiffresene/Odoo-auguria.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        // Construisez l'image Docker en utilisant le Dockerfile
        sh 'docker build -t odoo:16 .'
      }
    }

    stage('Push Docker Image') {
      steps {
        // Poussez l'image Docker vers un registre Docker si nécessaire
        sh 'docker push odoo:16'
      }
    }

     stage('clean image') {
      steps {
        
        sh 'docker rmi -t odoo:16 .'
      }
    }
  }
}