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

	  
	   
	stage('Build a docker image') {
         steps {
            echo 'Build process..'            
            sh '''
		docker build -t="alpcon:${BUILD_NUMBER}" .
            '''
         }
      }	   

	stage('Push a docker image') {
         steps {
			sh '''
				docker tag alpcon:${BUILD_NUMBER} ${REPO_NAME}/alpcon:${BUILD_NUMBER}
				docker push ${REPO_NAME}/alpcon:${BUILD_NUMBER}
			'''
         }
      }
	   
	
	stage('Deploy the website') {
         steps {
            echo 'Deploy process..'
			sh '''
				echo "Stopping running containers"
				CONTAINER=`docker ps -q`
				if [ -z "$CONTAINER" ]; then
					echo "No running containers. Nothing to stop"
				else									
					docker stop ${CONTAINER}
					docker rm ${CONTAINER}
				fi
				echo "Running a new container"
				docker run -d -v ${HOME}/Documents/volume_proj:/home/Docker-proj/volume ${REPO_NAME}/alpcon:${BUILD_NUMBER}
				echo "Finished"
			'''
         }
      }   
	   
	   
	   
      
   }
}
