alias fixnewlines="perl -pe 's/\r\n/\n/g; s/\r/\n/g;'"
alias latin1toutf8="iconv -f iso-8859-1 -t utf-8"
alias macromantoutf8="iconv -f macroman -t utf-8"
alias utf8tolatin1="iconv -f utf-8 -t iso-8859-1"
alias win1252toutf8="iconv -f windows-1252 -t utf-8"
alias utf8towin1252="iconv -f utf-8 -t windows-1252"
alias adrianify='perl -p -e "s/,\d+\.png.+//"'
alias nbsptospace="perl -pe 's/\xc2\xa0/ /g'"
alias normalisewhitespace="perl -pe 's/[ \t]+/ /g'"
alias normalisedashes="perl -pe 's/(\xe2\x80[\x93\x94])/-/g'"
alias normalisefootnotecrap="perl -pe 's/(\xe2\x80\xa0)/*/g'"
alias normalisecsv='perl -MText::CSV -MEncode=decode,encode -pe "\$csv->parse(decode(\'UTF-8\',$_)); \$_=encode(\'UTF-8\',\$csv->combine(map {s/^[ \\t]+//; s/[ \\t]+\$/; } $csv->fields);}BEGIN{\$csv = Text::CSV->new;"'


