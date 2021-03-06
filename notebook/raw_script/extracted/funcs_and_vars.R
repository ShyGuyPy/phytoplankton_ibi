## ----echo=FALSE----------------------------------------------------------
## knitr::opts_chunk$set(eval=evaluate, cache=cache.me)

## ------------------------------------------------------------------------
## project.dir <- rprojroot::find_rstudio_root_file()
## 
## clean_string <- function(x) {
##   x %>%
##     stringr::str_trim() %>%
##     tolower() %>%
##     stringr::str_replace_all("\\s+", " ") %>%
##     stringr::str_replace_all(" ", "_") %>%
##     if_else(. == "", as.character(NA), .)
## }
## 
## clean_up <- function(x) {
##   x %>%
##     rename_all(clean_string) %>%
##     mutate_if(is.character, funs(clean_string))%>%
##     distinct()
## }
## 
## url.root <- "http://datahub.chesapeakebay.net/api.JSON"
## todays.date <- format(Sys.Date(), "%m-%d-%Y")
## 
## 
## dir.create(file.path(project.dir, "data/VA_ODU/"),
##            recursive = TRUE, showWarnings = FALSE)
## 
## dir.create(file.path(project.dir, "data/CEDR/"),
##            recursive = TRUE, showWarnings = FALSE)
## 
## dir.create(file.path(project.dir, "data/MD_DNR/"),
##            recursive = TRUE, showWarnings = FALSE)
## 
## dir.create(file.path(project.dir, "data/water_quality"),
##            recursive = TRUE, showWarnings = FALSE)
## 
## 
## station.vec <- file.path(url.root,
##                        "LivingResources",
##                        "TidalPlankton",
##                        "Reported",
##                        "1-01-1970",
##                        todays.date,
##                        "17",
##                        "Station") %>%
##   fromJSON() %>%
##   pull(unique(MonitoringLocationId))

