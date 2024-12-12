pipeline {
    agent any
    tools {
        maven "maven3.9.6"
        jdk "java-17"
    }
    environment {
        DOCKER_REGISTRY = "22127185"
        DOCKER_REPOSITORY = "22127185-22127480"
        DOCKER_TAG = "${env.BUILD_ID}"
        CI_REGISTRY_USER = "22127185"
        CI_REGISTRY_PASSWORD = "B!f_4Rs2FNqUrW."
    }
    stages {
        stage('PULL CODE') {
            steps {
                git branch: 'main', url: 'https://github.com/22127185-22127480/PipelineDemo.git'
            }
        }
        stage('BUILD') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('TEST') {
            steps {
                sh 'mvn test'
            }
        }
        stage('DEPLOY') {
            steps {
                // Docker build
                sh 'docker build -f Dockerfile -t $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG .'

                // Docker remove exist stopped container and run new container
                sh 'docker stop my-container || true'
                sh 'echo y | docker container prune '
                sh 'docker run --name my-container -d -p 80:80 $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG'
            }
        }
    }
}
