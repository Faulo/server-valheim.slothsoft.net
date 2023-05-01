pipeline {
    agent {
		label  'docker'
    }
	
    environment {
		DOCKER_REGISTRY = 'https://registry.hub.docker.com'
		DOCKER_CREDENTIALS = 'Faulo-Dockerhub'
        DOCKER_IMAGE_AUTHOR = 'faulo'
        DOCKER_IMAGE_NAME = 'valheim'
        DOCKER_IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Build Docker image') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS) {
                        def dockerImage = docker.build("${DOCKER_IMAGE_AUTHOR}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", ".")
                        dockerImage.push()
                    }
                }
            }
        }
    }
}