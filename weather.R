library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
file <- "data.csv"

if(!file.exists(file))
        download.file(url, file)

raw_data <- read.csv(file, stringsAsFactors = FALSE)

clean_data <- raw_data[,c(37, 2, 8, 23:28)]
rm(raw_data, url, file)

clean_data$BGN_DATE <- as.Date(clean_data$BGN_DATE, format = "%m/%d/%Y")
clean_data$EVTYPE <- toupper(clean_data$EVTYPE)

property_dmg <- subset(clean_data, PROPDMG != 0)
property_dmg <- property_dmg[, c(1:3,6:7)]
crop_dmg <- subset(clean_data, CROPDMG != 0) 
crop_dmg <- crop_dmg[, c(1:3,8:9)]
fatalities <- subset(clean_data, FATALITIES != 0) 
fatalities <- fatalities[,  c(1:4)]
injuries <- subset(clean_data, INJURIES != 0) 
injuries <- injuries[,  c(1:3, 5)]

#Cleaning Property_dmg
property_dmg$PROPDMGEXP[property_dmg$PROPDMGEXP %in% c("K", "k", "0", "+", "-", "")] <- "3"
property_dmg$PROPDMGEXP[property_dmg$PROPDMGEXP %in% c("m", "M")] <- "6"
property_dmg$PROPDMGEXP[property_dmg$PROPDMGEXP %in% c("h", "H")] <- "2"
property_dmg$PROPDMGEXP[property_dmg$PROPDMGEXP %in% c("B")] <- "9"
property_dmg$PROPDMGEXP <- as.numeric(property_dmg$PROPDMGEXP)
property_dmg$PROPDMGTOTAL <- property_dmg$PROPDMG * 10^property_dmg$PROPDMGEXP
property_dmg <- property_dmg[ ,-c(4,5)]

#Cleaning Crop_dmg
crop_dmg$CROPDMGEXP[crop_dmg$CROPDMGEXP %in% c("K", "k", "0", "")] <- "3"
crop_dmg$CROPDMGEXP[crop_dmg$CROPDMGEXP %in% c("m", "M")] <- "6"
crop_dmg$CROPDMGEXP[crop_dmg$CROPDMGEXP %in% c("B")] <- "9"
crop_dmg$CROPDMGEXP <- as.numeric(crop_dmg$CROPDMGEXP)
crop_dmg$CROPDMGTOTAL <- crop_dmg$CROPDMG * 10^crop_dmg$CROPDMGEXP
crop_dmg <- crop_dmg[ ,-c(4,5)]

# Cleaning invalid events
invalid_events <- c("?","MARINE ACCIDENT", "MARINE MISHAP", "APACHE COUNTY",
                    "DROWNING", "HIGH", "OTHER", "URBAN AND SMALL",
                    "URBAN SMALL")
property_dmg <- subset(property_dmg, ! (EVTYPE %in% invalid_events))
crop_dmg <- subset(crop_dmg, ! (EVTYPE %in% invalid_events))
fatalities <- subset(fatalities, ! (EVTYPE %in% invalid_events))
injuries <- subset(injuries, ! (EVTYPE %in% invalid_events))

# Cleaning the events data
property_dmg$EVTYPE <- cleaning_events(property_dmg$EVTYPE)
crop_dmg$EVTYPE <- cleaning_events(crop_dmg$EVTYPE)
fatalities$EVTYPE <- cleaning_events(fatalities$EVTYPE)
injuries$EVTYPE <- cleaning_events(injuries$EVTYPE)

prop_events <- property_dmg %>% group_by(EVTYPE) %>% summarise(sum = sum(PROPDMGTOTAL)) %>%
        arrange(desc(sum))
crop_events <- crop_dmg %>% group_by(EVTYPE) %>% summarise(sum = sum(CROPDMGTOTAL)) %>%
        arrange(desc(sum))
fat_events <- fatalities %>% group_by(EVTYPE) %>% summarise(sum = sum(FATALITIES)) %>%
        arrange(desc(sum))
inj_events <- injuries %>% group_by(EVTYPE) %>% summarise(sum = sum(INJURIES)) %>%
        arrange(desc(sum))


