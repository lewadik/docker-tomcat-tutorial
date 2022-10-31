pipeline {
  agent none
  stages {
    stage('git') {
      agent any
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
        sh '''docker build -t mywebapp .
docker run -d -p 8085:8080 mywebapp'''
      }
    }

    stage('check') {
      agent {
        docker {
          image 'gradle:6.7-jdk11'
        }

      }
      steps {
        sh 'gradle --version'
      }
    }

  }
}