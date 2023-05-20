pipeline {
  environment {
    imagename = 'fdapjkdevops/dockerimageviajenkins1'
    DOCKERHUB_CREDENTIALS=credentials('docker-cred-fedpjkdo')
    dockerImage = ''
  }
  agent any
  stages {
	  
      stage('run check') {
          steps{
              script {
	          sh("pwd")
	          sh("ls -la")		
              }
          }
      }
     
  }
}
