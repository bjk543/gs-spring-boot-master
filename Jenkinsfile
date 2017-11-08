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
            stage ('package') {
                steps {
                    dir ('initial') {
                        sh 'mvn package'
                    } 
                }
            }
            
            stage('Cleanup'){

            echo 'prune and cleanup'

            mail body: 'project build successful',
                        from: 'manny.shen@pentium.network',
                        replyTo: 'manny.shen@pentium.network',
                        subject: 'project build successful',
                        to: 'manny.shen@pentium.network'
            }
        
        
    }
    
}