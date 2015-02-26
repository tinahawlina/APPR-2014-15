# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")

cat("Uvažam podatke iz tabel za ženske in moške v plavanju...\n")
# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()

pdf("slike/grafzenske.pdf")
pdf.options(encoding='ISOLatin2.enc')
Sys.setlocale("LC_TIME", "C")
cas <- zenskedelfin$Čas
datum <- names(table(zenskedelfin$Datum))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(c(as.Date(zenskedelfin$Datum, "%b %d, %Y")), cas,
     main = "Postavitve rekordov v času", 
     xlab = "Letnica postavitve rekorda", ylab = "Čas v sekundah", type = "h", lwd = 5, col="violet")
dev.off()

pdf("slike/grafmoski.pdf")
pdf.options(encoding='ISOLatin2.enc')
Sys.setlocale("LC_TIME", "C")
cas <- moskidelfin$Čas
datum <- names(table(moskidelfin$Datum))
leto <- gsub(".*, ", "", datum)
names(leto) <- datum
plot(c(as.Date(moskidelfin$Datum, "%b %d, %Y")), cas,
     main = "Postavitve rekordov v času", 
     xlab = "Letnica postavitve rekorda", ylab = "Čas v sekundah", type = "h", lwd = 5, col="darkgreen")
dev.off()