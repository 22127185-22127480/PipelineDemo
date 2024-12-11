pipeline {
	agent any
    tools {
        maven "maven3.8.7"
        jdk "java21"
    }
    environment {
        MAVEN_OPTS = "-Dmaven.repo.local=/home/gitlab-runner/m2/repository"
        DOCKER_REGISTRY = "22127480"
        DOCKER_REPOSITORY = "22127185-22127480"
        DOCKER_TAG = "${env.BUILD_ID}"
        CI_REGISTRY_USER = "22127185"
        CI_REGISTRY_PASSWORD: "B!f_4Rs2FNqUrW."
    }
    stages{
        stage('PULL CODE') {
             steps {
                git branch: 'main', url: 'https://github.com/22127185-22127480/PipelineDemo.git'
             }
        }
        stage('BUILD'){
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('TEST'){
            steps {
                sh 'mvn test'
            }
        }
        stages('DEPLOY') {
            stage('BUILD IMAGE') {
                steps {
                    sh 'docker build -f Dockerfile -t $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG .'
                    sh 'docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $DOCKER_REGISTRY'
                    sh 'docker push $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG'
                }
            }
        }
    }
}