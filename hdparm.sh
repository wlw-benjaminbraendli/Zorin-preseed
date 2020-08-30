#!/bin/bash
foo=$(hdparm -I $1 | grep "frozen")
if [ "$foo" == "		frozen" ]
	then
		echo "terminate frozen"
		(dd if=/dev/urandom of=$1 status=progress)
	else
		hdparm --user-master u --security-set-pass Eins $1
		foo=$(hdparm -I $1 | grep "enabled")
		if [ "$foo" == "		enabled" ]
			then
				time hdparm --user-master u  --security-erase Eins $1
				foo=$(hdparm -I $1 | grep "enabled")
				if [ "$foo" == "		enabled" ]
					then
						echo "you failed the last step"
						(dd if=/dev/urandom of=$1 status=progress)
					else
						echo "erase successful"
				fi
			else
				echo "terminate enabled"
				(dd if=/dev/urandom of=$1 status=progress)
		fi
fi
