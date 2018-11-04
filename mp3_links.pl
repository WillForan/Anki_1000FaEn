#!/usr/bin/env perl
use strict; use warnings;
use feature 'say';

use MIME::Base64; 
use ojo; 
use utf8::all;

open my $in ,"<", "txt/fa_words_forvo.txt";
open my $out,">", "txt/fa_words_mp3.txt";
#print $fh "farsi\tlink\n";

while($_=<$in>){
   print STDERR "looking up: $_";
   chomp;
   my @F=split /\t/;
   my $i=0;
   my $sounds =
      g($F[1])->
      dom("span.play")->
      map(
       sub{ 
         $_=(split(/,/, $_->attr("onclick") ))[1];
         s/'//g;
         join("\t",
            #++$i,
            $F[0],
            "https://audio00.forvo.com/mp3/".decode_base64($_));
         })->to_array;

   my $line=$sounds->[0];
   print $out "$line\n";
   print STDERR "$line\n";
   sleep(2);
}
