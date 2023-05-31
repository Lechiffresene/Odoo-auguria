pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
            }


    stages {

            stage('Checkout ') {
 
            steps {
                 git branch: 'production', url: 'https://github.com/Lechiffresene/Odoo-auguria.git'
            }
 
            }



            stage('Build image') {  

                steps {
                        

                         sh 'python odoo-bin -c odoo.conf -d auguria --addons-path=/mnt/extra-addons'


                }
            }


            stage('Push image') {
                
                steps {
                        sh "docker push Lechiffresene/odoo:${shortCommit} "


                }
            }

            stage('Clean image') {
                
                steps {
                        sh "docker rmi Lechiffresene/odoo:${shortCommit} "

                }
            }
           
    }

}