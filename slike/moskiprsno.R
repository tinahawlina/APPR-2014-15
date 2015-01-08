moskiprsno$Drzava.prvenstva <- gsub(".*, ", "", moskiprsno$Kraj.prvenstva)
moskiprsno$Drzava.prvenstva[grep("Germany", moskiprsno$Drzava.prvenstva)] <- "Germany"
moskiprsno$Drzava.prvenstva[grep("USSR", moskiprsno$Drzava.prvenstva)] <- "Russia"
moskiprsno$Drzava.prvenstva[grep("USA", moskiprsno$Drzava.prvenstva)] <- "United States"
rekordi <- table(moskiprsno$Drzava.prvenstva)
pdf("slike/moskiprsno.pdf") #naslov pdfja
pie(rekordi, main = "Moški prsno: države rekorderjev", cex.main = 1.5, cex=0.8, col=topo.colors(13))
dev.off()
