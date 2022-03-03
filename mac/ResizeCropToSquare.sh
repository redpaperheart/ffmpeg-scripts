outputDir="resizeCropped_300"
mkdir -p $outputDir

# for i in *.mp4;
for i in *.*;
  do name=`echo "${i}"` # | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" -vf "crop=w='min(iw\,ih)':h='min(iw\,ih)',scale=300:300,setsar=1" "${outputDir}/${name}"

done
