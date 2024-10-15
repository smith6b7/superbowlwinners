#!/bin/bash

# Display help message if -h or --help is provided

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  echo
  echo "This script finds the Super Bowl winner for the specified year using the Superbowlwinners.txt file."
  echo
  echo "You will enter ./find_superbowl_winner.sh and the year you would like to know who won the Super Bowl."
  echo
  echo "Options:"
  echo "  -h, --help    Show this help message and exit"
  exit 0
fi
# Define the input file
input_file="Superbowlwinners.txt"

# Check if the user provided a year as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <year>"
  exit 1
fi

YEAR=$1
FILE="Superbowlwinners.txt"

# Check if the file exists
if [ ! -f "$FILE" ]; then
  echo "Error: $FILE not found!"
  exit 1
fi

# Search for the year in the file and print the winner
WINNER=$(grep "^$YEAR:" "$FILE")

if [ -n "$WINNER" ]; then
echo
  echo "Super Bowl winner for the year $YEAR is the ${WINNER#*: }."
else
echo
  echo "No Super Bowl winner found for the year $YEAR."
fi