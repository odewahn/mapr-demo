#!/bin/bash

export ODBCINI=/usr/home/.odbc.ini
export MAPRDRILLINI=/usr/home/.mapr.drillodbc.ini
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mapr/drillodbc/lib/64:/usr/lib

echo "Starting local embedded Drillbit"
screen -S pytest -d -m /opt/drill/apache-drill-1.1.0/bin/drill-embedded
sleep 20

echo "Running test"
python /usr/home/pydrill_test.py

# send a ctrl-D
echo "Shutting down Drillbit"
screen -S pytest -X stuff `echo -ne '\004'`
sleep 5
