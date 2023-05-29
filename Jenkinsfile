pipeline {

    agent any 

    environment {

                def shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
                def author = sh(returnStdout: true, script: "git show -s --pretty=%an").trim()  
            }


    stages {

            stage('Create  addons directories ') {
 
            steps {
                sh "mkdir -p partner_firstname "
            }
 
            }

            stage('Add module addons') {

                steps {
                    script {
                        dir('partner_firstname') {
                            sh "rm -rf ./*"
                            git(  url: 'git@github.com:Lechiffresene/partner_firstname.git', production: '16.0' ) 
                            sh " cp -r ./odoo/addons/*  ../partner_firstname   "
                            sh " ls -lh ../partner_firstname"
                        }
                    }
                }
            
            }

            stage('Build image') {

                steps {
                        sh "docker build -t auguria/erp:${shortCommit}  ."


                }
            }


            stage('Push image') {
                
                steps {
                        sh "docker push auguria/erpi:${shortCommit} "


                }
            }

            stage('Clean image') {
                
                steps {
                        sh "docker rmi auguria/erp:${shortCommit} "

                }
            }
           
    }

}
