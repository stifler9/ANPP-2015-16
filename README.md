# Analiza La Lige

Avtor: Žan Šifrer

Mentor: Janoš Vidali

Odločil sem se, da naredim analizo podatkov španske nogometne La Lige. Naredil bom analizo v letu 2014/15.

## Cilj

Cilj je narediti različne analize ekip med seboj (koliko točk so dosegli, koliko je bilo od tega zmag in tudi kakšne so bile zmage ali porazi in gol razlike, katere ekipe več tvegajo, dosegajo več golov na tekmo, katere so bolj odvisne od tega ali igrajo doma ali v gosteh, ...). 

Podatke si bom pridobil na spletu:

* http://www.soccerstats.com/latest.asp?league=spain_2015
* https://en.wikipedia.org/wiki/2014%E2%80%9315_La_Liga

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Spletni vmesnik

Spletni vmesnik se nahaja v datotekah v mapi `shiny/`. Poženemo ga tako, da v
RStudiu odpremo datoteko `server.R` ali `ui.R` ter kliknemo na gumb *Run App*.
Alternativno ga lahko poženemo tudi tako, da poženemo program `shiny.r`.

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `httr` - za pobiranje spletnih strani
* `XML` - za branje spletnih strani
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
