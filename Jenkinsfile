pipeline {
  agent none
  stages {
    stage('git') {
      agent {
        node {
          label 'main'
        }

      }
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
        sh '''docker build -t mywebapp .
docker run -d -p 8085:8080 mywebapp'''
      }
    }

    stage('ffffff') {
      steps {
        node(label: 'docker-slave') {
          sh 'echo "123"'
        }

      }
    }

  }
}