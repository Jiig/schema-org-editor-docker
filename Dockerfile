FROM tutum/tomcat:7.0
MAINTAINER Lucas Vandenbergh <luktut@gmail.com>
run apt-get update
RUN apt-get install -y wget python-pip git
RUN wget https://oss.sonatype.org/service/local/repositories/releases/content/org/fcrepo/fcrepo-webapp/4.0.0-beta-03/fcrepo-webapp-4.0.0-beta-03.war -P /tomcat/webapps/fedora.war
RUN git clone https://github.com/jermnelson/schema-org-editor.git
ADD key.py key.py
RUN python key.py
RUN pip install Flask-FedoraCommons

