pipeline {
  agent {
    node {
      label 'main'
    }

  }
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

    stage('clean') {
      agent any
      steps {
        sh 'curl http://sedr.xyz:8085/'
        sh 'docker rm $(docker stop $(docker ps -a -q --filter ancestor=mywebapp --format="{{.ID}}"))'
      }
    }
    stage ('Notify') {
      agent any
      steps {
        withCredentials([string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
        sh '''
        curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d text="Docker builded"
        '''
 }    
}
}
}
}