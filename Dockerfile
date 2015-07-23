#
# This will install Apache drill on the ipython/scipystack image
# It's based on:
#    https://github.com/mkieboom/apache-drill-docker/blob/master/Dockerfile
#
FROM ipython/scipystack

MAINTAINER "odewahn@oreilly.com"


#
# You need to apt-get update the first time you run this
# So, if this is your first build, comment this line out!
#
# RUN apt-get update

#
# Prerequisite: Install Java, tar and create Drill folders
# http://doc.mapr.com/display/MapR/Preparing+Each+Node#PreparingEachNode-java
#

RUN apt-get update && \
    apt-get install -yq openjdk-7-jre && \
    mkdir -p /opt/drill && \
    mkdir -p /drill-scripts 

#
# Download and Install Apache Drill
# https://drill.apache.org/docs/installing-drill-on-linux-and-mac-os-x/
#
RUN curl -o apache-drill-1.1.0.tar.gz http://getdrill.org/drill/download/apache-drill-1.1.0.tar.gz && \
    tar zxpf apache-drill-1.1.0.tar.gz -C /opt/drill
