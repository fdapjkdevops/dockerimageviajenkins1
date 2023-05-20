pipeline {
  environment {
    imagename = 'fdapjkdevops/dockerimageviajenkins1'
    DOCKERHUB_CREDENTIALS=credentials('docker-cred-fedpjkdo')
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
    stage('Cloning Git') {
      steps {
        git([url: 'https://git@github.com/fdapjkdevops/dockerimageviajenkins1.git', branch: 'main', credentialsId: 'github-cred-fedpjkdo'])
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
                 docker.withRegistry ('', 'docker-cred-fedpjkdo') {
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
