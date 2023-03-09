#!/bin/sh
cd /home/crafter/app/src
if [ "$FLASK_DEBUG" ne "" ]; then
    /home/crafter/.local/bin/flask run -h 0.0.0.0 -p 5000 --debug
else
    /home/crafter/.local/bin/flask run -h 0.0.0.0 -p 5000
fi

