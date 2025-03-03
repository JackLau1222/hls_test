ffmpeg -i big_bunny_1min_30fps.mp4 \
  -map 0:v -c:v libx265 -preset medium -tag:v hvc1  \
  -map 0:a -c:a aac -b:a 128k \
  -f hls \
  -hls_time 10 \
  -hls_playlist_type vod \
  -hls_segment_type fmp4 \
  -hls_fmp4_init_filename init_hvc1.mp4 \
  -hls_segment_filename "stream_%v/segment_%03d.m4s" \
  -var_stream_map "v:0,a:0" \
  -master_pl_name master.m3u8 \
  "stream_%v/playlist.m3u8"
