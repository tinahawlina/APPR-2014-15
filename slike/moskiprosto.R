pdf("slike/moskiprosto.pdf")
plot(prevedi(moskiprosto[,3]), main="Moški prosto: rekorderji po državah",
     ylab="rekorderji po državah", col="darkseagreen2",las=2, cex.names=0.4)

dev.off()