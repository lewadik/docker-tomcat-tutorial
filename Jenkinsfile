pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
      }
    }

    stage('clean') {
      agent any
      steps {
        sh 'docker rm $(docker stop $(docker ps -a -q --filter ancestor=mywebapp --format="{{.ID}}"))'
      }
    }

    stage('Notify') {
      agent any
      steps {
        withCredentials(bindings: [string(credentialsId: 'telegramToken', variable: 'TOKEN'), string(credentialsId: 'telegramChatId', variable: 'CHAT_ID')]) {
          sh '''
        curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d text="Docker builded"
        '''
        }

      }
    }

  }
}