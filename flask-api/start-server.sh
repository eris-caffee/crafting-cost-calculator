#!/bin/sh
cd /home/crafter/app/src
echo "FLASK_DEBUG $FLASK_DEBUG"
if [ "$FLASK_DEBUG" != "" ]; then
    /home/crafter/.local/bin/flask run -h 0.0.0.0 -p 5000 --debug
else
    /home/crafter/.local/bin/flask run -h 0.0.0.0 -p 5000
fi

