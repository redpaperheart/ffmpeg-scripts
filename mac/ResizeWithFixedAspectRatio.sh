# outputDir="resized_768"
# mkdir -p $outputDir
outputDir="./../${PWD##*/}_libx264_slow_crf_16_ref_1_bf_0_srcfps"
# outputDir="./../_libx264_fast_crf_18_ref_1_bf_0_ifps"
mkdir -p $outputDir

# for i in *.mp4;
for i in *.*;
  do name=`echo "${i}" | cut -d'.' -f1`
  echo "$name"

  # flag `-an` removes audio
  # "scale=-1:960, crop=768:960:576:0"
  # scale=768:-1
  # ffmpeg -i input -c:v libx264 -preset slow -crf 22 -c:a copy output.mkv
  # ffmpeg -i "$i" -vf scale=768:-1 -c:v libx264 -preset veryfast -tune fastdecode -crf 18 -an "${outputDir}/${name}"
  ffmpeg -i "$i" \
  -vf scale=768:-1 -c:v libx264 -preset slow -crf 16 -refs 1 -bf 0 -tune fastdecode -pix_fmt yuv420p -an\
  "${outputDir}/${name}"
  # -filter:v "fps=30"
done
