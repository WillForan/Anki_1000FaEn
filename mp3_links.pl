#!/usr/bin/env perl
use strict; use warnings;
use feature 'say';

use MIME::Base64; 
use ojo; 

while($_=<STDIN>){
   print STDERR "looking up: $_";
   chomp;
   my @F=split /\t/;
   my $i=0;
   say 
      g($F[1])->
      dom("span.play")->
      map(
       sub{ 
         $_=(split(/,/, $_->attr("onclick") ))[1];
         s/'//g;
         join("\t",
            ++$i,
            $F[0],
            "https://audio00.forvo.com/mp3/".decode_base64($_));
         })->join("\n");
   sleep(2);
}
