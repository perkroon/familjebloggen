
# List all files ina path that contains a specific string
grep -Rnwl posts/2009 -e "date: 2009-01"

# Lista alla filnamn som matchar <img src="../../../../img/_MG_9804_1024pix.jpg"> i en viss katalog
# som är för en viss månad
grep -Rnwl posts/2009 -e "date: 2009-01" | xargs grep "src=\".." | cut -d: -f2 | cut -d/ -f6 | cut -d'"' -f1

while read line; do; echo $line; done


for i in $(cat list.txt); do echo $i; done



-----------
# Sök efter datum i inläggen för att hitta alla för en viss månad:
Söksträng (regex): date: 2009-12-\d\d.*
I varje fil, byt sedan t.ex. så här:
Från: ../../../../img/
Till: ../../../img/2009/12/

