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
                sshagent (credentials: ['GitHub_app_repo']) {
                    sh 'git config --global url."git@github.com:vanbur28/sample_application.git:".insteadOf "https://github.com/"'
                    sh 'git submodule update --init --recursive; sleep 10s'
                    sh 'cd /home/ubuntu/; app.py init'
                    echo 'Building'
                }
            }
        }
        stage('Application Dryrun') {
            steps {
                ansiColor('xterm') {
                    sh 'cd /home/ubuntu/; app.py plan'
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
}