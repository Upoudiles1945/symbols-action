pipeline {
    agent { dockerfile true }
    stages {
        stage('Checking') {
            steps {
                sh '''
                node --version
                git version
                '''
               // sh 'svn --version'
            }
        }
        stage('Prepare inspect') {
            steps {
                sh 
                '''
                sh multiple
                '''
            }
        }
        stage('Inspect') {
            steps {
                sh 
                '''
                // sh multiple
                ./inspect //for example
                '''
            }
        }
    }
}