rm -fr /tmp/clip/ && mkdir /tmp/clip/

# crop&resize 3x4 frames to 16x9 1280x720
for i in *.JPG  ; do convert -verbose $i -strip -resample 72x72 -crop x1386+0+100 -resize 1280x  /tmp/clip/$i ; done

# renaming frames to 0000.jpg, 0001.jpg, ...
python -c "import os, glob; [os.rename(f, '/tmp/clip/{0:04d}.jpg'.format(n)) for n, f in enumerate(sorted(glob.glob('/tmp/clip/*.JPG')))]"

# frames2video
ffmpeg -r 25 -i /tmp/clip/%04d.jpg -b 8M  ~/Desktop/test.mp4