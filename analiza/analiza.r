# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")

cat("Rišem graf za ženske v plavanju, tehnika delfin...\n")
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

cairo_pdf("slike/grafzenske.pdf", width = 7.27, height = 5.69, family = "Arial")
pdf.options(encoding='ISOLatin2.enc')
Sys.setlocale("LC_TIME", "C")
cas.z <- zenskedelfin$Čas
datum.z <- names(table(zenskedelfin$Datum))
leto.z <- gsub(".*, ", "", datum.z)
names(leto.z) <- datum.z
datum.z1 <- as.Date(zenskedelfin$Datum, "%b %d, %Y")
plot(datum.z1, cas.z, xlim = as.Date(c("1957-08-04", "2050-12-31")), ylim = c(55.98, 70.5),
     main = "Postavitve rekordov v času", 
     xlab = "Letnica postavitve rekorda", ylab = "Čas v sekundah", type = "h", lwd = 3, col="slategrey")

 
#gledam datume, ki so pred letom 1970
novdatum.z <- datum.z1[datum.z1 < as.Date("1970-08-20")]
zacetek.z <- min(datum.z1)
datt.z <- as.numeric(datum.z1 - zacetek.z)

#Regresijske metode
#Linearna metoda
datumi.z.napoved <- as.Date(paste(1959:2050, 1, 1, sep = "-")) 
linearna.z <- lm(cas.z ~ datt.z)
lines(datumi.z.napoved,
      predict(linearna.z, data.frame(datt.z=as.numeric(datumi.z.napoved - zacetek.z))),
      col = "yellow")

#Eksponentna metoda
logcas.z <- log(cas.z)
llin.z <- lm(logcas.z ~ datt.z)
lines(datumi.z.napoved,
      exp(predict(llin.z, data.frame(datt.z=as.numeric(datumi.z.napoved-zacetek.z)))),
      col = "blue")

legend("topright", c("Linearna metoda", 
                     "Eksponentna metoda"),lty=c(1,1,1),
       col = c("yellow", "blue"))

#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen
vsotakvadratov.z <- sapply(list(linearna.z, llin.z), function(x) sum(x$residuals^2))
# 101.80453445   0.02299152  11.06541946   3.53098844

dev.off()

cat("Rišem graf za moške v plavanju, tehnika delfin...\n")
cairo_pdf("slike/grafmoski.pdf", width = 7.27, height = 5.69, family = "Arial")
pdf.options(encoding='ISOLatin2.enc')
Sys.setlocale("LC_TIME", "C")
cas.m <- moskidelfin$Čas
datum.m <- names(table(moskidelfin$Datum))
leto.m <- gsub(".*, ", "", datum.m)
names(leto.m) <- datum.m
datum.m1 <- as.Date(moskidelfin$Datum, "%b %d, %Y")
plot(datum.m1, cas.m, xlim = as.Date(c("1957-05-26", "2050-12-31")), ylim = c(49.82, 63.4),
     main = "Postavitve rekordov v času", 
     xlab = "Letnica postavitve rekorda", ylab = "Čas v sekundah", type = "h", lwd = 3, col="slategrey")

#gledam datume, ki so pred letom 1962
novdatum.m <- datum.m1[datum.m1 < as.Date("1962-04-20")]
zacetek.m <- min(datum.m1)
dat2.m <- as.numeric(datum.m1 - zacetek.m)

#Regresijske metode
#Linearna metoda
datumi.m.napoved <- as.Date(paste(1959:2050, 1, 1, sep = "-")) # leta, za katera napovedujemo
linearna.m <- lm(cas.m ~ dat2.m)
lines(datumi.m.napoved,
      predict(linearna.m, data.frame(dat2.m=as.numeric(datumi.m.napoved - zacetek.m))),
      col = "yellow")

#Eksponentna metoda
logcas.m <- log(cas.m)
llin.m <- lm(logcas.m ~ dat2.m)
lines(datumi.m.napoved,
      exp(predict(llin.m, data.frame(dat2.m=as.numeric(datumi.m.napoved-zacetek.m)))),
      col = "blue")


#Loess metoda
loes.m <- loess(cas.m ~ dat2.m)
lines(datumi.m.napoved,
      predict(loes.m, data.frame(dat2.m=as.numeric(datumi.m.napoved-zacetek.m))),
      col = "red")


legend("topright", c("Linearna metoda", 
                     "Eksponentna metoda", "Loess"),lty=c(1,1,1),
       col = c("yellow", "blue", "red"))

#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen
vsotakvadratov.m <- sapply(list(linearna.m, llin.m, loes.m), function(x) sum(x$residuals^2))
# 72.36911869  0.01993318  8.93211158  
dev.off()