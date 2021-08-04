def IMAGE = "indraindrajit71/docs"
def REPO = "kubera-docs"
def BRANCH_NAME = BRANCH_NAME.toLowerCase()
def GIT_SHA = "sh(git log -n 1 --pretty='%h')"


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
                  /* GIT_SHA = sh(
                      returnsStdout: true,
                      script: "git log -n 1 --pretty=format:'%h'"
                  ) */
                  if (env.BRANCH_NAME == 'staging') {
                     sh  "docker login -u indraindrajit71 -p $pass"
                     /* sh  "docker tag ${IMAGE}:${BUILD_NUMBER} indraindrajit71/${IMAGE}:${BRANCH_NAME}-${BUILD_NUMBER}" */
                     sh  "docker push ${IMAGE}:${BRANCH_NAME}-${GIT_SHA}"
                  } else if (env.BRANCH_NAME == 'staging-new'){
                     sh  "docker login -u indraindrajit71 -p $pass"
                     /* sh  "docker tag ${IMAGE}:${BUILD_NUMBER} indraindrajit71/${IMAGE}:${BRANCH_NAME}-${BUILD_NUMBER}" */
                     sh  "docker push ${IMAGE}:${BRANCH_NAME}-${GIT_SHA}"
                      }
                  }
              }

            }
        }

    }
