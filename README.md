# convdirwf

Shell-script for converting multiple files in a directory with FFmpeg.

## Dependencies

+ [FFmpeg](https://ffmpeg.org/)

## Installation

+ get the script (`convdir.sh`)
+ make it executable (`chmod +x PATH_TO_SCRIPT`)

## Usage

Options:
       
       -c      convert files
        
       -h      display this help message

The first thing the -c option ask's is 'From:'. This can be answered with the file ending of the files you want to convert (e.g. .ogg (but without the dot)). The second question is 'To:'. Here you can give the file ending of the desired file format (also without the dot). After that it ask's for confirmation and then (if confirmed) converts the files. At the end you can see the files in the current directory and decide if you want to keep the original files or if you want to delete them.
