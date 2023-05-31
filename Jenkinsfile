pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
            }


        stage('Install Dependencies') {
            steps {
               
                sh 'pip install -r requirements.txt'
            }
        }

            stage('Build image') {

                steps {
                        sh "docker build -t Odoo-auguria/odoo:${shortCommit}  ."


                }
            }


            stage('Push image') {
                
                steps {
                        sh "docker push Odoo-auguria/odoo:${shortCommit} "


                }
            }

            stage('Clean image') {
                
                steps {
                        sh "docker rmi Odoo-auguria/odoo:${shortCommit} "

                }
            }
           
    }

