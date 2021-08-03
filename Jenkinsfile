def IMAGE = "docs"
/* def BUILD_TAG = "0.1" */
def REPO = "kubera-docs"
def BRANCH_NAME = BRANCH_NAME.toLowerCase()


pipeline {
    agent {
        label {
            label ""
            customWorkspace "/var/jenkins/workspace/${REPO}-${BRANCH_NAME}"
        }
    }
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
              script {
                  if (env.BRANCH_NAME == 'staging') {
                     sh  "docker login -u indraindrajit71 -p $pass"
                     sh  "docker tag ${IMAGE}:${BUILD_NUMBER} indraindrajit71/${IMAGE}:${BRANCH_NAME}-${BUILD_NUMBER}"
                     sh  "docker push indraindrajit71/${IMAGE}:${BRANCH_NAME}-${BUILD_NUMBER}"
                  } else if (env.BRANCH_NAME == 'staging-new'){
                     sh  "docker login -u indraindrajit71 -p $pass"
                     sh  "docker tag ${IMAGE}:${BUILD_NUMBER} indraindrajit71/${IMAGE}:${BRANCH_NAME}-${BUILD_NUMBER}"
                     sh  "docker push indraindrajit71/${IMAGE}:${BRANCH_NAME}-${BUILD_NUMBER}"
                      }
                  }
              }

            }
        }

    }
