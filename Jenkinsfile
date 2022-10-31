pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
      }
    }

    stage('docker') {
      steps {
        dockerNode(image: 'tomcat:8.0-alpine')
      }
    }

  }
}