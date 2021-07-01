node{
    stage('SCM Checkout'){
        git branch: 'main', credentialsId: 'a0d780c5-889b-4b6c-9976-6bd39a33dbc4', url: 'https://github.com/vanbur28/sample_application.git'
    }
    stage('Mvn Package'){
        def mvnHome = tool name: 'maven-1', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
    
}