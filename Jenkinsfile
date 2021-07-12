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
        stage('Application Build') {
            steps {
                sshagent (credentials: ['4a1fdd2c-75ee-4c98-8af8-6d8fe081b8ac']) {
                    sh 'git config --global url."git@github.com:".insteadOf "https://github.com/"'
                    sh 'git submodule update --init --recursive; sleep 10s'
                    sh 'cd aws/; terraform1228 init'
                }
            }
        }
        stage('Application Dryrun') {
            steps {
                ansiColor('xterm') {
                    sh 'cd aws/; terraform1228 plan'
                }
            }
        }
        stage('Application Deploying') {
            when { expression { params.Action == 'apply' } }
            steps {
                ansiColor('xterm') {
                    sh 'cd aws/; terraform1228 apply -auto-approve'
                }
            }
        }
    }
}