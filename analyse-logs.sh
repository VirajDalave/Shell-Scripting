#!/bin/bash

REPORT=/home/viraj/shell-scripting/logs/Report.txt
LOG_DIR="/home/viraj/shell-scripting/logs/"
echo -e "\nlist of files executed in 24 hours" > $REPORT

FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo $FILES >> $REPORT
PATTERNS=( "ERROR" "FATAL" "CRITICAL" )


echo "analysing log files" >> $REPORT
echo "=======================" >> $REPORT
for FILE in $FILES; do
	for PATTERN in ${PATTERNS[@]}; do
		echo "Finding $PATTERN in $FILE" >> $REPORT
		grep "$PATTERN" $FILE >> $REPORT
		COUNT=$(grep -c "$PATTERN" $FILE) 
		echo $COUNT >> $REPORT
		if [ $COUNT -gt 5 ]; then
			echo "ACTION NEEDED!!!!!!!!!!!!!! at $FILE"
		fi

	done
done
