FROM tomcat:8.0

# copy the config for tomcat (User:admin PW: admin)
COPY ./tomcatConfig/tomcat-users.xml /usr/local/tomcat/conf/

# do some cleaning and create needed directories
RUN rm -rf /usr/local/tomcat/webapps/examples && \
    rm -rf /usr/local/tomcat/webapps/docs && \
    mkdir /usr/local/tomcat/webapps/strichliste && \
    mkdir /home/user && \
    mkdir /home/user/project && \
    mkdir /home/user/data && \
    mkdir /home/user/backup && \
    ln -s /usr/local/tomcat/ /opt/

# install the needed packages
RUN apt-get update && apt-get install -y \
    openjdk-7-jdk   \
    apt-utils \
    ant \
    git \
    nano
