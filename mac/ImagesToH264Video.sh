
framerate="${1:-6}"
fileExtension="${2:-png}"

outputDir="./../${PWD##*/}_libx264_slow_crf_18_ref_1_bf_0_30fps"
mkdir -p $outputDir

# makes videos of all subdirectories that include .jpg images
for d in */ ;
  do name=`echo "${d}" | cut -d'/' -f1`
  echo "$name - framerate: $framerate - ext: $fileExtension"
  echo "-- $framerate"
  echo "$outputDir"
  # ffmpeg -framerate $framerate -pattern_type glob -i "./${name}/*.${fileExtension}" -c:v libx264 -pix_fmt yuv420p -r 30 "${name}.mp4"
  ffmpeg -framerate $framerate -pattern_type glob -i "./${name}/*.${fileExtension}" \
  -c:v libx264 -preset slow -crf 18 -refs 1 -bf 0 -tune fastdecode -filter:v "fps=30" -pix_fmt yuv420p \
  "${outputDir}/${name}.mp4"
done
