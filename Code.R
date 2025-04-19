Harvest <- read.csv("Stardew Valley Crop Profitability.xlsx - 1 harvest.csv")
Regrowth <- read.csv("Stardew Valley Crop Profitability.xlsx - Regrowth.csv")

HLeveled <- Harvest$Sale.Price*1.01
*0.97 + Harvest$Silver*0.02 + Harvest$Gold*0.01