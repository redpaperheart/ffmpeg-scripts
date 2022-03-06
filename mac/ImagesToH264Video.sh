
framerate="${1:-1}"
fileExtension="${2:-jpg}"
# makes videos of all subdirectories that include .jpg images
for d in */ ;
  do name=`echo "${d}" | cut -d'/' -f1`
  echo "$name - framerate: $framerate - ext: $fileExtension"
  echo "-- $framerate"
  ffmpeg -framerate $framerate -pattern_type glob -i "./${name}/*.${fileExtension}" -c:v libx264 -pix_fmt yuv420p "${name}.mp4"
done
