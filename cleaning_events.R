cleaning_events <- function (raw_events){
        clean_events <- raw_events
        
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
        
        clean_events <- gsub("ANCE", "ANCHE", clean_events)
        clean_events <- gsub("CSTL", "COASTAL", clean_events)
        clean_events <- gsub("FLD", "FLOOD", clean_events)
        clean_events <- gsub("FLOODING", "FLOOD", clean_events)
        clean_events <- gsub("FLOODS", "FLOOD", clean_events)
        clean_events <- gsub("BREAKUP", "FLASH", clean_events)
        clean_events <- gsub("WINDS", "WIND", clean_events)
        clean_events <- gsub("WINDCHILL", "WIND CHILL", clean_events)
        #clean_events <- gsub("WIND CHILL$", "COLD/WIND CHILL", clean_events)
        #clean_events <- gsub("COLD/WIND$", "COLD/WIND CHILL", clean_events)
        clean_events <- gsub("TSTM", "THUNDERSTORM", clean_events)
        
        clean_events[grep("ASTRO", clean_events)] <- "ASTRONOMICAL LOW TIDE"
        clean_events[grep("SLIDE", clean_events)] <- "AVALANCHE"
        clean_events[grep("LANDSLUMP", clean_events)] <- "AVALANCHE"
        clean_events[grep("LIZZ", clean_events)] <- "BLIZZARD" #Multievents
        clean_events[grep("EROSION", clean_events)] <- "COASTAL FLOOD"
        clean_events[grep("LOW TEMPERATURE", clean_events)] <- "COLD/WIND CHILL"
        clean_events[grep("^COLD$", clean_events)] <- "COLD/WIND CHILL"
        clean_events[grep("SEVERE TURBULENCE", clean_events)] <- "FUNNEL CLOUD"
        clean_events[grep("FOG AND", clean_events)] <- "FREEZING FOG"
        clean_events[grep("FOG", clean_events)] <- "DENSE FOG"
        clean_events[grep("DROU", clean_events)] <- "DROUGHT" #Multievents
        clean_events[grep("DEV", clean_events)] <- "DUST DEVIL" #Multievents
        clean_events[grep("DUST", clean_events)] <- "DUST STORM" #Multievents
        clean_events[grep("HEAT W", clean_events)] <- "HEAT"
        clean_events[grep("HEAT", clean_events)] <- "EXCESSIVE HEAT"
        clean_events[grep("EXTR", clean_events)] <- "EXTREME COLD/WIND CHILL"
        clean_events[grep("RECORD C", clean_events)] <- "EXTREME COLD/WIND CHILL"
        clean_events[grep("COOL AND", clean_events)] <- "EXTREME COLD/WIND CHILL"
        clean_events[grep("HYPOTH", clean_events)] <- "EXTREME COLD/WIND CHILL"
        clean_events[grep("FLASH", clean_events)] <- "FLASH FLOOD"
        clean_events[grep("EAM FLOOD", clean_events)] <- "FLASH FLOOD"
        clean_events[grep("DAM BREAK", clean_events)] <- "FLASH FLOOD"
        clean_events[grep("MAJOR FLOOD", clean_events)] <- "FLOOD"
        clean_events[grep("MINOR FLOOD", clean_events)] <- "FLOOD"
        clean_events[grep("RURAL FLOOD", clean_events)] <- "FLOOD"
        clean_events[grep("URBAN FLOOD", clean_events)] <- "FLOOD"
        clean_events[grep("URBAN/SMALL STREAM", clean_events)] <- "FLOOD"
        clean_events[grep("FROST", clean_events)] <- "FROST/FREEZE"
        clean_events[grep("FREEZE", clean_events)] <- "FROST/FREEZE"
        clean_events[grep("FREEZING", clean_events)] <- "FROST/FREEZE"
        clean_events[grep("GLAZE", clean_events)] <- "FROST/FREEZE"
        clean_events[grep("ICY ROADS", clean_events)] <- "FROST/FREEZE"
        clean_events[grep("FUNNEL", clean_events)] <- "FUNNEL CLOUD" #Multievent
        clean_events[grep("HAIL", clean_events)] <- "HAIL" #Multievent
        clean_events[grep("WARM", clean_events)] <- "HEAT"
        clean_events[grep("HYPERTH", clean_events)] <- "HEAT"
        clean_events[grep("Y RAIN", clean_events)] <- "HEAVY RAIN"
        clean_events[grep("Y PRECIPITATION", clean_events)] <- "HEAVY RAIN"
        clean_events[grep("Y SHOWER", clean_events)] <- "HEAVY RAIN"
        clean_events[grep("G RAIN", clean_events)] <- "SLEET"
        clean_events[grep("RAIN", clean_events)] <- "HEAVY RAIN" # Multievent
        clean_events[grep("WETNESS", clean_events)] <- "HEAVY RAIN" # Multievent
        clean_events[grep("Y SNOW", clean_events)] <- "HEAVY SNOW"
        clean_events[grep("LAKE SNOW", clean_events)] <- "LAKE-EFFECT SNOW"
        clean_events[grep("LAKE EFFECT SNOW", clean_events)] <- "LAKE-EFFECT SNOW"
        clean_events[grep("SNOW", clean_events)] <- "HEAVY SNOW" # Multievents
        clean_events[grep("SURF", clean_events)] <- "HIGH SURF" # Multievents
        clean_events[grep("HEAVY SEAS", clean_events)] <- "HIGH SURF"
        clean_events[grep("HEAVY SWELLS", clean_events)] <- "HIGH SURF"
        clean_events[grep("HIGH SEAS", clean_events)] <- "HIGH SURF"
        clean_events[grep("HIGH SWELLS", clean_events)] <- "HIGH SURF"
        clean_events[grep("HIGH WAVES", clean_events)] <- "HIGH SURF"
        clean_events[grep("ROGUE WAVE", clean_events)] <- "HIGH SURF"
        clean_events[grep("ROUGH SEAS", clean_events)] <- "HIGH SURF"
        clean_events[grep("HURRICANE", clean_events)] <- "HURRICANE (TYPHOON)"
        clean_events[grep("H WIND", clean_events)] <- "HIGH WIND" # Multievents
        clean_events[grep("Y WIND", clean_events)] <- "HIGH WIND"
        clean_events[grep("H  WIND", clean_events)] <- "HIGH WIND"
        clean_events[grep("BURST", clean_events)] <- "HIGH WIND"
        clean_events[grep("GRADIENT WIND", clean_events)] <- "HIGH WIND"
        clean_events[grep("WIND DAMAGE", clean_events)] <- "HIGH WIND"
        clean_events[grep("FORCE WIND", clean_events)] <- "HIGH WIND"
        clean_events[grep("WHIRLWIND", clean_events)] <- "HIGH WIND"
        clean_events[grep("WIND AND WAVE", clean_events)] <- "HIGH WIND"
        clean_events[grep("^WIND$", clean_events)] <- "HIGH WIND"
        clean_events[grep("TYP", clean_events)] <- "HURRICANE (TYPHOON)"
        clean_events[grep("ICE", clean_events)] <- "ICE STORM"
        clean_events[grep("LAKE", clean_events)] <- "LAKESHORE FLOOD"
        clean_events[grep("TIDAL", clean_events)] <- "LAKESHORE FLOOD"
        clean_events[grep("RIVER", clean_events)] <- "LAKESHORE FLOOD"
        clean_events[grep("LIGHT", clean_events)] <- "LIGHTNING" # Multievent
        clean_events[grep("TNING", clean_events)] <- "LIGHTNING"
        clean_events[grep("MARINE", clean_events)] <- "MARINE THUNDERSTORM WIND"
        clean_events[grep("CURRENT", clean_events)] <- "RIP CURRENT"
        clean_events[grep("SURGE", clean_events)] <- "STORM SURGE/TIDE"
        clean_events[grep("TIDE", clean_events)] <- "STORM SURGE/TIDE"
        clean_events[grep("THUNDER", clean_events)] <- "THUNDERSTORM WIND"
        clean_events[grep("RSTORM", clean_events)] <- "THUNDERSTORM WIND"
        clean_events[grep("WIND STORM", clean_events)] <- "THUNDERSTORM WIND"
        clean_events[grep("WATERS", clean_events)] <- "WATERSPOUT"
        clean_events[grep("TORN", clean_events)] <- "TORNADO"
        clean_events[grep("TNADO", clean_events)] <- "TORNADO"
        clean_events[grep("LANDSPOUT", clean_events)] <- "TORNADO"
        clean_events[grep("TROPICAL", clean_events)] <- "TROPICAL STORM"
        clean_events[grep("WATER", clean_events)] <- "STORM SURGE/TIDE"
        clean_events[grep("FIRE", clean_events)] <- "WILDFIRE"
        clean_events[grep("WINTER S", clean_events)] <- "WINTER STORM"
        clean_events[grep("MIXED PRECIP", clean_events)] <- "WINTER STORM"
        clean_events[grep("WINTER W", clean_events)] <- "WINTER WEATHER"
        clean_events[grep("WINTRY", clean_events)] <- "WINTER WEATHER"
        clean_events[grep("HEAVY MIX", clean_events)] <- "WINTER WEATHER"
        clean_events[grep("COASTAL", clean_events)] <- "MARINE THUNDERSTORM WIND"

        return(as.factor(clean_events))
}