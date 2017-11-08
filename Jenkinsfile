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
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }

    }
}