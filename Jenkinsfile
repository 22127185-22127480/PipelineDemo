pipeline {
    agent any
    tools {
        maven "maven3.8.7"
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
                git branch: 'dev', url: 'https://github.com/22127185-22127480/PipelineDemo.git'
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
                # Build the Docker image
                sh '''
                docker build -f Dockerfile -t $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG .
                '''
                
                # Stop and remove the existing container (if any)
                sh '''
                docker stop my-container || true
                docker rm my-container || true
                '''
                
                # Remove unused containers to free up resources
                sh '''
                docker container prune -f
                '''
                
                # Run the new container
                sh '''
                docker run --name my-container -d -p 80:80 $DOCKER_REGISTRY/$DOCKER_REPOSITORY:$DOCKER_TAG
                '''
            }
        }
    }
}
