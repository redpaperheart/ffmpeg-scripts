for i in *.*;
  do name=`echo "${i}" | cut -d'/' -f1`
  echo "$name"
  # flag `-an` removes audio
  # resize scale=768:-1
  ffmpeg -i "$i" -vf scale=500:-1  -an -c:v libx264 -pix_fmt yuv420p "${name}.mp4"
done
