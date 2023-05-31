pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
                imageName = "odoo:${shortCommit}"
            }


    stages {

            stage('Checkout ') {
 
            steps {
                
                 git branch: 'production', url: 'https://github.com/Lechiffresene/Odoo-auguria.git'
           
            }

    }

            stage('Build Docker Image') {
            steps {
                // Build the Docker image with the short commit as the tag
                script {
                    docker.build(imageName)
                }
            }
        }
            stage('Push image') {
                
                steps {
                        sh "docker push (imageName) "


                }
            }

            stage('Clean image') {
                
                steps {
                        sh "docker rmi (imageName) "

                }
            }
           
}



}
