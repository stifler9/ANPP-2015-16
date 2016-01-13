# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv



# Zapišimo podatke v razpredelnico
require(csvread)

podatki <- read.csv(file = "LaLiga.csv")
require(rmarkdown)
require(shiny)
names(podatki)[4] <- "Wins"
names(podatki)[5] <- "Draws"
names(podatki)[6] <- "Loses"
names(podatki)[7] <- "Goal Difference"
names(podatki)[7] <- "Goals For"
names(podatki)[8] <- "Goals Against"
names(podatki)[9] <- "Goal Difference"
names(podatki)[10] <- "Points"
podatki$Qualification.or.relegation <- NULL
names(podatki)[1] <- "Position"
names(podatki)[3] <- "Played"
podatki$'Win/Lose' <- round(podatki$Wins/podatki$Loses,2)
podatki$'Goals per match' <- round((podatki$`Goals For`+podatki$`Goals Against`)/podatki$Played,2)
podatki$'Draw percentage' <- round((podatki$Draws/podatki$Played)*100, 2)
summary(podatki)
fillgolrazlika <- c(podatki$`Goal Difference` + 50)
pozicije <- read.csv(file="podatki/LaLiga_pozicije.csv", encoding = "Windows-1250")
pozicije$povprečna <- round((pozicije$X1 + pozicije$X2 + pozicije$X3 + pozicije$X4 + pozicije$X5 + pozicije$X6 + pozicije$X7 + pozicije$X8 + pozicije$X9 + pozicije$X10 + pozicije$X11 + pozicije$X12 + pozicije$X13 + pozicije$X14 + pozicije$X15 + pozicije$X16 + pozicije$X17 + pozicije$X18 + pozicije$X19 + pozicije$X20 + pozicije$X21 + pozicije$X22 + pozicije$X23 + pozicije$X24 + pozicije$X25 + pozicije$X26 + pozicije$X28 + pozicije$X29 + pozicije$X30 + pozicije$X31 + pozicije$X32 + pozicije$X33 + pozicije$X34 + pozicije$X35 + pozicije$X36 + pozicije$X37 + pozicije$X38)/38,2)


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.