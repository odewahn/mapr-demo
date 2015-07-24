#!/bin/bash

# Strict mode

# Start Apache drill in embedded mode:
#    https://github.com/mkieboom/apache-drill-docker/blob/master/bootstrap.sh
#
#  Need to figure out if there's a real way to daemonize it
#

export ODBCINI=/usr/home/.odbc.ini
export MAPRDRILLINI=/usr/home/.mapr.drillodbc.ini
export LD_LIBRARY_PATH=/usr/local/lib:/opt/mapr/drillodbc/lib/64

# /opt/drill/apache-drill-1.1.0/bin/drill-embedded &

echo "Starting Jupyter Notebook"
# start the notebook server
ipython2 notebook \
   --no-browser \
   --port 8888 \
   --ip=* \
   --NotebookApp.allow_origin=*
