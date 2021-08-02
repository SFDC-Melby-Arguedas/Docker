#!/bin/bash
docker network create sonarqube_network
docker network ls
docker container run --name postgres -e POSTGRES_USER=root -e POSTGRES_PASSWORD=Alice2012 -v /custom/mount:/var/lib/postgresql/data --network sonarqube_network -d postgres
docker container ps -a
docker volume ls
docker run -d --name sonarqube   -p 9000:9000  -e sonar.jdbc.url=jdbc:postgresql://postgres/postgres  -e sonar.jdbc.username=root -e sonar.jdbc.password=Alice2012 -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true  --network sonarqube_$
docker volume ls
docker run -d --name jenkins -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --network sonarqube_network jenkins/jenkins:lts-jdk11
docker volume ls
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data --network sonarqube_network sonatype/nexus3
docker volume ls
docker run -d -p 8000:8000 -p 9001:9001 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce --network sonarqube_network portainer:latest
docker volume ls

