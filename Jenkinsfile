pipeline {
    agent any
    tools {
        maven "maven3.9.9"
        jdk "java-17"
    }
    environment {
        DOCKER_REGISTRY = "22127480"
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
                // Docker build and push
                sh '''
                    sudo docker build -f Dockerfile -t $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG .
                    sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $DOCKER_REGISTRY
                    sudo docker push $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG
                '''

                // Docker pull and run
                sh '''
                    sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $DOCKER_REGISTRY
                    sudo docker pull $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG
                    sudo docker run -d -p 80:80 $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG
                '''
            }
        }
    }
}
