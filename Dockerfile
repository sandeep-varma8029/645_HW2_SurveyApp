#Sai Sandeep Varma Mudundi, G01352322, smudund@gmu.edu
#Docker File to create an Docker Image
#to run the war file in Tomcat
FROM tomcat:8.5.47-jdk8-openjdk
#to drop the war file in the webapps folder
COPY ./HW1_Survey_form.war /usr/local/tomcat/webapps
