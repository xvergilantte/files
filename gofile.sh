#!/bin/bash
ENDPOINT="https://upload.gofile.io/uploadfile"
if [ $# -lt 1 ]; then
  echo "Usage: $0 <file-path>"
  exit 1
fi
FILE_PATH="$1"
response=$(curl -s -X POST "$ENDPOINT" -F "file=@${FILE_PATH}")
status=$(echo "$response" | jq -r '.status')
if [ "$status" != "ok" ]; then
  echo "Upload failed: $response"
  exit 1
fi
downloadPage=$(echo "$response" | jq -r '.data.downloadPage')
echo "Download link: $downloadPage"

