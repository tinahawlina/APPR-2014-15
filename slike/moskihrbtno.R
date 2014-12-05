
pdf("slike/moskihrbtno.pdf") #naslov pdfja
pie(moskihrbtno[,"Čas"], labels = gsub(" ", "\n", moskihrbtno[,1]))
text(0,1,"Moski hrbtno", cex =2)
dev.off()