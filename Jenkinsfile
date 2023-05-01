pipeline {
    agent {
		label 'docker'
    }
	
    environment {
		DOCKER_REGISTRY = 'https://registry.hub.docker.com'
		DOCKER_CREDENTIALS = 'Faulo-Dockerhub'
        DOCKER_IMAGE_AUTHOR = 'faulo'
        DOCKER_IMAGE_NAME = 'valheim'
        DOCKER_IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Sign in to Docker Hub') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS) {
						stage('Build Docker image') {
						  def dockerImage = docker.build("${DOCKER_IMAGE_AUTHOR}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", ".")
						  stage('Push Docker image') {
							dockerImage.push()
						  }
						}
                    }
                }
            }
        }
    }
}