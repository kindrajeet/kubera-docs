pipeline {
    agent any
      environment{
       pass = credentials('registry-pass')
   }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh '''
		 ./jenkins/build/build.sh
		    '''
            }
        }
        stage('Push') {
            steps {
		sh '''
		./jenkins/push/push.sh
		   '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
