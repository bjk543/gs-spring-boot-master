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
            stage ('install') {
                steps {
                    dir ('initial') {
                        sh 'mvn -Dmaven.test.failure.ignore=true install'
                    } 
                }
            }
            stage ('test') {
                steps {
                    dir ('initial') {
                        sh 'mvn test'
                    } 
                }
            }
            stage ('verify') {
                steps {
                    dir ('initial') {
                        sh 'mvn verify'
                    } 
                }
            }
            stage ('package') {
                steps {
                    dir ('initial') {
                        sh 'mvn package'
                    } 
                }
            }
            stage('Deliver') { 
                steps {
                    dir ('initial/target') {
                        sh 'nohup java -jar *.jar &'
                        sh 'while ! httping -qc1 http://localhost:8090 ; do sleep 1 ; done'
                    }
                }
            }
        
    }
    
}