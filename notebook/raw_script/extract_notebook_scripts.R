# Extract -----------------------------------------------------------------
sections.path <- "notebook/sections"
#appendix.path <- "notebook/sections/appendix"
extracted.path <- c("notebook/raw_script/extracted")

extract_code <- function(rmd.path, extracted.path) {
r.files.vec <- list.files(rmd.path)
r.files.vec <- r.files.vec[grepl(".Rmd", r.files.vec)]

purrr::map(r.files.vec, function(file.i) {
file.name <- gsub(".Rmd", "", file.i)
extracted.file <- paste0(file.name, ".R")
knitr::purl(file.path(rmd.path, file.i),
file.path(extracted.path, extracted.file))
})

}
extract_code(sections.path, extracted.path)
#extract_code(appendix.path, extracted.path)


# Run ---------------------------------------------------------------------
run.itis.acquisition <- FALSE
run.va_odu.acquisition <- FALSE
evaluate <- TRUE
cache.me <- FALSE
extracted.path <- c("notebook/raw_script/extracted")
source.vec <- c(
"load_packages.R",
"funcs_and_vars.R",
"va_odu_data.R",
"wq_data.R"#,
#"test.R"
)

purrr::map(source.vec, function(source.i) {
source(file.path(extracted.path, source.i))
})

print("DONE")