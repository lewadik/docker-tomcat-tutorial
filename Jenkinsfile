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
          steps {
            sh '''docker build -t mywebapp .
docker run -d -p 8085:8080 mywebapp'''
            dockerNode(image: 'jenkins/agent')
          }
        }

      }
    }

  }
}