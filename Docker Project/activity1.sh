#!/bin/bash
touch song{1..6}.mp3
touch snap{1..6}.jpg
touch film{1..6}.mp4

chmod 777 *.mp3 *.jpg *.mp4
mkdir Music Pictures Videos

mv *.mp3 Music/
mv *.jpg Pictures/
mv *.mp4 Videos/
