pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', poll: true)
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