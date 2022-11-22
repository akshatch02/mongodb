properties([parameters([choice(choices: ['insert', 'update'], description: 'Choose the operation:', name: 'operation')])])
pipeline {
  agent any
  environment {
    DEV_USER = credentials('DEV_USER')
    OPERATION="${params.operation}.py"
  }
  stages {
    stage('version') {
      steps {
        sh 'python3 --version'
      }
    }
    stage('hello') {
      steps {
      echo "heyyyy ${params.operation}"
        sh '$OPERATION'
        sh 'python3 -m venv venv'
        sh 'source venv/bin/activate'
        sh 'pip3 install -r requirements.txt'
        sh 'python3 mongo-$OPERATION $DEV_USER_USR'
        sh 'rm -rf venv'
      }
    }
  }
}
