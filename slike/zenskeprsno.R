zenskeprsno$Drzava.prvenstva <- gsub(".*, ", "", zenskeprsno$Kraj.prvenstva)
zenskeprsno$Drzava.prvenstva[grep("Germany", zenskeprsno$Drzava.prvenstva)] <- "Germany"
zenskeprsno$Drzava.prvenstva[grep("USSR", zenskeprsno$Drzava.prvenstva)] <- "Russia"
zenskeprsno$Drzava.prvenstva[grep("USA", zenskeprsno$Drzava.prvenstva)] <- "United States"
rekordi <- table(zenskeprsno$Drzava.prvenstva)


pdf("slike/zenskeprsno.pdf") #naslov pdfja
pie(rekordi, main = "Ženske prsno: države rekorderjev", cex.main = 1.5, cex=0.8, col=terrain.colors(13))
dev.off()