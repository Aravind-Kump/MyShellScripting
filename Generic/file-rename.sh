file="/path/to/files"
for file in *.txt
do
  mv "$file" "${file/.txt/.log}"
done
