#!/usr/bin/bash
#
# Copyright (c) 2021 NetApp, Inc.
#
# This script can be run from the systemshell to invoke a ZAPI from a specified file.
# $ ontapi.sh <host> <admin-name> <password> <zapi-file> [-v]

if [ $# -lt 4 ]; then
echo "Usage: ontapi.sh <host> <admin-name> <password> <zapi-file> [-v]"
exit 1
fi

host=$1
user=$2
pass=$3
filename=$4
verbose=0

# Check for verbose switch
verbose_input=$5
if [ $# -gt 4 ] && [ $verbose_input == "-v" ]; then
verbose=1
fi

# Read the ZAPI from the file
buffer=""
while read -r line
do
buffer="$buffer$line"
done < "$filename"

# Display the ZAPI in verbose mode
if [ $verbose -eq 1 ]; then
echo "ZAPI:"
echo $buffer
echo ""
fi

switches="-sku"
# Add an extra -v for the curl command in verbose mode
if [ $verbose -eq 1 ]; then
switches="-vsku"
fi

# Send the ZAPI
curl -X POST "https://$host/servlets/netapp.servlets.admin.XMLrequest_filer" -H "accept: text/xml" -H "Content-type: text/xml" $switches "$user":"$pass" -d "<netapp version='1.130'>$buffer</netapp>"

echo ""
echo ""
