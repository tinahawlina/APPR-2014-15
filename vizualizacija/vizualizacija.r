# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

# drzave <- match(svet$name, c("Hungary", "United States","Germany", "France", "Australia", "Brazil", "South Africa", "Russia", "Netherlands"))
# barve <- apply(apply(moskiprosto, ))
drzavljanstvo <- table(moskiprosto$Nationality)
rekordi <- unique(drzavljanstvo)
rekordi <- rekordi[order(rekordi)]
barve <- rgb(1, 0, 0, match(drzavljanstvo, rekordi)/length(drzavljanstvo))
names(barve) <- names(drzavljanstvo)

cat("Rišem zemljevid...\n")
pdf("slike/moskiprosto_svet.pdf")

plot(svet, col = barve[as.character(svet$name_long)])

dev.off()

# gsub(", .*", "", moskiprsno$Kraj.prvenstva)
# # Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
# preuredi <- function(podatki, zemljevid) {
#   nove.obcine <- c()
#   manjkajo <- ! nove.obcine %in% rownames(podatki)
#   M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#   names(M) <- names(podatki)
#   row.names(M) <- nove.obcine[manjkajo]
#   podatki <- rbind(podatki, M)
#   
#   out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
#   if (ncol(podatki) == 1) {
#     out <- data.frame(out)
#     names(out) <- names(podatki)
#     rownames(out) <- rownames(podatki)
#   }
#   return(out)
# }
# 
# # Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
# druzine <- preuredi(druzine, obcine)
# 
# # Izračunamo povprečno velikost družine.
# druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
# min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
# max.povprecje <- max(druzine$povprecje, na.rm=TRUE)
# 
# # Narišimo zemljevid v PDF.
# cat("Rišem zemljevid...\n")
# pdf("slike/povprecna_druzina.pdf", width=6, height=4)
# 
# n = 100
# barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
# plot(obcine, col = barve)
# 
# dev.off()