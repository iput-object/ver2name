#!/bin/bash

# Define paths for input, output, and aapt binary
INPUT_FOLDER="input"
OUTPUT_FOLDER="output"
AAPT_BINARY="lib/aapt"

# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

# Check if the aapt binary exists in the lib folder
if [[ ! -f "$AAPT_BINARY" ]]; then
    echo "Error: aapt binary not found in the lib folder. Make sure it's available at $AAPT_BINARY."
    exit 1
fi

# Make the aapt binary executable
chmod +x "$AAPT_BINARY"

# Process each APK in the input folder
for APK in "$INPUT_FOLDER"/*.apk; do
    if [[ -f "$APK" ]]; then
        # Extract app name and version using aapt
        APP_NAME=$("$AAPT_BINARY" dump badging "$APK" | grep "application-label:" | sed -E "s/.*'(.*)'.*/\1/")
        APP_VERSION=$("$AAPT_BINARY" dump badging "$APK" | grep "versionName=" | sed -E "s/.*versionName='([^']+)'.*/\1/")
        
        # Ensure extracted values are not empty
        if [[ -z "$APP_NAME" || -z "$APP_VERSION" ]]; then
            echo "Warning: Could not extract name or version for $APK. Skipping."
            continue
        fi

        # Generate new file name
        NEW_FILE_NAME="${APP_NAME}_${APP_VERSION}.apk"
        NEW_FILE_NAME=$(echo "$NEW_FILE_NAME" | tr ' ' '_') # Replace spaces with underscores

        # Move and rename the file
        mv "$APK" "$OUTPUT_FOLDER/$NEW_FILE_NAME"
        echo "Processed: $APK -> $OUTPUT_FOLDER/$NEW_FILE_NAME"
    else
        echo "No APK files found in the input folder."
    fi
done
