pipeline {
  agent any
  stages {
    stage('git') {
      parallel {
        stage('git') {
          agent any
          steps {
            git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
            sh '''docker build -t mywebapp .
docker run -d -p 8085:8080 mywebapp'''
          }
        }

        stage('all') {
          steps {
            node(label: 'docker-slave') {
              sh 'echo "hello"'
            }

          }
        }

      }
    }

  }
}