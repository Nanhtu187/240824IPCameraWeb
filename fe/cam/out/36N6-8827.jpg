#!/bin/sh

# Directory where httpd will serve files from
WEB_DIR="."

#set permission execute for demo_ANPR_cv25 and keep_10_files.sh
chmod +x demo_ANPR_cv25
chmod +x keep_10_files.sh

# while true; do
#     # Capture a yuv
#     ./test_yuvcap -b 1 -Y -f cam/cam.yuv -F 0 -r 1

#     # Convert yuv to jpg
#     ./jpg_enc -y cam/cam.yuv_canvas1_640x360_IYUV.yuv -w 640 -h 360 -f cam/cam.jpg

#     # Optional: Add a small delay to prevent excessive CPU usage
#     sleep 0.02
# done

# Start test_mjpeg_filo to generate MJPEG frames
# test_mjpeg_filo -o -B -n 0 > $WEB_DIR/stream.mjpeg &

#start demo ANPR cv25 in backgound
./demo_ANPR_cv25 "$WEB_DIR/cam" &

#loop to keep 10 files in cam folder
# while true; do 
    ./keep_10_files.sh "$WEB_DIR/cam"
    sleep 0.1
# done &

# Start httpd to serve the web directory
# httpd -p 8000 -h $WEB_DIR &
