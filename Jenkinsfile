
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
        sh 'ant -Dlibs.CopyLibs.classpath=./web/librerias/org-netbeans-modules-java-j2seproject-copylibstask.jar clean compile test dist'
      }
    }
	stage('Build docker image') {
		steps {
			sshagent (credentials: ['k3s-server']) {
				sh 'ssh -o StrictHostKeyChecking=no root@192.168.0.5 uname -a'
				sh 'docker --version'
			}
		}
	}	
  }
} 