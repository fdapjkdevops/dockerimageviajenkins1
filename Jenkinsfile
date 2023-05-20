pipeline {
  environment {
    imagename    = 'fdapjkdevops/dockerimageviajenkins1'
    REPO_URL     = 'https://git@github.com/fdapjkdevops/dockerimageviajenkins1.git'
    GITHUB_CREDS = credentials('github-cred-fedpjkdo')
    DOCKER_CREDS = 'docker-cred-fedpjkdo'
    dockerImage  = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
   //     git([url: 'https://git@github.com/fdapjkdevops/dockerimageviajenkins1.git', branch: 'main', credentialsId: 'github-cred-fedpjkdo'])
   //     git([url: 'https://git@github.com/fdapjkdevops/dockerimageviajenkins1.git', branch: 'main', credentials: GITHUB_CREDS ] )
   //     git([url: REPO_URL, branch: 'main', credentials: GITHUB_CREDS ] )
   //     git([url: REPO_URL, branch: 'main', credentials: GITHUB_CREDS ] )
        git([url: 'https://git@github.com/fdapjkdevops/dockerimageviajenkins1.git', branch: 'main', credentialsId: 'github-cred-fedpjkdo'])
        
        sh ("ls -la")
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
//                 docker.withRegistry ('', 'docker-cred-fedpjkdo') {
                 docker.withRegistry ( '', DOCKER_CREDS ) {            
                       dockerImage.push('latest')
                 }
               
          }
       }
    }
/*
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
        sh "docker rmi $imagename:latest"

      }
    }
*/

  }
}

