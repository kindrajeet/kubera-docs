def IMAGE = "docs"
def BUILD_TAG = "0.1"


pipeline {
    agent any
      environment{
       pass = credentials('registry-pass')
   }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		sh """
		 ./jenkins/build/build.sh
		    """
            }
        }
        stage('Push') {
            steps {
		sh """
		   docker login -u indraindrajit71 -p $pass
           	   docker tag ${IMAGE}:${BUILD_TAG} indraindrajit71/${IMAGE}:${BUILD_TAG}
           	   docker push indraindrajit71/${IMAGE}:${BUILD_TAG}
		   """
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
