cairo_pdf("slike/moskiprsno.pdf", family = "Arial")
moskiprsno$Drzava.prvenstva <- gsub(".*, ", "", moskiprsno$Kraj.prvenstva)
moskiprsno$Drzava.prvenstva[grep("Germany", moskiprsno$Drzava.prvenstva)] <- "Nemčija"
moskiprsno$Drzava.prvenstva[grep("Soviet Union", moskiprsno$Drzava.prvenstva)] <- "Rusija"
moskiprsno$Drzava.prvenstva[grep("Russia", moskiprsno$Drzava.prvenstva)] <- "Rusija"
moskiprsno$Drzava.prvenstva[grep("United States", moskiprsno$Drzava.prvenstva)] <- "Združene države Amerike"
moskiprsno$Drzava.prvenstva[grep("Italy", moskiprsno$Drzava.prvenstva)] <- "Italija"
moskiprsno$Drzava.prvenstva[grep("Japan", moskiprsno$Drzava.prvenstva)] <- "Japonska"
moskiprsno$Drzava.prvenstva[grep("Greece", moskiprsno$Drzava.prvenstva)] <- "Grčija"
moskiprsno$Drzava.prvenstva[grep("Yugoslavia", moskiprsno$Drzava.prvenstva)] <- "Srbija"
moskiprsno$Drzava.prvenstva[grep("UK", moskiprsno$Drzava.prvenstva)] <- "Velika Britanija"
moskiprsno$Drzava.prvenstva[grep("United Kingdom", moskiprsno$Drzava.prvenstva)] <- "Velika Britanija"
moskiprsno$Drzava.prvenstva[grep("Canada", moskiprsno$Drzava.prvenstva)] <- "Kanada"
moskiprsno$Drzava.prvenstva[grep("Spain", moskiprsno$Drzava.prvenstva)] <- "Španija"
moskiprsno$Drzava.prvenstva[grep("Sweden", moskiprsno$Drzava.prvenstva)] <- "Švedska"
moskiprsno$Drzava.prvenstva[grep("China", moskiprsno$Drzava.prvenstva)] <- "Kitajska"
moskiprsno$Drzava.prvenstva[grep("Australia", moskiprsno$Drzava.prvenstva)] <- "Avstralija"
moskiprsno$Drzava.prvenstva[grep("New Zealand", moskiprsno$Drzava.prvenstva)] <- "Nova Zelandija"
moskiprsno$Drzava.prvenstva[grep("Brazil", moskiprsno$Drzava.prvenstva)] <- "Brazilija"
rekordi <- table(moskiprsno$Drzava.prvenstva)

pie(rekordi, main = "Moški prsno: države rekorderjev", cex.main = 1.5, cex=0.7, col=topo.colors(13))
dev.off()
