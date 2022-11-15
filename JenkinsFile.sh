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
        # creates a venv folder that contains a copy of python3 packages to isolate any further changes in packages from the system installation
        sh 'python3 -m venv venv' 
         # tell the shell to use the created virtual environment
        sh 'source venv/bin/activate'
        # install requirements
        sh 'pip3 install -r requirements.txt'
        # run the script
        sh 'python3 mongo-insert.py'
        # remove the venv
        sh 'rm -rf venv'
        # deactivate the virtual environment
        sh 'deactivate'
      }
    }
  }
}
