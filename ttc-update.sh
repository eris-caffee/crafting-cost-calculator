#!/bin/bash

#
# Dowloads latest price tables and loads them into the database.
#

rm -f PriceTable
wget https://us.tamrieltradecentre.com/download/PriceTable

yes A | unzip PriceTable

lua ttc-update.lua
