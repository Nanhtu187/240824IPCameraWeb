#!/bin/sh

# Check if a directory was passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Directory where the files are located
DIR="$1"
OUT_DIR="$DIR/out"

# Number of files to keep
KEEP=10

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "Error: Directory $DIR does not exist."
  exit 1
fi

# Create the /out sub-folder if it doesn't exist
mkdir -p "$OUT_DIR"

# Clean up: Find files, sort by modification date, and delete all but the most recent $KEEP files
find "$DIR" -maxdepth 1 -type f | grep -v '/out/' | xargs ls -t | tail -n +$(($KEEP + 1)) | xargs -I {} rm -- "{}"

# Create plate.txt and copy the latest 10 files to /out, renaming them
COUNT=1
find "$DIR" -maxdepth 1 -type f | grep -v '/out/' | xargs ls -t | head -n $KEEP | while read FILE; do
  # Get the filename only (no path)
  BASENAME=$(basename "$FILE")

  # Split the filename by '_', extract first and second parts
  FIRST_PART=$(echo "$BASENAME" | cut -d '_' -f 1)
  SECOND_PART=$(echo "$BASENAME" | cut -d '_' -f 2)
  
  # Append to plate.txt with format "FIRST_PART-SECOND_PART"
  echo "$FIRST_PART-$SECOND_PART" >> "$OUT_DIR/plate.txt"

  # Copy the file to the /out folder, rename it as 1.jpg, 2.jpg, ..., 10.jpg, force overwrite if needed
  cp -f "$FILE" "$OUT_DIR/$COUNT.jpg"

  # Increment the count for the next file
  COUNT=$(($COUNT + 1))
done

echo "Process complete. The 10 latest files have been copied to $OUT_DIR, renamed as 1.jpg to 10.jpg, and plate.txt has been created."

#chmod +x cleanup.sh
#./keep_10_files.sh /path/to/your/directory
