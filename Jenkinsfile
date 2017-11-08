pipeline {
    agent any
    tools { 
        maven 'mvn' 
        jdk 'jdk8' 
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }

        stage ('Build') {
            steps {
                dir ('initial') {
                    sh 'mvn -Dmaven.test.failure.ignore=true install'
                    sh 'mvn test'
                    sh 'mvn package'
                } 
            }
            stage('Deploy'){
                dir ('initial') {
                    sh 'java -jar target/gs-spring-boot-0.1.0.jar'
                }
            }
            post {
                success {
                    sh 'curl localhost:8090'
                }
            }
        }

    }
}