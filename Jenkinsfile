pipeline {
  agent {
    node {
      label 'docker-slave'
    }

  }
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
docker run -d -p 8085:8080 mywebapp
curl http://0.0.0.0:8085/
docker rm $(docker stop $(docker ps -a -q --filter ancestor=mywebapp --format="{{.ID}}"))'''
          }
        }

      }
    }

  }
}