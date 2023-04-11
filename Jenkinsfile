pipeline {
    agent {
        kubernetes {
            defaultContainer 'worker'
            yaml """
kind: Pod
metadata:
  name: worker
spec:
  containers:
  - name: worker
    image: 587219698707.dkr.ecr.us-east-1.amazonaws.com/jenkins_agent:1.2.0
    imagePullPolicy: "IfNotPresent"
    command:
    - cat
    tty: true
    volumeMounts:
      - name: dockersock
        mountPath: "/var/run/docker.sock"
  restartPolicy: Never
  volumes:
      - name: dockersock
        hostPath:
          path: "/var/run/docker.sock"
"""
        }
    }
    environment {
//         DOCKER_ACCOUNT_ID="bharathpantala"
//         IMAGE_REPO_NAME="app-info"
//         IMAGE_TAG="v2021.10"
//         REPOSITORY_URI = "docker.io/${DOCKER_ACCOUNT_ID}/${IMAGE_REPO_NAME}"
//         DOCKER_CREDS_ID = "cr-registry"
    }

    stages {
        // Building Docker images
        stage('Checkout SCM') {
            steps {
                git branch: 'master',
                    credentialsId: 'git-key',
                    url: 'git@github.com:cloudrural/cr-auth-service.git'

            }
        }
        stage('build') {
            steps{
                script {
                sh "mvn clean package"
                }
            }
        }

//         stage('Pushing Docker Image') {
//             steps {
//               withCredentials([usernamePassword(credentialsId: '${DOCKER_CREDS_ID}', passwordVariable: 'password', usernameVariable: 'username')]) {
//                 sh "docker login -u $username -p $password"
//                 sh "docker push ${REPOSITORY_URI}:${IMAGE_TAG}"
//               }
//             }
//         }
    }
}