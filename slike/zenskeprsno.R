cairo_pdf("slike/zenskeprsno.pdf", family = "Arial")
zenskeprsno$Drzava.prvenstva <- gsub(".*, ", "", zenskeprsno$Kraj.prvenstva)
zenskeprsno$Drzava.prvenstva[grep("Germany", zenskeprsno$Drzava.prvenstva)] <- "Nemčija"
zenskeprsno$Drzava.prvenstva[grep("Soviet Union", zenskeprsno$Drzava.prvenstva)] <- "Rusija"
zenskeprsno$Drzava.prvenstva[grep("United States", zenskeprsno$Drzava.prvenstva)] <- "Združene države Amerike"
zenskeprsno$Drzava.prvenstva[grep("Washington", zenskeprsno$Drzava.prvenstva)] <- "Združene države Amerike"
zenskeprsno$Drzava.prvenstva[grep("France", zenskeprsno$Drzava.prvenstva)] <- "Francija"
zenskeprsno$Drzava.prvenstva[grep("Canada", zenskeprsno$Drzava.prvenstva)] <- "Kanada"
zenskeprsno$Drzava.prvenstva[grep("Switzerland", zenskeprsno$Drzava.prvenstva)] <- "Švica"
zenskeprsno$Drzava.prvenstva[grep("Spain", zenskeprsno$Drzava.prvenstva)] <- "Španija"
zenskeprsno$Drzava.prvenstva[grep("Italy", zenskeprsno$Drzava.prvenstva)] <- "Italija"
zenskeprsno$Drzava.prvenstva[grep("South Africa", zenskeprsno$Drzava.prvenstva)] <- "Južnoafriška Republika"
zenskeprsno$Drzava.prvenstva[grep("Austria", zenskeprsno$Drzava.prvenstva)] <- "Avstrija"
zenskeprsno$Drzava.prvenstva[grep("Australia", zenskeprsno$Drzava.prvenstva)] <- "Avstralija"
zenskeprsno$Drzava.prvenstva[grep("Yugoslavia", zenskeprsno$Drzava.prvenstva)] <- "Hrvaška"
rekordi <- table(zenskeprsno$Drzava.prvenstva)



pie(rekordi, main = "Ženske prsno: države rekorderjev", cex.main = 1.5, cex=0.8, col=terrain.colors(13))
dev.off()