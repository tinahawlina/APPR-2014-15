cairo_pdf("slike/zenskedelfin.pdf", family = "Arial")
zenskedelfin$Drzava.prvenstva <- gsub(".*, ", "", zenskedelfin$Kraj.prvenstva)
zenskedelfin$Drzava.prvenstva[grep("Germany", zenskedelfin$Drzava.prvenstva)] <- "Nemčija"
zenskedelfin$Drzava.prvenstva[grep("USSR", zenskedelfin$Drzava.prvenstva)] <- "Rusija"
zenskedelfin$Drzava.prvenstva[grep("United States", zenskedelfin$Drzava.prvenstva)] <- "Združene države Amerike"
zenskedelfin$Drzava.prvenstva[grep("Australia", zenskedelfin$Drzava.prvenstva)] <- "Avstralija"
zenskedelfin$Drzava.prvenstva[grep("Austria", zenskedelfin$Drzava.prvenstva)] <- "Avstrija"
zenskedelfin$Drzava.prvenstva[grep("Colombia", zenskedelfin$Drzava.prvenstva)] <- "Kolumbija"
zenskedelfin$Drzava.prvenstva[grep("Canada", zenskedelfin$Drzava.prvenstva)] <- "Kanada"
zenskedelfin$Drzava.prvenstva[grep("Netherlands", zenskedelfin$Drzava.prvenstva)] <- "Nizozemska"
zenskedelfin$Drzava.prvenstva[grep("United Kingdom", zenskedelfin$Drzava.prvenstva)] <- "Velika Britanija"
zenskedelfin$Drzava.prvenstva[grep("Italy", zenskedelfin$Drzava.prvenstva)] <- "Italija"
zenskedelfin$Drzava.prvenstva[grep("Hungary", zenskedelfin$Drzava.prvenstva)] <- "Madžarska"
zenskedelfin$Drzava.prvenstva[grep("Japan", zenskedelfin$Drzava.prvenstva)] <- "Japonska"

rekordi <- table(zenskedelfin$Drzava.prvenstva)
pie(rekordi, cex = 0.5, main = "Ženske delfin: Države doseženih rekordov",col=terrain.colors(13))
dev.off()