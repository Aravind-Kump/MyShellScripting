file="/path/to/files"
for file in *.txt
do
  mv "$file" "${file/.txt/.log}"
done


SECOND FORMAT
#!/bin/bash
path="/tmp/folder/*.txt"
for FILE in $path
do
   FILEBASENAME=$(echo $FILE | cut -d. -f1)
   FILEEXT=$(echo $FILE | cut -d. -f2)
   cp $FILE $FILEBASENAME-moved.html
done
