# !/bin/bash 
# create audio and video track
ffmpeg -i big_bunny_1min_30fps.mp4 \
  -c:v hevc_videotoolbox -tag hvc1 -b:v:0 4000k \
  -an \
  -f hls \
  -hls_time 10 \
  -hls_playlist_type vod \
  -hls_segment_type fmp4 \
  -hls_fmp4_init_filename init_hvc1.mp4 \
  -hls_segment_filename "stream_0/index_hvc1_%03d.m4s" \
  stream_0/index_hvc1.m3u8

ffmpeg -i big_bunny_1min_30fps.mp4 \
  -vn \
  -c:a aac -b:a 128k \
  -f hls \
  -hls_time 10 \
  -hls_playlist_type vod \
  -hls_segment_filename "stream_1/index_%03d.m4s" \
  stream_1/index.m3u8