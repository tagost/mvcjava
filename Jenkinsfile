
pipeline {
  agent any
  tools {
      ant 'ant'
  }
  node {
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
	stage('Show docker version') {
		steps {
			sshagent (credentials: ['k3s-server']) {
				sh 'ssh -o StrictHostKeyChecking=no root@192.168.0.5 uname -a'
				sh 'docker --version'
			}
		}
	}
	stage('Build docker image') {
		steps {
			withCredentials([sshUserPrivateKey(credentialsId: 'k3s-server', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
				
				remote.user = userName
				remote.identityFile = identity
				stage("SSH Steps Rocks!") {
					writeFile file: 'abc.sh', text: 'ls'
					sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
					sshPut remote: remote, from: 'abc.sh', into: '.'
					sshGet remote: remote, from: 'abc.sh', into: 'bac.sh', override: true
					sshScript remote: remote, script: 'abc.sh'
					sshRemove remote: remote, path: 'abc.sh'
				}
			}
		}
	}
  }
} 