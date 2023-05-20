pipeline {
  environment {
    imagename = 'fdapjkdevops/dockerimageviajenkins1'
 //   DOCKERHUB_CREDENTIALS=credentials('docker-cred-fedpjkdo')
    dockerImage = ''
  }
  agent any
  stages {
    stage('Run a test') {
      steps {
        sh ("pwd")
        sh ("ls")
      }
    }
  }
}
