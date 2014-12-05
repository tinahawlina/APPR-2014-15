# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozimoskihrbtno <- function() {
  return(read.csv2("podatki/moskihrbtno.csv", sep = ";",
                      fileEncoding = "Windows-1250"
                    ))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih na moski, 100 m, hrbtno ...\n")
moskihrbtno <- uvozimoskihrbtno()



# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozizenskehrbtno <- function() {
  return(read.csv2("podatki/zenskehrbtno.csv", sep = ";",
                   fileEncoding = "Windows-1250"
  ))
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih zenske, 100 m, hrbtno ...\n")
zenskehrbtno <- uvozizenskehrbtno()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozimoskiprsno <- function() {
  return(read.csv2("podatki/moskiprsno.csv", sep = ";",
                   fileEncoding = "Windows-1250"
  ))
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih moski, 100 m, prsno ...\n")
moskiprsno <- uvozimoskiprsno()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozizenskeprsno <- function() {
  return(read.csv2("podatki/zenskeprsno.csv", sep = ";",
                   fileEncoding = "Windows-1250"
  ))
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih zenske, 100 m, prsno ...\n")
zenskeprsno <- uvozizenskeprsno()

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvozimoskidelfin <- function() {
  return(read.csv2("podatki/moskidelfin.csv", sep = ";",
                   fileEncoding = "Windows-1250"
  ))
}
# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o rekordih moski, 100 m, delfin ...\n")
moskidelfin <- uvozimoskidelfin()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.