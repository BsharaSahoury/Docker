pipeline {
  agent { node { label 'slavedocker01' } }

   stages {
      stage('Clone Sources') {
        steps {	  
          checkout scm
        } 
      }
	  stage('Checking environment') {
         steps {
            sh 'printenv'
         }
      }
      
   }
}
