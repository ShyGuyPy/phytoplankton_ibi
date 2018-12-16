## ----echo=FALSE----------------------------------------------------------
## knitr::opts_chunk$set(eval=evaluate, cache=cache.me)

## ------------------------------------------------------------------------
## # test_reported.df <- phyto.df %>%
## #   select(sampledate, surveyid) %>%
## #   mutate(sampledate = as.Date(sampledate))
## #
## #
## # test_wq.df <- wq.df %>%
## #   select(sampledate, eventid) %>%
## #   mutate(sampledate = as.Date(sampledate))
## #
## # test_wq_reported <- left_join(test_reported.df, test_wq.df, by = "sampledate") %>%
## #   distinct()

## ------------------------------------------------------------------------
## 
## #
## # event.sub <- event.df %>%
## #   select(station, sampledate) %>%
## #   distinct() %>%
## #   mutate(sampledate = as.Date(sampledate)) %>%
## #   mutate(lower_date = sampledate - lubridate::days(3),
## #          upper_date = sampledate + lubridate::days(3))
## #
## # library(parallel)
## # n.cores <- detectCores() - 1
## # cl <- makeCluster(n.cores)
## # clusterExport(cl = cl, varlist = c("wq.df", "event.sub"))
## # clusterEvalQ(cl, c(library(dplyr))) %>% invisible()
## #
## # env.df <- parLapply(cl, 1:nrow(event.sub), function(row.i) {
## #
## #   sub.df <- slice(event.sub, row.i)
## #   #----------------------------------------------------------------------------
## #   sub.env <- wq.df %>%
## #     filter(station == sub.df$station#,
## #            # date >= sub.df$lower_date,
## #            # date <= sub.df$upper_date
## #            )
## #
## # parallel::stopCluster(cl)
## # })

## ------------------------------------------------------------------------
## event.df <- event.df %>%
##   mutate(station = as.character(station))
## 
## event.sub <- event.df %>%
##   select(station, sampledate) %>%
##   distinct() %>%
##   mutate(sampledate = as.Date(sampledate)) %>%
##   mutate(lower_date = sampledate - lubridate::days(3),
##          upper_date = sampledate + lubridate::days(3))
## 
## # library(parallel)
## # n.cores <- detectCores() - 1
## # cl <- makeCluster(n.cores)
## # clusterExport(cl = cl, varlist = c("wq.df", "event.sub"))
## # clusterEvalQ(cl, c(library(dplyr))) %>% invisible()
## 
## pasta <- nrow(event.sub)
## 
## #env_test.df <- parLapply(cl, 1:nrow(bay.sub), function(row.i) {
## env_test.df <- lapply(1:pasta, function(row.i) {
## 
##   sub.df <- slice(event.sub, row.i)
## # ----------------------------------------------------------------------------
##   sub.env <- wq.df %>%
##     filter(station == sub.df$station,
##            sampledate >= sub.df$lower_date,
## 
##            sampledate <= sub.df$upper_date)
## #   #----------------------------------------------------------------------------
##   # if (nrow(sub.env) == 0) return(data.frame(
##   #   station = NA,
##   #   date = NA,
##   #   parameter = NA,
##   #   measurevalue = NA
##   # ))
## #   #----------------------------------------------------------------------------
## #   final.df <- sub.env %>%
## #     mutate(date_diff = date - sub.df$sampledate,
## #            abs_date_diff = abs(date_diff),
## #            sampledate = sub.df$sampledate) %>%
## #     filter(abs_date_diff == min(abs_date_diff))
## #   #----------------------------------------------------------------------------
## #   if (nrow(final.df) > 1) {
## #     final.df <- final.df %>%
## #       filter(date == min(date))
## #   }
## #   #----------------------------------------------------------------------------
## #   return(final.df)
## # }) %>%
## #   bind_rows() %>%
## #   filter(!is.na(station))
## })
## 
## 
## 
## #stopCluster(cl)
## 
## 

## ------------------------------------------------------------------------
## 
## # event_pico.df <- readxl::read_excel(file.path(project.dir, "data/Va_phyto_count_and_event/data-dev_2013_2016_ODU_Pico_Events_05mar18.xlsx"))
## #
## # event_pico.df <- clean_up(event_pico.df)
## #
## # library(compare)
## #
## # comparison.df <- compare(event_pico.df,event.df,allowAll=TRUE)

