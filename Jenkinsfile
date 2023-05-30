pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
            }


    stages {

            stage('Create  addons directories ') {
 
            steps {
                sh "mkdir -p partner_firstname  "
            }
 
            }

            stage('Add modules addons') {

                steps {
                    script {
                        dir('partner_firstname') {
                            sh "rm -rf ./*"
                            git(  url: 'git@github.com:Lechiffresene/Odoo-auguria.git', branch: '16.0' ) 
                            sh " cp -r ./odoo/addons/*  ../partner_firstname   "
                            sh " ls -lh ../partner_firstname"
                        }
                    }
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

}