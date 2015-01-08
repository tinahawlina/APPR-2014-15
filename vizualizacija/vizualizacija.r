 # 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

preuredi <- function(podatki, zemljevid) {
  nove.svet <- c()
  manjkajo <- ! nove.svet %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.svet[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}


#prvi zemljevid 

#Zemljevid narišem v PDF
cat("Rišem zemljevid...\n")
pdf("slike/moskiprosto_svet.pdf")



drzavljanstvo <- table(moskiprosto$Nationality)
rekordi <- unique(drzavljanstvo)
rekordi <- rekordi[order(rekordi)]
barve <- rgb(0, 0, 1, match(drzavljanstvo, rekordi)/length(drzavljanstvo))
names(barve) <- names(drzavljanstvo)
plot(svet, col = barve[as.character(svet$name_long)])
title("Rekordi po državljanstvu")
legend("left", legend = rekordi, fill = rgb(0, 0, 1, (1:length(rekordi))/length(rekordi)), cex = 0.7)
imena <- c("Washington", "Canberra", "Paris","Brasilia")
mesta <- data.frame("long" = c(-77.03, 149.12, 2.35, -47.88), "lat"= c(38.90, -35.28, 48.85,  -15.79))
points(coordinates(mesta[c("long", "lat")]), col="black", cex=0.7)
dev.off()

#spremenim Nemčijo, Sovjetsko unijo
# moskidelfin$Kraj.prvenstva[(gsub(".*, ", "", moskidelfin$Kraj.prvenstva) == "West Germany"] <- "Germany"

# drugi zemljevid
#Zemljevid narišem v PDF
cat("Rišem zemljevid...\n")
pdf("slike/moskidelfin_svet.pdf")

moskidelfin$Drzava.prvenstva <- gsub(".*, ", "", moskidelfin$Kraj.prvenstva)
moskidelfin$Drzava.prvenstva[grep("Germany", moskidelfin$Drzava.prvenstva)] <- "Germany"
moskidelfin$Drzava.prvenstva[grep("USSR", moskidelfin$Drzava.prvenstva)] <- "Russia"
moskidelfin$Drzava.prvenstva[grep("USA", moskidelfin$Drzava.prvenstva)] <- "United States"

kraj_prv <- table(moskidelfin$Drzava.prvenstva)
rekordi <- unique(kraj_prv)
rekordi <- rekordi[order(rekordi)]
barve <- rgb(1, 0, 0, match(kraj_prv, rekordi)/length(drzavljanstvo))
names(barve) <- names(kraj_prv)
plot(svet, col = barve[as.character(svet$name_long)])
title("Rekordi glede na države-gostiteljice prvenstev")
legend("left", legend = rekordi, fill = rgb(1, 0, 0, (1:length(rekordi))/length(rekordi)), cex = 0.7)
imena <- c("Washington", "Melbourne", "Beijing","Tokyo", "Montreal", "Leipzig", "Moscow")
mesta <- data.frame("long" = c(-77.03, 144.96, 116.40, 139.69,-73.56, 12.37,37.61), "lat"= c(38.90, -37.81, 39.90,  35.68, 45.50, 51.33, 55.75))
points(coordinates(mesta[c("long", "lat")]), col="black", cex=0.7, pch=15)
dev.off()

