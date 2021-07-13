pipeline {
    options {
        timestamps()
        skipDefaultCheckout()
    }
     parameters {
        string(name: 'BUILD_VERSION', defaultValue: '', description: 'The build version to deploy (optional)')
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
        stage('Build Version'){
            when { expression { return !params.BUILD_VERSION } }
            steps{
                script {
                    BUILD_VERSION_GENERATED = VersionNumber(
                        versionNumberString: 'v${BUILD_YEAR, XX}.${BUILD_MONTH, XX}${BUILD_DAY, XX}.${BUILDS_TODAY}',
                        projectStartDate:    '2021-06-01',
                        skipFailedBuilds:    true)
                    currentBuild.displayName = BUILD_VERSION_GENERATED
                    env.VERSION = BUILD_VERSION_GENERATED
                    env.BUILD = 'true'
                }
            }
        }
        stage('Application Build') {
            steps {
                    sh 'docker-compose -f docker-compose.dev.yml up -d --build'
                }
            }

        stage('Application Deployment') {
            when { expression { params.Action == 'apply' } }
            steps {
                    echo 'Deployment compleate'
                }
            }
    }
}