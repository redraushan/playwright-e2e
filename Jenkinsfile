pipeline {
    agent any
     environment {
     	UNIQUE_BUILD_ID = "${GIT_COMMIT}".substring(0,7)
     }
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'make build'
                }
            }
        }
        
        // Build new image and push to docker hub with UNIQUE_BUILD_ID tag 
        // and push image as UNIQUE_BUILD_ID
        stage('Push to registry'){
             steps {
                 sh 'make  push'
             }
        }
        // When PR merged to master branch, tag built to UNIQUE_BUILD_ID and push image as latest
        stage('Push to registry as (latest)'){
            when {
                expression {
                    return env.GIT_BRANCH == 'master'
                }
            }
            steps {
                sh 'make publish'
            }
        }
    }
    post {
        always {
            script {
                echo 'Pipeline finished!'
                cleanWs()
            }
        }
    }
}
