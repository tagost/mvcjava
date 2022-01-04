pipeline {
    agent any 
	tools {
			ant 'ant' 
	}
    stages {
        // stage('Log Ant version Info') { 
            // steps {
				// sh 'ant -version'
            // }
        // }
        stage('GitHub Jenkins Ant Build') { 
            steps {
				echo 'hola'
				//git 'https://github.com/tagost/mvcjava.git'
				sh 'ant -Dlibs.CopyLibs.classpath=./web/librerias/org-netbeans-modules-java-j2seproject-copylibstask.jar clean compile test dist'
            }
        }
        // stage('Log Docker Version') { 
            // steps {
				// sshagent (credentials: ['k3s-server']) {
					// sh 'ssh -o StrictHostKeyChecking=no root@192.168.0.5 uname -a'
					// sh 'docker --version'
				// }
            // }
        // }
    }
}

def remote = [:]
remote.name = "k3s"
remote.host = "192.168.0.5"
remote.allowAnyHosts = true
node {
	withCredentials([sshUserPrivateKey(credentialsId: 'k3s-server', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
		remote.user = userName
		remote.identityFile = identity
		stage('Build docker image') {
			sshCommand remote: remote, command: 'mkdir -p mvcjava'
			sshPut remote: remote, from: 'dist/', into: 'mvcjava', override: true
			sshCommand remote: remote, command: 'cd mvcjava && docker build -t tagost/mvcjava .'
		}
		/*stage ('Docker push'){
			sshCommand remote: remote, command: 'docker push tagost/mvcjava'
		}*/
		stage ('Deploy aplication'){
			sshCommand remote: remote, command: 'docker rm -fv mvcjava'
			sshCommand remote: remote, command: 'cd mvcjava && docker-compose up -d'
		}
	}
}
