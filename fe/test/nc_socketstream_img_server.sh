#!/bin/sh

# Usage: ./server.sh -f /path/to/your/image.jpg -p port_number
# This script starts a server that listens on the specified port and sends the specified image file to any connecting client.

while getopts f:p: flag
do
    case "${flag}" in
        f) IMAGE_PATH=${OPTARG};;
        p) PORT=${OPTARG};;
        *) echo "Usage: $0 -f /path/to/your/image.jpg -p port_number"
           exit 1 ;;
    esac
done

if [ -z "$IMAGE_PATH" ] || [ -z "$PORT" ]; then
    echo "Usage: $0 -f /path/to/your/image.jpg -p port_number"
    exit 1
fi

while true; do
    nc -l -p "$PORT" -q 1 < "$IMAGE_PATH"
done
