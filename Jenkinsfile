pipeline {

    agent any
    
    environment {
        DOCKER_IMAGE = "my-django-app:latest"
        DOCKER_CONTAINER = "my-django-container"
    }
    
    stages {
        stage('Checkout') {
            steps {
                sh 'git pull https://github.com/viper-18/resume-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                    // def customImage = docker.build(DOCKER_IMAGE, '.')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker stop ${DOCKER_CONTAINER} || true"
                    sh "docker rm ${DOCKER_CONTAINER} || true"
                    sh "docker run -itd -p 8000:8000 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
