slovar <- c("United States" = "Združene države Amerike",
            "Hungary" = "Madžarska",
            "Brazil" = "Brazilija",
            "South Africa" = "Južnoafriška Republika",
            "Russian Federation" = "Rusija",
            "Netherlands" = "Nizozemska",
            "Germany" = "Nemčija",
            "Australia" = "Avstralija",
            "France" = "Francija")

prevedi <- function(x) {
  ifelse(is.na(slovar[x]), x, slovar[x])
}