evt_fat <- evt_fat[!evt_fat %in% events]

# WITHOUT DEPENDENCES (Removes 74)
# -------------------------------------------------
# Removes 5
evt_fat <- gsub("AVALANCE", "AVALANCHE", evt_fat)
evt_fat[grep("LANDSLIDE", evt_fat)] <- "AVALANCHE"
evt_fat[grep("MUDSLIDE", evt_fat)] <- "AVALANCHE"
# Removes 2
evt_fat[grep("FOG", evt_fat)] <- "DENSE FOG"
# Removes 1
evt_fat <- gsub("DRY MICROBURST", "DUST STORM", evt_fat)
# Removes 7
evt_fat <- gsub("GLAZE", "FROST/FREEZE", evt_fat)
evt_fat <- gsub("FROST", "FROST/FREEZE", evt_fat)
evt_fat[grep("FREEZ", evt_fat)] <- "FROST/FREEZE"
# Removes 10
evt_fat[grep("EXTREME HEAT", evt_fat)] <- "EXCESSIVE HEAT"
evt_fat[grep("RECORD HEAT", evt_fat)] <- "EXCESSIVE HEAT"
evt_fat[grep("EXCESSIVE HEAT", evt_fat)] <- "EXCESSIVE HEAT"
evt_fat[grep("HYPER", evt_fat)] <- "EXCESSIVE HEAT"
evt_fat[grep("HEAT WAVE", evt_fat)] <- "HEAT"
evt_fat[grep("WARM", evt_fat)] <- "HEAT"
# Removes 1
evt_fat <- gsub("EXCESSIVE RAINFALL", "HEAVY RAIN", evt_fat)
# Removes 14
evt_fat[grep("SNOW", evt_fat)] <- "HEAVY SNOW"
# Removes 12
evt_fat[grep("SURF", evt_fat)] <- "HIGH SURF"
evt_fat[grep("SEAS", evt_fat)] <- "HIGH SURF"
# Removes 6
evt_fat[grep("HURRICANE", evt_fat)] <- "HURRICANE (TYPHOON)"
# Removes 4
evt_fat[grep("ICE", evt_fat)] <- "ICE STORM"
evt_fat <- gsub("ICY ROADS", "ICE STORM", evt_fat)
# Removes 1
evt_fat <- gsub("LIGHTNING.", "LIGHTNING", evt_fat)
# Removes 2
evt_fat <- gsub("DROWNING", "RIP CURRENT", evt_fat)
evt_fat[grep("RIP CURRENT", evt_fat)] <- "RIP CURRENT"
# Removes 1
evt_fat <- gsub("MIXED PRECIP", "SLEET", evt_fat)
# Removes 1
evt_fat[grep("WATERSPOUT", evt_fat)] <- "WATERSPOUT"
# Removes 2
evt_fat[grep("FIRE", evt_fat)] <- "WILDFIRE"
# Removes 3
evt_fat[grep("TROPICAL", evt_fat)] <- "TROPICAL STORM"
evt_fat[grep("WINTER STORM", evt_fat)] <- "WINTER STORM"
# Removes 2
evt_fat <- gsub("WINTRY MIX", "WINTER WEATHER", evt_fat)
evt_fat[grep("WINTER WEATHER", evt_fat)] <- "WINTER WEATHER"
# Removes 16
evt_fat <- gsub("FLOODING", "FLOOD", evt_fat)
evt_fat <- gsub("RAPIDLY RISING WATER", "FLASH FLOOD", evt_fat)
evt_fat <- gsub("URBAN/SML STREAM FLD", "FLOOD", evt_fat)
evt_fat[grep("FLASH FLOOD", evt_fat)] <- "FLASH FLO"
evt_fat[grep("FLOOD", evt_fat)] <- "FLOOD"
evt_fat[grep("FLASH FLO", evt_fat)] <- "FLASH FLOOD"

# Removes 4 (not working)
evt_fat <- gsub("WINDS", "WIND", evt_fat)
evt_fat <- gsub("LOW TEMPERATURE", "COLD/WIND CHILL", evt_fat)
evt_fat <- gsub("COLD/WIND", "COLD/WIND CHILL", evt_fat)
evt_fat[grep("HYPO", evt_fat)] <- "EXTREME COLD/WIND CHILL"
evt_fat <- gsub("EXTREME COLD", "EXTREME COLD/WIND CHILL", evt_fat)



#evt_fat[grep("COLD", evt_fat)] <- "COLD/WIND CHILL"



#evt_fat[grep("HIGH", evt_fat)] <- "HIGH SURF"


evt_fat[grep("WIND", evt_fat)] <- "HIGH WIND"
evt_fat[grep("HIGH WIND", evt_fat)] <- "HIGH WIND"

evt_fat[grep("MARINE", evt_fat)] <- "MARINE THUNDERSTORM WIND"

evt_fat <- gsub("TSTM", "THUNDERSTORM", evt_fat)
evt_fat[grep("THUNDERSTORM WINDS", evt_fat)] <- "THUNDERSTORM WIND"
evt_fat[grep("THUNDERSTORM", evt_fat)] <- "THUNDERSTORM WIND"
evt_fat[grep("THUNDERTORM WINDS", evt_fat)] <- "THUNDERSTORM WIND"
evt_fat[grep("HAIL", evt_fat)] <- "THUNDERSTORM WIND"

#evt_fat[grep("STORM", evt_fat)] <- "WINTER STORM"
