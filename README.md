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
Under the Available tab, plugins available for download from the configured Update Center can be searched and considered:
Important plugins to be installed:

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
