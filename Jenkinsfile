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
      agent {
        node {
          label 'docker-slave'
        }

      }
      steps {
        node(label: 'docker-slave') {
          sh 'curl http://sedr.xyz:8085/'
        }

      }
    }

  }
}