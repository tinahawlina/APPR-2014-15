pdf("slike/moskihrbtno.pdf") #naslov pdfja
pie(table(moskihrbtno[,"Ime"]), main = "Moški hrbtno", cex.main = 1.5)
#text(0,1,"Moški hrbtno", cex =2)
dev.off()