.PHONY all: txt/fa_words_mp3.txt txt/letter_rank.txt

txt/fa_words.html:
	mkdir txt
	curl http://1000mostcommonwords.com/1000-most-common-persian-words/ > txt/fa_words.html

txt/fa_words.txt: txt/fa_words.html
	grep '<td>' txt/fa_words.html | paste - - - | sed 's:</\?td>::g;s/ +/\t/g' > txt/fa_words.txt

txt/fa_words_forvo.txt: txt/fa_words.txt
	perl -F"\t" -Mutf8::all -MURI::Encode=uri_encode -slane 'print $$F[1],"\thttps://forvo.com/search/",uri_encode($$F[1]),"/fa"'  txt/fa_words.txt > txt/fa_words_forvo.txt

txt/fa_words_mp3.txt: txt/fa_words_forvo.txt
	#perl -MMIME::Base64 -Mojo -F"\t" -nE 'chomp($$F[1]);my $$i=0; say g($$F[1])->dom("span.play")->map(sub{ $$_=(split(/,/, $$_->attr("onclick") ))[1];s/'\''//g; ++$$i."\t$$F[0]\thttps://audio00.forvo.com/mp3/".decode_base64($$_) })->join("\n");sleep(2)' txt/fa_words_forvo.txt  | tee txt/fa_words_mp3.txt
	./mp3_links.pl < txt/fa_words_forvo.txt > txt/fa_words_mp3.txt

txt/letter_rank.txt: txt/fa_words.txt
	 cut -f2 fa_words.txt |sed 's/\(.\)/\1\n/g'|grep -v '^$'|sort |uniq -c |sort -nr > letter_rank.txt

txt/anki.tsv: txt/fa_words.txt 
	bash -c 'join -t"	" -1 2 -2 1 txt/fa_words.txt <(cut -f2 txt/fa_words.txt |./latinze.js) > txt/anki.tsv' 


