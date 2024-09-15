#!/bin/bash
FOLDER_NAME=$1
ROBOT_FOLDER=$FOLDER_NAME/robot/tests
OUTPUT_FOLDER=$ROBOT_FOLDER/output

ROBOT_SCRIPT_NAME=$2

if [ ! -d "$FOLDER_NAME" ]; then
    printf "Please, tell a valid folder name (example: run_robot_scripts.sh organo)"
    exit 1
fi

printf "Folder selected: $FOLDER_NAME\n"

if [ ! -d "$ROBOT_FOLDER" ]; then
    printf "The project $FOLDER_NAME has no structure robot/tests!"
    exit 1
fi

if [ ! -z "$ROBOT_SCRIPT_NAME" ]; then
    ROBOT_SCRIPT="$ROBOT_FOLDER/$ROBOT_SCRIPT_NAME.robot"

    if [ ! -f "$ROBOT_SCRIPT" ]; then
        printf "Robot script '$ROBOT_SCRIPT' is invalid. Please omit this variable or tell a valid one"
        exit 1
    else
        printf "Script selected: $ROBOT_SCRIPT\n\n"

        robot --version
        rm -rf $OUTPUT_FOLDER 2> /dev/null

        printf "\n"
        robot --outputdir $OUTPUT_FOLDER $ROBOT_SCRIPT
    fi
else
    printf "\n*****************************
* Running Robot Automations *
*****************************\n\n"

    robot --version
    rm -rf $OUTPUT_FOLDER 2> /dev/null

    i=1
    for ROBOT_SCRIPT in $ROBOT_FOLDER/*.robot; do
        printf "\n$i) Running $(basename $ROBOT_SCRIPT)\n"

        mkdir $OUTPUT_FOLDER/script_$i 2> /dev/null
        robot --outputdir $OUTPUT_FOLDER/script_$i $ROBOT_SCRIPT

        i=$(( i + 1 ))
    done
fi

exit 0