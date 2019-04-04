#!/bin/bash

#configure a new scratch org with import Bruker data and the source files
# create the new org
CREATE=`sfdx force:org:create -f config/project-scratch-def.json`
username="$(echo -e "${CREATE#*username:}" | tr -d '[:space:]')"
#set the default username
echo "Current user is "$username
SET_DEFAULT_USR=`sfdx force:config:set defaultusername=`$username

if [[ $CREATE == *"Successfully"* ]] ; then
    IMPORT=`sfdx force:data:tree:import <filename>`
    echo "Successfully imported sample data. Trying to push source now."
    PUSH_SOURCE=`sfdx force:source:push`
    echo "Successfully pushed the source code"
    OPEN=`sfdx force:org:open`
else 
    echo "Something went wrong while creating the scratch org."
fi