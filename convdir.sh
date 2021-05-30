#! /bin/bash

# Converts files of the given "from" type to the given "to" type in the current directory with FFmpeg.

case $1 in
	"-c")
		# getting from and to
		read -p "From:" from
		read -p "To:" to
		printf "\n"
		
		# counting the amount of files to convert
		count="$(ls -1 ./*.$from | wc -l)"

		read -p "convert $count files(Y/n):" ans1
		read -p "notify when finished:(y/N):" ans3
		printf "\n"

		case $ans1 in
			"n")
				printf "\nnot converting"
				;;
			*)
				# converting with FFmpeg
				for i in *."$from";
				do name="$(echo "$i" | awk -F "." 'sub(FS $NF,x)')"
					ROW="$(for n in $(seq $(echo $name | wc -c)); do
        				printf "#"
					done
					)"
					printf "\n\n##$ROW#\n# $name #\n##$ROW#\n\n"
  					ffmpeg -i "$i" "${name}.$to"
				done

				# notifying (if confirmed)
				case $ans3 in
					"y")
						notify-send -t -1 "CONVDIR" "converted all $count files"
						;;
					*)
						printf "converted all $count files"
						;;
				esac
			
				# listing all (visible) files in current directory for checking
				printf "\n\n########################################\n########################################\n\nFiles in converted directory:\n\n"
		
				ls

				printf "\n\n"

				read -p "Delete original files(y/N):" ans2
		
				# deleting original files (if confirmed)
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

	The first thing the -c option ask's is 'From:'. This can be answered with the file ending of the files you want to convert (e.g. .ogg (but without the dot)). The second question is 'To:'. Here you can give the file ending of the desired file format (also without the dot). After that it ask's for confirmation and if you want to be notified when finished,then (if confirmed) converts the files. At the end you can see the files in the current directory and decide if you want to keep the original files (all files with the given 'From:' ending) or if you want to delete them."
	;;
	*)
		echo "See -h option for a help."
		;;
	esac
