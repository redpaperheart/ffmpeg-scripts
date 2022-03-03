
framerate="${1:-1}"
# makes videos of all subdirectories that include .jpg images
for d in */ ;
  do name=`echo "${d}" | cut -d'/' -f1`
  echo "$name - framerate: $framerate"
  echo "-- $framerate"
  ffmpeg -framerate $framerate -pattern_type glob -i "./${name}/*.jpg" -c:v libx264 -pix_fmt yuv420p "${name}.mp4"
done
