pipeline {
    options {
        timestamps()
        skipDefaultCheckout()
    }
     parameters {
        string(name: 'BUILD_VERSION', defaultValue: '', description: 'The build version to deploy (optional)')
    }
    agent {label 'worker1'}
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
                    def packageJSON = readJSON(file: 'package.json')
                    def artifactVersion = packageJSON.version
                    env.ARTIFACT_VERSION = artifactVersion
                    BUILD_VERSION_GENERATED = VersionNumber(
                        versionNumberString: 'v${BUILD_YEAR, XX}.${BUILD_MONTH, XX}${BUILD_DAY, XX}.${BUILDS_TODAY}',
                        projectStartDate:    '1970-01-01',
                        skipFailedBuilds:    true)
                    currentBuild.displayName = BUILD_VERSION_GENERATED
                    env.BUILD_VERSION = BUILD_VERSION_GENERATED
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