pipeline {
  agent { label 'docker-agent' }
  stages {
    stage('build') {
      steps {
        sh 'docker rmi -f maven || true'
        sh 'docker rm -f maven-container || true'
        sh 'docker build -t maven .'
      }
    }
    stage('run') {
      steps {
        sh 'docker run -d -p 8085:8085 --name maven-container maven'
      }
    }
  }
}
