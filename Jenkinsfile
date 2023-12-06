pipeline {
  agent any
  stages {
    stage('git') {
      agent any
      steps {
        git(url: 'https://github.com/lewadik/docker-tomcat-tutorial.git', credentialsId: 'newgh')
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