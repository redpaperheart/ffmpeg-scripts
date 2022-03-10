outputDir="./../${PWD##*/}_libx264_slow_crf_16_ref_1_bf_0_srcfps"
mkdir -p $outputDir

for i in *.*;
  do name=`echo "${i}" | cut -d'/' -f1`
  echo "$name"
  # flag `-an` removes audio
  # resize scale=768:-1
  # ffmpeg -i "$i" -vf scale=500:-1  -an -c:v libx264 -pix_fmt yuv420p "${name}.mp4"
  # -vf scale=768:-1 \
  ffmpeg -i "$i" \
  -c:v libx264 -preset slow -crf 16 -refs 1 -bf 0 -tune fastdecode -pix_fmt yuv420p -an \
  "${outputDir}/${name}.mp4"
done
