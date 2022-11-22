properties([parameters([choice(choices: ['insert', 'update'], description: 'Choose the operation:', name: 'operation')])])
pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh 'python3 --version'
      }
    }
    stage('hello') {
      steps {
      echo "heyyyyyyyy ${params.operation}"
      OPERATION = "${params.operation}"
        sh 'python3 -m venv venv'
        sh 'source venv/bin/activate'
        sh 'pip3 install -r requirements.txt'
        sh 'python3 mongo-$OPERATION.py'
        sh 'rm -rf venv'
      }
    }
  }
}
