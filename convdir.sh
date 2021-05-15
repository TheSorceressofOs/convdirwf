#! /bin/bash

# Converts files of the given "from" type to the given "to" type in the current directory with FFmpeg.

case $1 in
	"-c")
		read -p "From:" from
		read -p "To:" to
		printf "\n"
		read -p "convert files(Y/n):" ans1
		printf "\n"

		case $ans1 in
			"n")
				printf "\n"
				echo "not converting"
				;;
			*)
			for i in *."$from";
  				do name=`echo "$i" | awk -F "." 'sub(FS $NF,x)'`
  				echo "$name"
  				ffmpeg -i "$i" "${name}.$to"
			done
			
			printf "\n\n########################################\n########################################\n\nFiles in converted directory:\n\n"
		
			ls

			printf "\n\n"

			read -p "Delete original files(y/N):" ans2
		
			case $ans2 in
				"y")
					echo "deleting original files..." && rm ./*.$from && echo "done"
					;;
				*)
					echo "leaving original files...done"
					;;
			esac
				;;
		esac
		;;
	"-h")
		echo "This script converts files in the current directory with FFmpeg.
Options:
        -c      convert files
        -h      display this help message

The first thing the -c option ask's is 'From:'. This can be answered with the file ending of the files you want to convert (e.g. .ogg (but without the dot)). The second question is 'To:'. Here you can give the file ending of the desired file format (also without the dot). After that it ask's for confirmation and then (if confirmed) converts the files. At the end you can see the files in the current directory and decide if you want to keep the original files or if you want to delete them."
	;;
	*)
		echo "See -h option for a help."
		;;
	esac
