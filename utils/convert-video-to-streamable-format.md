# -v quiet -stats are optional and make the output just show the progress
ffmpeg -i input.mp4 -c:v libx264 -crf 22 -c:a libfaac -movflags faststart -v quiet -stats optimized.mp4
