#!/bin/sh

SRC_DIR ="DUMP_PCM"

echo "convert .pcm to .wav"


max_jobs=20
job_cnt=0

for filename in `find $SRC_DIR -name "*.pcm"`
do
		echo "$filename"
		out_wav="${filename%.*}"".wav"
		echo "$out_wav"
                echo "sox -r 16000 -b 16  -e signed-integer  src.pcm tgt.wav &"
		sox -t raw -b 16 -e signed-integer -r 16000 ${filename} ${out_wav} &
		#sox -r 16000 -b 16 -e signed-integer ${filename} ${out_wav} &
             

                if (( $(($((++job_cnt)) % $max_jobs)) == 0 )) ; then
                        wait
                        echo $job_cnt wait
                fi
done

