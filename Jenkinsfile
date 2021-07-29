def Image = "docs"
def Build_tag = "0.1"

pipeline {
    agent any
      environment{
       pass = credentials('registry-pass')
   }

    stages {
        stage('Build') {
            steps {
                sh 'echo "Pushing"'
                    sh '''
                        docker login -u indraindrajit71 -p "$pass"
                        echo "taggingImages"
                        docker tag ${Image}:${Build_tag} indraindrajit71/${Image}:${Build_tag}
                        echo "PushingImages"
                        docker push indraindrajit71/${Image}:${Build_tag}
                        '''
            }
        }
        stage('Push') {
            steps {
		sh '''
		
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
