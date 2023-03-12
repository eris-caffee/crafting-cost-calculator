#!/bin/bash

wget http://localhost:5000/item_types -o /dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to download item_types"
    exit 1
else
    echo "Success"
    exit 0
fi