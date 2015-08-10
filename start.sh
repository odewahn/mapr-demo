#!/bin/bash

# Strict mode

# Start Apache drill in embedded mode:
#    https://github.com/mkieboom/apache-drill-docker/blob/master/bootstrap.sh
#
#  Need to figure out if there's a real way to daemonize it
#
#!/bin/bash

export ODBCINI=/usr/home/.odbc.ini
export MAPRDRILLINI=/usr/home/.mapr.drillodbc.ini
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mapr/drillodbc/lib/64:/usr/lib

echo "Starting local embedded Drillbit"
screen -S pytest -d -m /opt/drill/apache-drill-1.1.0/bin/drill-embedded
# Wait for drill to actually start
sleep 20

echo "Starting Jupyter Notebook"

# start the notebook server
ipython2 notebook \
   --no-browser \
   --port 8888 \
   --ip=* \
   --NotebookApp.allow_origin=*

# send a ctrl-D
echo "Shutting down Drillbit"
screen -S pytest -X stuff `echo -ne '\004'`
sleep 5
