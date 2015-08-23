std_events <- c("Astronomical Low Tide", "Avalanche", "Blizzard", 
                "Coastal Flood", "Cold/Wind Chill", "Debris Flow", 
                "Dense Fog", "Dense Smoke", "Drought", "Dust Devil", 
                "Dust Storm", "Excessive Heat", "Extreme Cold/Wind Chill", 
                "Flash Flood", "Flood", "Freezing Fog", "Frost/Freeze", 
                "Funnel Cloud", "Hail", "Heat", "Heavy Rain", "Heavy Snow", 
                "High Surf", "High Wind", "Hurricane (Typhoon)", "Ice Storm", 
                "Lake-Effect Snow", "Lakeshore Flood", "Lightning", 
                "Marine Hail", "Marine High Wind", "Marine Strong Wind", 
                "Marine Thunderstorm Wind", "Rip Current", "Seiche", "Sleet", 
                "Storm Surge/Tide", "Strong Wind", "Thunderstorm Wind", 
                "Tornado", "Tropical Depression", "Tropical Storm", "Tsunami", 
                "Volcanic Ash", "Waterspout", "Wildfire", "Winter Storm", 
                "Winter Weather")
std_events <- toupper(std_events)

raw_events <- unique(property_dmg$EVTYPE)
raw_events<- c(raw_events, unique(crop_dmg$EVTYPE)[!(unique(crop_dmg$EVTYPE) %in% raw_events)])
raw_events<- c(raw_events, unique(injuries$EVTYPE)[!(unique(injuries$EVTYPE) %in% raw_events)])
raw_events<- c(raw_events, unique(fatalities$EVTYPE)[!(unique(fatalities$EVTYPE) %in% raw_events)])

raw_events <- raw_events[which(raw_events != "?")]
raw_events <- raw_events[which(raw_events != "MARINE ACCIDENT")]
raw_events <- raw_events[which(raw_events != "MARINE MISHAP")]
raw_events <- raw_events[which(raw_events != "APACHE COUNTY")]
raw_events <- raw_events[which(raw_events != "DROWNING")]
raw_events <- raw_events[which(raw_events != "^HIGH$")]
raw_events <- raw_events[which(raw_events != "^OTHER$")]
raw_events <- raw_events[which(raw_events != "^URBAN AND SMALL$")]
raw_events <- raw_events[which(raw_events != "^URBAN SMALL$")]


raw_events <- toupper(sort(raw_events))

## INITIAL STATE
wrong_events <- raw_events[!(raw_events %in% std_events)] 

#### FUNCTIONS TO HELP YOU EXPLORE THE DATA TO BE CLEAN
length(unique(gsub("FLOODS", "FLOOD", wrong_events)))
wrong_events[grep("WINDS", wrong_events)]
wrong_events <- unique(wrong_events)
#### DO NOT KEEP IT

## Apply after each transformation below
wrong_events <- wrong_events[!(wrong_events %in% std_events)]

# 397 wrong events
wrong_events[grep("ASTRO", wrong_events)] <- "ASTRONOMICAL LOW TIDE"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 396
wrong_events <- unique(gsub("ANCE", "ANCHE", wrong_events))
wrong_events[grep("SLIDE", wrong_events)] <- "AVALANCHE"
wrong_events[grep("LANDSLUMP", wrong_events)] <- "AVALANCHE"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 395
wrong_events[grep("LIZZ", wrong_events)] <- "BLIZZARD" #Multievents
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 390
wrong_events <- unique(gsub("CSTL", "COASTAL", wrong_events))
wrong_events <- unique(gsub("FLD", "FLOOD", wrong_events))
wrong_events <- unique(gsub("FLOODING", "FLOOD", wrong_events))
wrong_events <- unique(gsub("FLOODS", "FLOOD", wrong_events))
wrong_events <- unique(gsub("BREAKUP", "FLASH", wrong_events))
wrong_events[grep("EROSION", wrong_events)] <- "COASTAL FLOOD"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 381
wrong_events <- unique(gsub("WINDS", "WIND", wrong_events))
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
wrong_events <- unique(gsub("WIND CHILL", "COLD/WIND CHILL", wrong_events))
wrong_events <- unique(gsub("WINDCHILL", "COLD/WIND CHILL", wrong_events))
wrong_events <- unique(gsub("COLD/WIND", "COLD/WIND CHILL", wrong_events))
wrong_events[grep("LOW TEMPERATURE", wrong_events)] <- "COLD/WIND CHILL"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]

wrong_events[grep("SEVERE TURBULENCE", wrong_events)] <- "FUNNEL CLOUD"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 367
wrong_events[grep("FOG AND", wrong_events)] <- "FREEZING FOG"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
wrong_events[grep("FOG", wrong_events)] <- "DENSE FOG"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 365
wrong_events[grep("DROU", wrong_events)] <- "DROUGHT" #Multievents
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 363
wrong_events[grep("DEV", wrong_events)] <- "DUST DEVIL" #Multievents
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 362
wrong_events[grep("DUST", wrong_events)] <- "DUST STORM" #Multievents
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 360
wrong_events[grep("HEAT W", wrong_events)] <- "HEAT"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 358
wrong_events[grep("HEAT", wrong_events)] <- "EXCESSIVE HEAT"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 355
wrong_events[grep("EXTR", wrong_events)] <- "EXTREME COLD/WIND CHILL"
wrong_events[grep("RECORD C", wrong_events)] <- "EXTREME COLD/WIND CHILL"
wrong_events[grep("COOL AND", wrong_events)] <- "EXTREME COLD/WIND CHILL"
wrong_events[grep("HYPOTH", wrong_events)] <- "EXTREME COLD/WIND CHILL"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 353
wrong_events[grep("FLASH", wrong_events)] <- "FLASH FLOOD"
wrong_events[grep("EAM FLOOD", wrong_events)] <- "FLASH FLOOD"
wrong_events[grep("DAM BREAK", wrong_events)] <- "FLASH FLOOD"
wrong_events[grep("MAJOR FLOOD", wrong_events)] <- "FLOOD"
wrong_events[grep("MINOR FLOOD", wrong_events)] <- "FLOOD"
wrong_events[grep("RURAL FLOOD", wrong_events)] <- "FLOOD"
wrong_events[grep("URBAN FLOOD", wrong_events)] <- "FLOOD"
wrong_events[grep("URBAN/SMALL STREAM", wrong_events)] <- "FLOOD"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 333
wrong_events[grep("FROST", wrong_events)] <- "FROST/FREEZE"
wrong_events[grep("FREEZE", wrong_events)] <- "FROST/FREEZE"
wrong_events[grep("FREEZING", wrong_events)] <- "FROST/FREEZE"
wrong_events[grep("GLAZE", wrong_events)] <- "FROST/FREEZE"
wrong_events[grep("ICY ROADS", wrong_events)] <- "FROST/FREEZE"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 326
wrong_events[grep("FUNNEL", wrong_events)] <- "FUNNEL CLOUD" #Multievent
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 325
wrong_events[grep("HAIL", wrong_events)] <- "HAIL" #Multievent
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 303
wrong_events[grep("WARM", wrong_events)] <- "HEAT"
wrong_events[grep("HYPERTH", wrong_events)] <- "HEAT"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 300
wrong_events[grep("Y RAIN", wrong_events)] <- "HEAVY RAIN"
wrong_events[grep("Y PRECIPITATION", wrong_events)] <- "HEAVY RAIN"
wrong_events[grep("Y SHOWER", wrong_events)] <- "HEAVY RAIN"
wrong_events[grep("G RAIN", wrong_events)] <- "SLEET"
wrong_events[grep("RAIN", wrong_events)] <- "HEAVY RAIN" # Multievent
wrong_events[grep("WETNESS", wrong_events)] <- "HEAVY RAIN" # Multievent
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 266
wrong_events[grep("Y SNOW", wrong_events)] <- "HEAVY SNOW"
wrong_events[grep("LAKE SNOW", wrong_events)] <- "LAKE-EFFECT SNOW"
wrong_events[grep("LAKE EFFECT SNOW", wrong_events)] <- "LAKE-EFFECT SNOW"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
wrong_events[grep("SNOW", wrong_events)] <- "HEAVY SNOW" # Multievents
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 224
wrong_events[grep("SURF", wrong_events)] <- "HIGH SURF" # Multievents
wrong_events[grep("HEAVY SEAS", wrong_events)] <- "HIGH SURF"
wrong_events[grep("HEAVY SWELLS", wrong_events)] <- "HIGH SURF"
wrong_events[grep("HIGH SEAS", wrong_events)] <- "HIGH SURF"
wrong_events[grep("HIGH SWELLS", wrong_events)] <- "HIGH SURF"
wrong_events[grep("HIGH WAVES", wrong_events)] <- "HIGH SURF"
wrong_events[grep("ROGUE WAVE", wrong_events)] <- "HIGH SURF"
wrong_events[grep("ROUGH SEAS", wrong_events)] <- "HIGH SURF"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 216
wrong_events[grep("HURRICANE", wrong_events)] <- "HURRICANE (TYPHOON)"
wrong_events[grep("H WIND", wrong_events)] <- "HIGH WIND" # Multievents
wrong_events[grep("Y WIND", wrong_events)] <- "HIGH WIND"
wrong_events[grep("H  WIND", wrong_events)] <- "HIGH WIND"
wrong_events[grep("BURST", wrong_events)] <- "HIGH WIND"
wrong_events[grep("GRADIENT WIND", wrong_events)] <- "HIGH WIND"
wrong_events[grep("WIND DAMAGE", wrong_events)] <- "HIGH WIND"
wrong_events[grep("FORCE WIND", wrong_events)] <- "HIGH WIND"
wrong_events[grep("WHIRLWIND", wrong_events)] <- "HIGH WIND"
wrong_events[grep("WIND AND WAVE", wrong_events)] <- "HIGH WIND"
wrong_events[grep("^WIND$", wrong_events)] <- "HIGH WIND"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 195
wrong_events[grep("TYP", wrong_events)] <- "HURRICANE (TYPHOON)"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 194
wrong_events[grep("ICE", wrong_events)] <- "ICE STORM" # Multievent
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 182
wrong_events[grep("LAKE", wrong_events)] <- "LAKESHORE FLOOD"
wrong_events[grep("TIDAL", wrong_events)] <- "LAKESHORE FLOOD"
wrong_events[grep("RIVER", wrong_events)] <- "LAKESHORE FLOOD"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 181
wrong_events[grep("LIGHT", wrong_events)] <- "LIGHTNING" # Multievent
wrong_events[grep("TNING", wrong_events)] <- "LIGHTNING"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 170
wrong_events[grep("MARINE", wrong_events)] <- "MARINE THUNDERSTORM WIND"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 167
wrong_events[grep("CURRENT", wrong_events)] <- "RIP CURRENT"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 166
wrong_events[grep("SURGE", wrong_events)] <- "STORM SURGE/TIDE"
wrong_events[grep("TIDE", wrong_events)] <- "STORM SURGE/TIDE"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 163
wrong_events <- unique(gsub("TSTM", "THUNDERSTORM", wrong_events))
wrong_events[grep("THUNDER", wrong_events)] <- "THUNDERSTORM WIND"
wrong_events[grep("RSTORM", wrong_events)] <- "THUNDERSTORM WIND"
wrong_events[grep("WIND STORM", wrong_events)] <- "THUNDERSTORM WIND"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 124
wrong_events[grep("WATERS", wrong_events)] <- "WATERSPOUT"
wrong_events[grep("TORN", wrong_events)] <- "TORNADO"
wrong_events[grep("TNADO", wrong_events)] <- "TORNADO"
wrong_events[grep("LANDSPOUT", wrong_events)] <- "TORNADO"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 112
wrong_events[grep("TROPICAL", wrong_events)] <- "TROPICAL STORM"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 108
wrong_events[grep("WATER", wrong_events)] <- "STORM SURGE/TIDE"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 106
wrong_events[grep("FIRE", wrong_events)] <- "WILDFIRE"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 99
wrong_events[grep("WINTER S", wrong_events)] <- "WINTER STORM"
wrong_events[grep("MIXED PRECIP", wrong_events)] <- "WINTER STORM"
wrong_events[grep("WINTER W", wrong_events)] <- "WINTER WEATHER"
wrong_events[grep("WINTRY", wrong_events)] <- "WINTER WEATHER"
wrong_events[grep("HEAVY MIX", wrong_events)] <- "WINTER WEATHER"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 95
wrong_events[grep("COASTAL", wrong_events)] <- "MARINE THUNDERSTORM WIND"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
wrong_events[grep("COLD", wrong_events)] <- "COLD/WIND CHILL"
wrong_events <- unique(wrong_events)
wrong_events <- wrong_events[!(wrong_events %in% std_events)]
# 89