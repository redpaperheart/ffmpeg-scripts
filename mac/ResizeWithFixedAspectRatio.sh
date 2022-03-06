outputDir="resized_768"
mkdir -p $outputDir

# for i in *.mp4;
for i in *.*;
  do name=`echo "${i}"` # | cut -d'.' -f1`
  echo "$name"

  # flag `-an` removes audio
  # "scale=-1:960, crop=768:960:576:0"
  # scale=768:-1
  ffmpeg -i "$i" -vf scale=768:-1 -an "${outputDir}/${name}"
done
