pipeline {
    options {
        timestamps()
        skipDefaultCheckout()
    }

    //Declares where the file will run, in this case node called worker1
    agent any
    //re-runs file every 5 minutes
    triggers {
        pollSCM('H/5 * * * *')
    }

     parameters {
        string(name: 'BUILD_VERSION', defaultValue: '', description: '')
    }

    stages {
        stage('Build Version'){
            when { expression { BUILD_VERSION == '' } }
            steps{
                script {
                    BUILD_VERSION_GENERATED = VersionNumber(
                        versionNumberString: 'v${BUILD_YEAR, XX}.${BUILD_MONTH, XX}${BUILD_DAY, XX}.${BUILDS_TODAY}',
                        projectStartDate:    '1970-01-01',
                        skipFailedBuilds:    true)
                    currentBuild.displayName = BUILD_VERSION_GENERATED
                    env.BUILD_VERSION = BUILD_VERSION_GENERATED
                    env.BUILD = 'true'
                }
            }
        }
        stage('Checkout script') {
            steps {
                cleanWs()
                checkout scm
                echo 'checkout complete'
            }
        }
        stage('Application Build') {
            steps {
                    withEnv([
                        "IMAGE_NAME=vanburen_app",
                        "BUILD_VERSION=" + (params.BUILD_VERSION ?: env.VERSION)
                    ]) {
                        cleanWs()
                        checkout scm
                        script {
                            // See: https://jenkins.io/doc/book/pipeline/docker/#building-containers
                            //docker.build("${env.IMAGE_NAME}", "--no-cache --build-arg SOURCE_FOLDER=./${env.BUILD_VERSION} .")
                            //docker.withRegistry('https://063208468694.dkr.ecr.us-west-1.amazonaws.com', 'ecr:us-west-1:0cdb4404-ed40-459b-8589-7f1f235747ba'){
                                //docker.image("${env.IMAGE_NAME}").push("${BUILD_VERSION}")
                            //}
                            sh 'docker build -t vanburen_app .'

                    }
                }
            }
        }
        stage('Deploy to node') {
            agent {
                label 'worker1'
            }
            steps {
                withDockerRegistry([url: "https://063208468694.dkr.ecr.us-west-1.amazonaws.com/vanburen_app",credentialsId: "ecr:us-west-1:0cdb4404-ed40-459b-8589-7f1f235747ba"]) {
                script {
                        sh 'docker push 063208468694.dkr.ecr.us-west-1.amazonaws.com/vanburen_app:$BUILD_VERSION'
                        sh 'docker stop vanburen_app'
                        sh 'docker rm vanburen_app'
                        sh 'docker run -d -p 127.0.0.1:5000:80 vanburen_container 063208468694.dkr.ecr.us-west-1.amazonaws.com/vanburen_app:$BUILD_VERSION'
                        }
                    }
                }
        }

    }
}
