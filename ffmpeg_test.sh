ffmpeg -i big_bunny_1min_30fps.mp4 \
  -c:v libx265 -tag hvc1\
  -an \
  -f hls \
  -hls_time 10 \
  -hls_playlist_type vod \
  -hls_segment_type fmp4 \
  -hls_fmp4_init_filename init_hvc1.mp4 \
  -hls_segment_filename "0/index_hvc1_%03d.m4s" \
  0/index_hvc1.m3u8

ffmpeg -i big_bunny_1min_30fps.mp4 \
  -vn \
  -c:a aac -b:a 128k \
  -f hls \
  -hls_time 10 \
  -hls_playlist_type vod \
  -hls_segment_filename "1/index_%03d.m4s" \
  1/index.m3u8