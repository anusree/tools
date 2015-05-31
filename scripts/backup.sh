#!/bin/bash
####Usage####
##chmod +x backup_script.sh
##./backup_script.sh myfile.txt
#### Validation ####


# "$#" gives number of arguments, try echo $#
if [ $# -eq 0 ]
then
echo "You must supply name of file/dir to be backup"
#exit/quit from script if no argument supplied
exit 1
fi


if [ -d $2 ]
then 
echo "The directory exist"
else
echo "Please enter a valid directory name"
exit 1
fi

#### Backup Logic ####
DIR_OR_FILE_TOBE_BACKUP=$1
PATH_DIR_OR_FILE_TOBE_BACKUP=$2
OUT_PUT_FILE=my-backup-$(date +%Y%m%d%S).tar.gz


#Here "tar" is the backup command and option "-c" means create a new archive
#and -Z means gzip and "-f" means use archive file


echo $DIR_OR_FILE_TOBE_BACKUP
echo $OUT_PUT_FILE
echo $PATH_DIR_OR_FILE_TOBE_BACKUP

if [ -n $PATH_DIR_OR_FILE_TOBE_BACKUP ]
then
tar -czf $OUT_PUT_FILE -C $PATH_DIR_OR_FILE_TOBE_BACKUP  $DIR_OR_FILE_TOBE_BACKUP
else
tar -czf $OUT_PUT_FILE $DIR_OR_FILE_TOBE_BACKUP
fi
