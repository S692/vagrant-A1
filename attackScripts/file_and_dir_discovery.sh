#!/bin/bash
#assuming attacker is already aware of the valuable research data hosted on the target server. hence it targets .docx and .xslx files
echo -e "[Start File and Directory Discovery...]\n"
echo -e "Current Directory: $PWD \n"

echo -e "Errors (if any): \n"


#del any old results
rm -f fndd.txt
#for the following /home/<user>/ dir discovery, it is assumed that the user list has already been previously discovered by the attacker through reconnaissance
#hence this file and dir discovery script has been designed to search specific the specific user, resch dir

#create the txt to sort the results
touch fndd.txt
#common file extensions; png, jpg, mp3, txt, pdf, doc, xls
echo -e "----------------------------common file extensions----------------------------\n" >> fndd.txt
eecho -e "\nExtension Type 01: Documents" >> fndd.txt
find /home/resch -name "*.doc" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.docx" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.pdf" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.pptx" -printf "%a %p \n" >> fndd.txt
echo -e "\nExtension Type 02: Excel sheets" >> fndd.txt
find /home/resch -name "*.xls" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.xlsx" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.csv" -printf "%a %p \n" >> fndd.txt
echo -e "\nExtension Type 03: Media" >> fndd.txt
find /home/resch -name "*.png" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.jpg" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.jpeg" -printf "%a %p \n" >> fndd.txt
find /home/resch -name "*.mp3" -printf "%a %p \n" >> fndd.txt
echo -e "\nExtension Type 04: txt" >> fndd.txt
find /home/resch -name "*.txt" -printf "%a %p \n" >> fndd.txt



echo -e "\n \n----------------------------executables files with 700 permission in home dir----------------------------\n" >> fndd.txt
find /home/ -type f -executable -perm /700 -printf "%a %p \n" >> fndd.txt

#/etc/profile, ~/.bash_profile, ~/.bash_login, ~/.profile. /home/user/.bashrc, /etc/bash.bashrc, /etc/profile.d/.
echo -e "\n \n----------------------------files in bash and profile----------------------------" >> fndd.txt
find ~/ -name ".bash*" -printf "%a %p \n" >> fndd.txt
find ~/ -name ".profile*" -printf "%a %p \n" >> fndd.txt

#backup folder 
echo -e "\n \n----------------------------backups folder----------------------------" >> fndd.txt
ls -la -R /var/backups/* >> fndd.txt

#.ssh folder, if there are any other ssh keys than the one planted for initial access
echo -e "\n \n-----------------------------.ssh backup key ls----------------------------" >> fndd.txt
find ~/ -name "*ssh*" -printf "%a %p \n" >> fndd.txt

#check location and if /etc/shaodow and /etc/passwd exists
echo -e "\n \n----------------------------shadow files and config with root permission---------------------------" >> fndd.txt
find /etc/ -group shadow -printf "%a %p \n" >> fndd.txt
find /etc/ -user root -name "*.conf" -printf "%a %p \n" >> fndd.txt
find /etc/ -user resch -name "*.conf" -printf "%a %p \n" >> fndd.txt

#hidden folders
echo -e "\n \n----------------------------all hidden file/folder----------------------------" >> fndd.txt
find / -name ".*" -maxdepth 5 2> /dev/null >> fndd.txt


echo -e "\n \n----------------------------folder created for PEexploit----------------------------" >> fndd.txt
ls -la -R /var/research/* >> fndd.txt

echo -e "\n[End of File and Directory Discovery.]\n"

