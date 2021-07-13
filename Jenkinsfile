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
        stage('Application Build') {
            steps {
                    sh 'docker-compose -f docker-compose.dev.yml up -d --build'
                }
            }
        stage('Application Dryrun') {
            steps {
                    echo 'Dryrun compleate'
                }
        }
        stage('Application Deploying') {
            when { expression { params.Action == 'apply' } }
            steps {
                    echo 'Deployment compleate'
                }
            }
    }
}