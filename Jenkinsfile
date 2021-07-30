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
           	   docker tag ${env.Image}:${env.Build_tag} indraindrajit71/${env.Image}:${env.Build_tag}
           	   docker push indraindrajit71/${env.Image}:${env.Build_tag}
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
