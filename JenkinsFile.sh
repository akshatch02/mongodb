pipeline {
  agent any
  properties([parameters([choice(choices: ['Insert\nUpdate'], description: 'Choose the operation:', name: 'operation')])])
  stages {
    stage('version') {
      steps {
        sh 'python3 --version'
      }
    }
    stage('hello') {
      steps {
        sh 'python3 -m venv venv'
        sh 'source venv/bin/activate'
        sh 'pip3 install -r requirements.txt'
        sh 'python3 mongo-insert.py'
        sh 'rm -rf venv'
      }
    }
  }
}
