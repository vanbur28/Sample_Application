pipeline {
    options {
        timestamps()
        skipDefaultCheckout()
    }
    agent {label 'ss-terraform-slave'}
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
            }
        }
        stage('terraform Initiation') {
            steps {
                sshagent (credentials: ['4a1fdd2c-75ee-4c98-8af8-6d8fe081b8ac']) {
                    sh 'git config --global url."git@github.com:".insteadOf "https://github.com/"'
                    sh 'git submodule update --init --recursive; sleep 10s'
                    sh 'cd aws/; terraform1228 init'
                }
            }
        }
        stage('terraform dryrun') {
            steps {
                ansiColor('xterm') {
                    sh 'cd aws/; terraform1228 plan'
                }
            }
        }
        stage('terraform applying') {
            when { expression { params.Action == 'apply' } }
            steps {
                ansiColor('xterm') {
                    sh 'cd aws/; terraform1228 apply -auto-approve'
                }
            }
        }
    }
}