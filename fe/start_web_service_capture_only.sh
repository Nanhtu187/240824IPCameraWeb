#!/bin/sh

# Directory where httpd will serve files from
WEB_DIR="/root/tivaty/web/"

#check if httpd is running on 8080 by ps | 8080
if ps | grep httpd | grep 8000; then
    echo "httpd is already running on port 8000"
    #kill the httpd process on 8080
    kill 9 $(ps | grep httpd | grep 8000 | awk '{print $1}')
fi

# Start httpd to serve the web directory
httpd -p 8000 -h "$WEB_DIR" &

#Variables declare
width=640
height=360
yuv_file="cam/cam.yuv_canvas1_640x360_IYUV.yuv"
jpg_file="cam/cam.jpg"

# Create a log file to capture the output
log_file="capture_process.log"

# Run the script in the background
# nohup bash -c "
while true; do
    # Capture a yuv frame
    #./test_yuvcap -Y -f "$yuv_file" -F 0 -r 1 -w "$width" -h "$height" #&>/dev/null
    ./test_yuvcap -b 1 -Y -f cam/cam.yuv -F 0 -r 1
    # Convert yuv to jpg
    #./jpg_enc -y "$yuv_file" -w "$width" -h "$height" -f "$jpg_file" #&>/dev/null
    ./jpg_enc -y cam/cam.yuv_canvas1_640x360_IYUV.yuv -w 640 -h 360 -f cam/cam.jpg
    # Optional: Add a small delay to prevent excessive CPU usage
    sleep 0.023
done
# done" &> "$log_file" &

# echo "Capture process started in the background. Logs are in $log_file"

# Start test_mjpeg_filo to generate MJPEG frames
# test_mjpeg_filo -o -B -n 0 > "$WEB_DIR/stream.mjpeg" &
