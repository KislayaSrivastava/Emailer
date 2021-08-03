# Emailer
This perl project was created to remind people and their managers to wish their reportees on their birthday. 

**A little bit of background **

We worked on Unix and linux operating systems and would be so engrossed in the work that usually we would forget each other's birthdays.

I thought it would be a good way to remind everyone as soon as you login on the terminal, you are informed if it is someone's birthday. 

In this package there are two files. One is a korn shell script that is triggered at application login and the other one is an emailer script which can be scheduled via korn shell to execute daily. There is a also a text file which contains all the data. So the scripts read the files and display messages and send emails to the person and his/her manager if the dates recorded in the text file match the system dates.

Birthday.txt file

![image](https://user-images.githubusercontent.com/40534292/127967607-3b34321e-ebfc-447b-ba8c-0c198c2ec7e5.png)

Sample output from korn shell script when application is logged into

![image](https://user-images.githubusercontent.com/40534292/127967841-18cb77df-2036-4d40-9030-45a6b568a131.png)

So as per the text file update, the script can be scheduled and triggered via cron and or system login.

** Setup Pre-requisites**
a) Mailx is installed on your server
b) You have admin access to modify .profile and cron settings

Steps to execute

a) Create a folder on your linux/unix box
b) Copy the birthday.txt, birthday.ksh and timezone.pl into that folder.
c) open up the .profile file 
d) create an entry for the birthday.ksh
e) Schedule a cronjob (cron -e) and set up the timezone.pl to execute daily at a set time.
f) At the same time, enter the records in the birthday.txt file

This is a simple execution of how you can setup the unix server to send emails using mailx feature 
