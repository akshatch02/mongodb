properties([parameters([choice(choices: ['insert', 'update'], description: 'Choose the operation:', name: 'operation'), choice(choices: ['DEV', 'PROD'], description: 'Choose the environment:', name: 'environment')])])
pipeline {
  agent any
  environment {
    DEV_USER = credentials("${params.environment}_USER")
    OPERATION="${params.operation}"
    ENVIRONMENT="${params.environment}"
  }
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
        sh "python3 mongo-${OPERATION}.py ${ENVIRONMENT} ${DEV_USER_USR}"
        sh 'rm -rf venv'
      }
    }
  }
}
