cairo_pdf("slike/moskidelfin.pdf", family = "Arial")
moskidelfin$Drzava.prvenstva <- gsub(".*, ", "", moskidelfin$Kraj.prvenstva)
moskidelfin$Drzava.prvenstva[grep("Germany", moskidelfin$Drzava.prvenstva)] <- "Nemčija"
moskidelfin$Drzava.prvenstva[grep("United States", moskidelfin$Drzava.prvenstva)] <- "Združene države Amerike"
moskidelfin$Drzava.prvenstva[grep("Italy", moskidelfin$Drzava.prvenstva)] <- "Italija"
moskidelfin$Drzava.prvenstva[grep("Japan", moskidelfin$Drzava.prvenstva)] <- "Japonska"
moskidelfin$Drzava.prvenstva[grep("Brazil", moskidelfin$Drzava.prvenstva)] <- "Brazilija"
moskidelfin$Drzava.prvenstva[grep("Austria", moskidelfin$Drzava.prvenstva)] <- "Avstrija"
moskidelfin$Drzava.prvenstva[grep("Australia", moskidelfin$Drzava.prvenstva)] <- "Avstralija"
moskidelfin$Drzava.prvenstva[grep("Canada", moskidelfin$Drzava.prvenstva)] <- "Kanada"
moskidelfin$Drzava.prvenstva[grep("Hungary", moskidelfin$Drzava.prvenstva)] <- "Madžarska"
moskidelfin$Drzava.prvenstva[grep("Spain", moskidelfin$Drzava.prvenstva)] <- "Španija"
rekordi <- table(moskidelfin$Drzava.prvenstva)

pie(rekordi, cex = 0.7, main = "Moški delfin: Države doseženih rekordov", col=rainbow(13))

dev.off()
