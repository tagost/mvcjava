pipeline {
  agent {docker {image 'cameronmcnz/ant-jdk8-git'}}
  stages {
    stage('Log Ant,Git and Java version info') {
      steps {
        sh 'ant -version'
        sh 'java -version'
        sh 'git --version'
      }
    }
    stage('GitHub Jenkins Ant Build') {
      steps {
        git 'https://github.com/tagost/mvcjava.git'
        sh 'ant clean compile test package war'
      }
    }
  }
}
