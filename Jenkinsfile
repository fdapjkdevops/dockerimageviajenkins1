pipeline {
  environment {
// Changed some of thes
// FranklinDavis1006 is the github user
// pjkatfda is the dockerhub user
    imagename = 'pjkatfda/dockerimageviajenkins'
    DOCKERHUB_CREDENTIALS=credentials('dockerhub-cred-fedpj')
    dockerImage = ''
  }
  agent any
  stages {
	  
    stage('Cloning Git') {
      steps {
        //git branch: '*/*', credentialsId: 'TokenForFranklinDavis1006GitHub', url: 'https://github.com/FranklinDavis1006/dockerimageviajenkins.git'   
 	git([url: 'https://git@github.com/franklindavis1006/dockerimageviajenkins.git', branch: 'main', credentialsId: 'TokenForFranklinDavis1006GitHub'])
      }
    }
    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
	  sh("docker tag " + imagename + ":latest " + imagename + ":$BUILD_NUMBER")
	  sh("docker image ls")
        }
      }
    }
    stage('Push to dockerHub') {
       steps{
          script {
		 docker.withRegistry ('', 'dockerhub-cred-fedpj') { 
		       dockerImage.push('latest')
	       }
	  }     
       }
    }		  
    
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
 
      }
    }
    
  }
}
