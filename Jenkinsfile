pipeline {
    agent { docker { image 'python:3.5.1' } }
    stages {
        stage('build') {

            steps {
                echo 'building the application'

            }
        }

        stage('test') {
            
            steps {
                echo 'testing the application'
            }
        }

        stage('deploy') {
            
            steps {
                echo 'depl the application'
            }
        }
    }
}