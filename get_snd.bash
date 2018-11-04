#!/usr/bin/env bash
set -euo pipefail
cd $(dirname $0)

[ ! -d snd ] && mkdir snd
grep -v '^$'  txt/fa_words_mp3.txt |
while IFS=$'\t' read farsi mp3link; do
   echo $farsi
   curl -L "$mp3link" > "snd/$farsi.mp3"
   sleep 2
done 
