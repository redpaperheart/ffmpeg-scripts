outputDir="resized_768"
mkdir -p $outputDir

# for i in *.mp4;
for i in *.*;
  do name=`echo "${i}"` # | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" -vf scale=768:-1 "${outputDir}/${name}"
done
