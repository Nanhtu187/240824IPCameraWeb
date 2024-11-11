#!/bin/sh

# Usage: ./client.sh -p port_number -f /path/to/save/image.jpg
while getopts p:f: flag
do
    case "${flag}" in
        p) PORT=${OPTARG};;
        f) FILE_PATH=${OPTARG};;
        *) echo "Usage: $0 -p port_number -f /path/to/save/image.jpg"
           exit 1 ;;
    esac
done

if [ -z "$PORT" ] || [ -z "$FILE_PATH" ]; then
    echo "Usage: $0 -p port_number -f /path/to/save/image.jpg"
    exit 1
fi

nc localhost "$PORT" > "$FILE_PATH"
