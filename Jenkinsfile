pipeline {
  agent any
  stages {
    stage('git') {
      agent any
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', credentialsId: 'newgh')
      }
    }

    stage('www') {
      steps {
        writeFile(file: 'tocuh', text: 'hello')
      }
    }

  }
}