#Sai Sandeep Varma Mudundi, G01352322, smudund@gmu.edu
#Team Details:
# Sai Anjaneya Sowrab Meduri( G01270421)
# Rajeev Priyatam Panchadula( G01333080)
# Lakshmi Guttikonda(G01334433)
#Docker File to create an Docker Image
#to run the war file in Tomcat
FROM tomcat:8.5.47-jdk8-openjdk
#to drop the war file in the webapps folder
COPY ./HW1_Survey_form.war /usr/local/tomcat/webapps
