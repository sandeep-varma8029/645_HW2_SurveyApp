# 645 HW2 Survey Web Application using CI/CD Pipeline
This Assignment invloves establishing a CI/CD pipeline that includes a Git source code repository of the survey application developed in HW1 Assignment , and Jenkins for automated build and for the automated deployment of your application on Kubernetes. This is achieved by building and deploying a Docker Image to GCP Kubernetes cluster with the help of a Jenkins Pipeline.
The Folder has the source code of the Web App from eclipse, Dockerfile, Jenkinsfile, deployment.yaml and the HW1 Survey Application's war file.
The below image shows an overview of the implementation

![image](https://user-images.githubusercontent.com/32533425/198972473-9fd57b50-3ca4-4d66-a7d8-62386478b7a9.png)

The basic Requirements Include:

    1. A Google Cloud Platform (GCP) Account
    2. Jenkins
    3. Docker
    4. Docker Hub Account
    5. GCP Kubernetes Cluster
Step 1: GCP Setup

First, we need to setup our GCP to have Jenkins and Kubernetes.To get started:

    · Create a GCP account
    · Create a new project
    · Enter your project details such as name and location
    · Click on create, you should see the created project on the dashboard
 
Step 2: Setup Kubernetes on GCP

    · Click on Kubernetes Engine 
    · Click on cluster, then click on create
    · Click on configure under standard mode
    · Enter your cluster name and click on create
    . Enable Kubernetes Engine API
![image](https://user-images.githubusercontent.com/32533425/198981692-0515afd3-fa1b-4fa3-ad79-9626a04f9356.png)
Step 3: Setting up Jenkins on GCP

The next step is to create Jenkins’s instance on GCP.

    · Click on the hamburger menu
    · Click on compute engine
    · Click on VM instance
    · Click on create instance
    . Enter your Jenkins instance details
    . Enter the name of the instance as Jenkins
    . Enable firewall to allow HTTP and HTTPS traffic
    . You can configure the Jenkins instance depending on your needs
    . Click on create,You should see the Jenkins instance in the list of VM instances
![image](https://user-images.githubusercontent.com/32533425/198983632-6cd925a0-3a77-403a-894e-07adf5a96133.png)

There are various ways in which we can access the Jenkins instance. For this application, we are using browser window

Install Jenkins using the browser window. Check Jenkins Installation on Debian at https://www.jenkins.io/doc/book/installing/linux/#debianubuntu.
The external IP is the accessible IP address for the Jenkins instance. For example, http://<jenkins_external_ip>:8080

The above URL will not be available, we need to add a firewall rule that will allow port 8080. To do this

    · Click on Jenkins instance
    · Scroll down to network tag, click on default under network header
    · Click on firewall rules
    · Click on add firewall rule
    · Enter details of the firewall rule
    . Type Jenkins as name
    . Type any preferred description
    . Select All instances in the network as target
    . Type 0.0.0.0/0 as Source IPv4 ranges
    . Select Specified protocols and ports
    . Check tcp and enter 8080 as the value
    . Click on save
![image](https://user-images.githubusercontent.com/32533425/198984161-375a78bd-3ca7-4a2f-ae43-2b61fa9c6c28.png)


http://<jenkins_external_ip>:8080 will be accessible, install the necessary plugins and you will be able to login to Jenkins
The simplest and most common way of installing plugins is through the Manage Jenkins > Manage Plugins view, available to administrators of a Jenkins environment.
Under the Available tab, plugins available for download from the configured Update Center can be searched and considered.Important plugins to be installed:

      Google Kubernetes Engine Plugin
      Kubernetes
      Kubernetes CLI Plugin
      Kubernetes Credentials Provider
      Google Container Registry Auth Plugin
      Google Container Registry Auth Plugin
      Docker Pipeline
      Git client plugin
      Git plugin
      GitHub
      GitHub API Plugin
      Github App Kubernetes Credentials
      Github App Kubernetes Credentials
      GitHub Branch Source Plugin
      Pipeline: GitHub Groovy Libraries
      
![image](https://user-images.githubusercontent.com/32533425/198983852-f49962fd-5b45-42fc-b938-023979529382.png)

Storing Credentials in Jenkins:
We will use the Jenkins credentials store for the pipeline to communicate with the Kubernetes cluster and the Docker Hub registry

    Navigate to the "Dashboard > Manage Jenkins > Manage Credentials" menu item.
    Select the "System" sub-menu" and the "Global credentials" domain.
    Click the "Add credentials" link. 
    Select the "Username with password" credential type and enter your Docker Hub username and password in the corresponding fields. 
    Set the "ID" field to dockerID. 
    Click "OK" to save the changes.
![image](https://user-images.githubusercontent.com/32533425/198992781-37b7918f-0b5b-49b7-b920-31c8b73997ee.png)


To Add GCP Kubernetes Cluster Credentials:

    Navigate to the "IAM & admin -> Service accounts" page and create a new service account.
    For this Assignment, I have created a service account with the name "Compute Engine default service account". 
    Assign it the "Kubernetes Engine Admin" role.
    Next, create a new JSON key for the service account. 
    Download and save this key.
    
![image](https://user-images.githubusercontent.com/32533425/198993771-28d4921d-329a-44d8-8c2e-0ef5e77a4360.png)

    On Jenkins Click the "Add credentials" link.
    Select the "Google Service Account from private key" credential type and set the project name (which doubles as the credential identifier) to my project name. 
    Select the "JSON key" radio button and upload the JSON key obtained in the previous step in Setting up the GCP Account. 
    Click "OK" to save the changes.
    
![image](https://user-images.githubusercontent.com/32533425/198993887-ed6998d1-ff42-467d-9a2e-bb93f389a710.png)


Step 4: Creating a Docker Container

    . Make sure you have docker installed on your machine, install from https://docs.docker.com/engine/install/ubuntu/
    . Create a file called Dockerfile. Docker requires the file to be called ‘Dockerfile’
    . Build the HW1 Survey Web App project on eclipse and put the war file in the same folder as the Dockerfile,Note that ‘HW1_Survey_from’ is the display name of the       Tomcat application
    . In the DockerFile, use the FROM command to get the initial image for the build, We want to run the war file in Tomcat so we should use the tomcat image:
      FROM tomcat:8.5.47-jdk8-openjdk
    . Next, we need to drop the war file in the webapps folder:
      COPY ./HW1_Survey_form.war /usr/local/tomcat/webapps
    . On the command line, use this command: ‘docker build -t hw2surveyapp:1.0’ You can use whatever name and tag you want
    . Verify that the image is properly working by running ‘docker run -it -p 8080 hw2surveyapp:1.0’ and open a browser at http://localhost:8080/HW1_Survey_from
    . On the command line, login to docker using ‘docker login -u <your username>’
    . Change the name of you image to be <your username on dockerhub>/<name of the app>:<image tag> using the docker tag command. In my case it is: ‘docker tag   
    hw2surveyapp:1.0 sandeepvarma99/hw2surveyapp:1.0’
    . Verify that your image is on Docker Hub,Your image should be accessible from the internet
    
    
    
![image](https://user-images.githubusercontent.com/32533425/198989937-4607bb99-4dec-41fe-a967-95ccb8f78b2c.png)


Step 5: Create deployment file for Kubernetes and JenkinsFile for the Jenkins pipeline

A deployment.yaml file in the repository is added which defines how the built container should be deployed on Kubernetes.
The definition pulls the built container from Docker Hub and creates a new deployment with it in your Kubernetes cluster. It also creates a LoadBalancer service so that the deployment can be accessed from outside the cluster.

Finally, create a pipeline script named Jenkinsfile (also added in the repo). This is the script Jenkins will use to build and deploy the application.
What the Jenkins pipeline file does are as follows;

    · Pull from your repository
    · Dockerize the application
    · Push the image to docker hub
    · Update the deployment YAML file with the build number
    · Deploy to GKE

Step 6: Jenkins Pipeline Setup

We are using Jenkins as our CI/CD

    · Open Jenkins on GCP
    · Click on New Item
    · Enter Jenkins job name
    . Under 'Build Triggers' select 'GitHub hook trigger for GITScm polling' and 'Poll SCM'
    · Select Pipeline and ok
    · Click on pipeline
    · Select Pipline script from SCM as definition
    · Select git as SCM
    · Enter your repository url
    · Enter Jenkinsfile in the script path
    · Click on apply and save

![image](https://user-images.githubusercontent.com/32533425/198995187-c781f3cd-b73f-4a31-95fa-615798cc3761.png)

The Job will appear on your jenkins dashboard

Step 6: Building and Deploying the Application

Click on selected job and Click on Build now to run the job

![image](https://user-images.githubusercontent.com/32533425/198995821-4ce1b091-225e-4b71-8ab2-69f2f09480c6.png)

After successful Jenkins job build, an instance of the application(s) is/are created on GKE

![image](https://user-images.githubusercontent.com/32533425/198996196-8d7351ee-1678-45aa-b08c-6dee06dd0626.png)


The application can be assessed at http://34.122.32.168:8080/HW1_Survey_form/


![image](https://user-images.githubusercontent.com/32533425/198996318-6b577534-96f2-47b4-9a49-fd1edbdd917c.png)

AWS URL of the HomePage : http://studentsurveyapp.s3-website-us-east-1.amazonaws.com/

Project Demo Link : 

