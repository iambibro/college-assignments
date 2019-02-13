echo -e "Enter the source file name 	: \c"
read src
if [ ! -f "$src" ]
then
	echo "[Error] File '$src' does not exist! Unable to copy!"
	exit
fi
lines=`wc -l "$src" | cut -d' ' -f1`
if [ $lines -eq 0 ]
then
	echo "[Error] '$src' is an empty file! Unable to copy!"
	exit
fi
echo -e "Enter the destination file name : \c"
read dest
if [ -f "$dest" ]
then
	echo "[Warn] File '$dest' already exists! Its contents will be overridden by copy!"
	echo -e "Do you want to continue? (Y/N) \c"
	read choice
	if [ $choice = "n" -o $choice = "N" ]
	then
		exit
	else
		rm "$dest"
	fi
fi
i=1
while [ $i -le $lines ]
do
	line=`head $src -n $i | tail -n 1`
	echo $line >> "$dest"
	echo "[Copied] $line"
	i=`expr $i + 1`
done
echo "[Done] '$src' successfully copied to '$dest'!"
