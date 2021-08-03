# This program compares system date
#with already stored data and prompts if
#some-one's birthday is today
#/usr/share/zoneinfo
#!/bin/ksh -vx

echo "Hello $LOGNAME"
echo "Welcome to TS2 Server"

echo "Today's Date is"

DATE=`date +%A%t%d%t%m%t%Y`
TIME=`date +%t%H%t%M%t%Z`

MYDATETIME=${DATE}${TIME}

echo $MYDATETIME

DATECMP=`date +%d%m`
file=/home/srivasta/birthday_Mailer/birthday.txt

        while read string
        do
                birthdayperson=$(echo $string | cut -d: -f1)

                birthdate=$(echo $string | cut -d: -f2)

                timezone=$(echo $string| cut -d: -f3)

                if [ $birthdate -eq $DATECMP ];
                then
                        echo "$birthdayperson has birthday today"
                fi
        done<"$file"