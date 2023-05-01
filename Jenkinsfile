pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Faulo-Dockerhub')
        DOCKER_REGISTRY_URL = 'docker.io'
        DOCKER_IMAGE_NAME = 'valheim'
        DOCKER_IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Build Docker image') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY_URL, DOCKERHUB_CREDENTIALS) {
                        def dockerImage = docker.build("${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", ".")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}