# Convert video to gif. Make sure -s specifies the correct aspect ratio for your video (make this smaller to keep gif size down)
ffmpeg -i input.mp4 -pix_fmt rgb24 -r 10 -s 700x380 ~/Desktop/screenshots/output.gif

# Then optimize the gif using ImageMagick
convert -layers Optimize output.gif output_optimized.gif
