#!/bin/bash
FOLDER_NAME=$1
ROBOT_FOLDER=$1/robot
OUTPUT_FOLDER=$ROBOT_FOLDER/output

if [ ! -d "$FOLDER_NAME" ]; then
    printf "Please, tell a valid folder name (example: run_robot_scripts.sh organo)"
    exit 1
fi

printf "Folder selected: $FOLDER_NAME\n";

printf "*****************************
* Running Robot Automations *
*****************************\n\n"

robot --version

i=1
for robot_script in $ROBOT_FOLDER/*.robot; do
    rm -rf $OUTPUT_FOLDER 2> /dev/null
    printf "\n$i) Running $(basename $robot_script)\n"

    mkdir $OUTPUT_FOLDER/script_$i 2> /dev/null
    robot --outputdir $OUTPUT_FOLDER/script_$i $robot_script

    i=$(( i + 1 ))
done