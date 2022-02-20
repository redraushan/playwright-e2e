/* groovylint-disable DuplicateStringLiteral */
pipeline {
    agent any
    environment {
        UNIQUE_BUILD_ID = "${GIT_COMMIT}".substring(0, 7)
    }
    stages {
        stage('Build') {
            when {
                changeset 'package.json'
            }
            steps {
                script {
                    sh 'make build'
                }
            }
        }

        // Build new image and push to docker hub with UNIQUE_BUILD_ID tag
        // and push image as UNIQUE_BUILD_ID
        stage('Push to registry') {
            when {
                changeset 'package.json'
            }
            steps {
                sh 'make  push'
            }
        }
        // When PR merged to master branch, tag built to UNIQUE_BUILD_ID and push image as latest
        stage('Push to registry as (latest)') {
            when {
                /* groovylint-disable-next-line DuplicateStringLiteral */
                changeset 'package.json'
                expression {
                    // main branch or master branch
                    return env.GIT_BRANCH == 'main'
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
                echo env.GIT_BRANCH
                cleanWs()
            }
        }
    }
}
