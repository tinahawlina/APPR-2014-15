# 2. faza: Obdelava, uvoz in čiščenje podatkov

source("slovar.r",encoding="UTF-8")
source("fontconfig.r",encoding="UTF-8")
source("uvoz/uvoz.r",encoding="UTF-8")
source("lib/xml.r", encoding="UTF-8")
source("slike/moskihrbtno.R", encoding="UTF-8")
source("slike/zenskehrbtno.R", encoding="UTF-8")
source("slike/moskiprsno.R", encoding="UTF-8")
source("slike/zenskeprsno.R", encoding="UTF-8")
source("slike/moskidelfin.R", encoding="UTF-8")
source("slike/zenskedelfin.R", encoding="UTF-8")
source("slike/moskiprosto.R", encoding="UTF-8")
source("slike/zenskeprosto.R", encoding="UTF-8")


# 3. faza: Analiza in vizualizacija podatkov
source("vizualizacija/vizualizacija.r", encoding ="UTF-8")


# 4. faza: Napredna analiza podatkov
source("analiza/analiza.r", encoding="UTF-8")

cat("Končano.\n")