# 1000 common words Farsi -> english w/ pronunciations
  * list from http://1000mostcommonwords.com/1000-most-common-persian-words/
  * latinzed using http://mylanguages.org/farsi_romanization.php
  * sounds from https://forvo.com/
## build:
 see [`Makefile`](./Makefile)

## Anki

```
cp snd/*mp3 ~/.local/share/Anki2/User\ 1/collection.media/
```
## Scaping forvo
using [forvo](forvo.com)
```
#for 'عنوان'
https://forvo.com/search/%D8%B9%D9%86%D9%88%D8%A7%D9%86/fa/
$ Play(1177164,'OTEzNjg4NC80NC85MTM2ODg0XzQ0XzMyNTE4OV8xOTkzMTYubXAz','OTEzNjg4NC80NC85MTM2ODg0XzQ0XzMyNTE4OV8xOTkzMTYub2dn',false,'ai82L2o2XzkxMzY4ODRfNDRfMzI1MTg5XzE5OTMxNi5tcDM=','ai82L2o2XzkxMzY4ODRfNDRfMzI1MTg5XzE5OTMxNi5vZ2c=','h')
is 
$ echo mplayer $(perl -MMIME::Base64 -e 'print "https://audio00.forvo.com/mp3/".decode_base64("OTEzNjg4NC80NC85MTM2ODg0XzQ0XzMyNTE4OV8xOTkzMTYubXAz")' )
mplayer https://audio00.forvo.com/mp3/9136884/44/9136884_44_325189_199316.mp3

```
