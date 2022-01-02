#!/bin/bash 

echo "Copying Dynamics Libs"

/app/ldd.sh /app/workspace/bin/ffmpeg /app/workspace/lib/
/app/ldd.sh /app/workspace/bin/ffprobe /app/workspace/lib/
/app/ldd.sh /app/workspace/bin/ffplay /app/workspace/lib/