moskidelfin$Drzava.prvenstva <- gsub(".*, ", "", moskidelfin$Kraj.prvenstva)
moskidelfin$Drzava.prvenstva[grep("Germany", moskidelfin$Drzava.prvenstva)] <- "Germany"
moskidelfin$Drzava.prvenstva[grep("USSR", moskidelfin$Drzava.prvenstva)] <- "Russia"
moskidelfin$Drzava.prvenstva[grep("USA", moskidelfin$Drzava.prvenstva)] <- "United States"
rekordi <- table(moskidelfin$Drzava.prvenstva)
pdf("slike/moskidelfin.pdf") #naslov pdfja
pie(rekordi, cex = 0.5, main = "Moški delfin: Države doseženih rekordov", col=rainbow(13))

dev.off()
