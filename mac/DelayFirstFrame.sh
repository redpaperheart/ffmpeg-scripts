# save out first frame
ffmpeg -i CollectionTransition_v2.mp4 -vf "select=eq(n\,0)" firstFrame.png

# then stitch together
ffmpeg
-loop 1 -framerate 30 -t 2.5 -i firstFrame.png \
-i CollectionTransition_v2.mp4 \
-filter_complex "[0][1]concat=n=2:v=1:a=0" CollectionTransition_v2_delayed.mp4
