pipeline {
  agent any
  stages {
    stage('git') {
      parallel {
        stage('git') {
          steps {
            git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
          }
        }

        stage('shell') {
          agent any
          steps {
            sh '''docker build -t mywebapp .
docker run -d -p 8085:8080 mywebapp'''
          }
        }

      }
    }

    stage('in') {
      agent {
        node {
          label 'docker-slave'
        }

      }
      steps {
        sh 'echo "hello World"'
      }
    }

  }
}