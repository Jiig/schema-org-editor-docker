FROM tutum/tomcat:7.0
MAINTAINER Lucas Vandenbergh <luktut@gmail.com>

#install dependencies
RUN apt-get update
RUN apt-get install -y wget python-pip git
RUN pip install rdflib flask
RUN git clone https://github.com/jermnelson/flask-fedora-commons.git

#install fedora4
RUN wget https://oss.sonatype.org/service/local/repositories/releases/content/org/fcrepo/fcrepo-webapp/4.0.0-beta-03/fcrepo-webapp-4.0.0-beta-03.war -O /tomcat/webapps/fedora.war

#install the schema.org editor
RUN git clone https://github.com/jermnelson/schema-org-editor.git

#Set up secret key for editor and the pyhton path for flask_fedora_commons
ADD key.py key.py
RUN python key.py
ENV PYTHONPATH /flask-fedora-commons

#Expose ports and set default command
expose 8100
CMD cd /schema-org-editor/ && python editor.py
