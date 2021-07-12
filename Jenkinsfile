pipeline {
    options {
        timestamps()
        skipDefaultCheckout()
    }
    agent {label 'worker1'}
    parameters {
        choice(name: 'Action', choices: 'none\napply', description: 'Manual build stages')
    }
    triggers {
        pollSCM('H/5 * * * *')
    }
    stages {
        stage('Checkout script') {
            steps {
                cleanWs()
                checkout scm
                echo 'checkout compleate'
            }
        }
    }
        stage('Application Build') {
            steps {
                
                
                }
            }
        stage('Application Dryrun') {
            steps {
                ansiColor('xterm') {
                    sh 'docker ps'
                    echo 'Dryrun compleate'
                }
            }
        }
        stage('Application Deploying') {
            when { expression { params.Action == 'apply' } }
            steps {
                ansiColor('xterm') {
                    sh 'cd /home/ubuntu/; terraform1228 apply -auto-approve'
                    echo 'Deployment compleate'
                }
            }
        }
}