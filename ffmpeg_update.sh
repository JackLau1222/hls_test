lldb ffmpeg -- -i ~/Movies/Taylor_Swift.mp4 \
-s:v:0 1920x1080 -c:a:0 aac -b:a 192k -c:v:0 libx265 -b:v:0 4000k \
-map 0:a -map 0:v \
-var_stream_map "v:0,a:0" -threads 0 -f hls \
-movflags frag_keyframe -hls_flags single_file -hls_segment_type mpegts \
-hls_list_size 0 -hls_time 2 -hls_allow_cache 1 -master_pl_name index1.m3u8 -y -tag:v:0 hvc1 -t 1  master_%v.m3u8

