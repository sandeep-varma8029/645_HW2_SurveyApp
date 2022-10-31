// Sai Sandeep Varma Mudundi, G01352322, smudund@gmu.edu
/* the script Jenkins will use to build and deploy the application. What the Jenkins pipeline file does are as follows:

· Pull from your repository
· Dockerize the application
· Push the image to docker hub
· Update the deployment YAML file with the build number
· Deploy to GKE 
*/
pipeline {
    agent any
    environment {
        PROJECT_ID = "hw2assignment-366123"
        CLUSTER_NAME = "k8-hw2surveyapp"
        LOCATION = "us-central1-c"
        CREDENTIALS_ID = "hw2assignment"
	DOCKERHUB_CREDENTIALS=credentials('docker-cred')
    }
    stages {
	         stage('pull from github repo'){
            steps{
                git "https://github.com/sandeep-varma8029/645_HW2_SurveyApp.git"
            }
        }
		stage("Building war"){
			steps{
				script{
					checkout scm
					sh 'rm -rf *.war'
					sh 'jar -cvf HW1_Survey_form.war -C HW1_Survey_form/src/main/webapp/ .'
					sh 'echo "Sandy@0829v" | docker login --username sandeepvarma99 --password-stdin'
					sh "docker build -t sandeepvarma99/hw2surveyapp:${env.BUILD_ID} ." 
					

					
			}

		}

	}
	stage("Pushing image to DockerHub"){
		steps{
			script{
				                sh "docker push sandeepvarma99/hw2surveyapp:${env.BUILD_ID}"

			}
		}
	}
        stage('deploy on k8 cluster'){
            steps{
                sh "sed -i 's/1.0/${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID,verifyDeployments: true])   
            }
        }
    }
}
