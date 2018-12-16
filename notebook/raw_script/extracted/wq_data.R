## ----echo=FALSE----------------------------------------------------------
## knitr::opts_chunk$set(eval=evaluate, cache=cache.me)

## ------------------------------------------------------------------------
## wq.df <- file.path(url.root,
##                    "WaterQuality",
##                    "WaterQuality",
##                    format(min(phyto.df$sampledate) - days(3), "%m-%d-%Y"),
##                    format(max(phyto.df$sampledate) + days(3), "%m-%d-%Y"),
##                    "6",
##                    "7,16,23,24",
##                    "station",
##                    paste(station.vec, collapse = ","),
##                    "21,34,74,83") %>%
##   fromJSON() %>%
##   clean_up() %>%
##   filter(is.na(problem),
##          parameter %in% c("chla", "doc", "pheo", "salinity"))
## 
## 
## wq.df <- wq.df %>%
##   select(station, sampledate, layer, depth, parameter, measurevalue) %>% #eventid,
##   mutate(sampledate=as.Date(sampledate))

## ------------------------------------------------------------------------
## wq.df <- wq.df %>%
##   filter(layer == "s",
##          parameter == "chla") %>%
##   unite(parameter, c("layer", "parameter"), remove = FALSE) %>%
##   bind_rows(wq.df)
## 

## ------------------------------------------------------------------------
## pdepth.df <- event.df %>%
##   filter(layer %in% c("ap", "wc")) %>%
##   mutate(sampledate = as.Date(sampledate)) %>%
##   select(station, sampledate, pdepth) %>%
##   dplyr::distinct()
## 
## wq.df <- left_join(wq.df, pdepth.df, by = c("station", "sampledate"))

## ------------------------------------------------------------------------
## wq.df <- wq.df %>%
##   filter(depth <= pdepth) #%>%
## 

## ----eval=FALSE----------------------------------------------------------
## # wq.df <- wq.df %>%
## #   rename(date = sampledate)
## 

## ----eval=FALSE----------------------------------------------------------
## data.table::fwrite(wq.df, file.path(project.dir, "data/water_quality", "cedr_wq.csv"))
## 
## wq.raw <- data.table::fread(file.path(project.dir, "data/water_quality/cedr_wq.csv"),
##                             data.table = FALSE,
##                            na.strings = c("")) #%>%
##   # filter(is.na(problem),
##   #        parameter %in% c("chla", "doc", "pheo", "salinity"))
## 
## wq.df <- wq.raw %>%
##   mutate(sampledate=as.Date(sampledate))

