#!/bin/bash

/zap2xml.pl -u $USERZAP -p $PASSZAP -e -o /output/xmltv.xml

printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh 

cron -f