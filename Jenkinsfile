node('s1') {


    currentBuild.result = "SUCCESS"

    try {

       stage('Checkout'){
          checkout scm
          def mvnHome = tool 'mvn'
       }

       stage('Test'){
            dir ('initial') {
 sh "${mvnHome}/bin/mvn versions:set -DnewVersion=${env.BUILD_NUMBER}"
          sh '${mvnHome}/bin/mvn test'
}
         

       }

       stage('Build Docker'){
         sh '${mvnHome}/bin/mvn package'
       }

       stage('Deploy'){
         sh 'java -jar target/gs-spring-boot-0.1.0.jar'
       }

       stage('Cleanup'){

         echo 'prune and cleanup'
         sh 'curl localhost:8090'

         mail body: 'project build successful',
                     from: 'manny.shen@pentium.network',
                     replyTo: 'manny.shen@pentium.network',
                     subject: 'project build successful',
                     to: 'manny.shen@pentium.network'
       }



    }
    catch (err) {

        currentBuild.result = "FAILURE"

            mail body: "project build error is here: ${env.BUILD_URL}" ,
            from: 'manny.shen@pentium.network',
            replyTo: 'manny.shen@pentium.network',
            subject: 'project build failed',
            to: 'manny.shen@pentium.network'

        throw err
    }

}
