pipeline {
    
    agent any
    
    environment {
        DOCKER_REGISTRY = 'your-docker-registry.com' // Replace with your Docker registry
        DOCKER_IMAGE = "${DOCKER_REGISTRY}/my-django-app:${BUILD_NUMBER}"
        DOCKER_CONTAINER = "my-django-container-${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/viper-18/cv-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def customImage = docker.build(DOCKER_IMAGE, '.')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker stop ${DOCKER_CONTAINER} || true"
                    sh "docker rm ${DOCKER_CONTAINER} || true"
                    sh "docker run -d -p 8005:8000 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
