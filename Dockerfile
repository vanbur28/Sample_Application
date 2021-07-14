# syntax=docker/dockerfile:1 #Instructs the dockerfile for what syntax to use.

# This part of the code twlls what specific base image to use, the slim buster has the minimum packages installed
FROM python:3.9.5-slim-buster 

#where the files are being used from on the directory the dockerfile is running (local in this case)
WORKDIR /home/ubuntu/sample_application/

#To copy the contents of the requirments.txt to another .txt file with the same name within the image
COPY requirements.txt requirements.txt

RUN apt-get update
RUN pip3 install -r requirements.txt

#Since the application directory is already open the ". ." just refers to the current direcotry and the COPY function duplicates all files within the directory into the image
COPY . .

#python3 tells the app to be run as a python3; 
#-m flag sets memory limit; 
#flask defines the environmental variables; 
#flask run tells the file to exicute the application in the flask environment; 
#--host=0.0.0.0 allows thde application to be used outside of the container environment 
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]