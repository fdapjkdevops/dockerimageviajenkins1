pipeline {
  environment {
    imagename = 'fdapjkdevops/dockerimageviajenkins1'
    DOCKERHUB_CREDENTIALS=credentials('docker-cred-fedpjkdo')
    dockerImage = ''
  }
  agent any
  stages {
    stage('Run a test') {
      step {
        sh ("pwd")
        sh ("ls")
      }
    }
  }
}
