zenskedelfin$Drzava.prvenstva <- gsub(".*, ", "", zenskedelfin$Kraj.prvenstva)
zenskedelfin$Drzava.prvenstva[grep("Germany", zenskedelfin$Drzava.prvenstva)] <- "Germany"
zenskedelfin$Drzava.prvenstva[grep("USSR", zenskedelfin$Drzava.prvenstva)] <- "Russia"
zenskedelfin$Drzava.prvenstva[grep("USA", zenskedelfin$Drzava.prvenstva)] <- "United States"
rekordi <- table(zenskedelfin$Drzava.prvenstva)
pdf("slike/zenskedelfin.pdf") #naslov pdfja
pie(rekordi, cex = 0.5, main = "Ženske delfin: Države doseženih rekordov",col=terrain.colors(13))
dev.off()