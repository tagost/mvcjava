pipeline {
  agent any
  tools {
      ant 'ant'
  }
  stages {
    stage('Log Ant version info') {
      steps {
        sh 'ant -version'
      }
    }
    stage('GitHub Jenkins Ant Build') {
      steps {
        echo 'hola'
        //git 'https://github.com/tagost/mvcjava.git'
        sh 'ant clean compile test'
      }
    }
  }
}
