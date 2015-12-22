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
podatki$'Win/Lose' <- podatki$Wins/podatki$Loses
podatki$'Goals per match' <- (podatki$`Goals For`+podatki$`Goals Against`)/podatki$Played
podatki$'Draw percentage' <- round((podatki$Draws/podatki$Played)*100, 2)
summary(podatki)
fillgolrazlika <- c(podatki$`Goal Difference` + 50)
pozicije <- read.csv(file="podatki/LaLiga_pozicije.csv", encoding = "Windows-1250")


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.