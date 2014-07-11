library(SPARQL)
library(RPushbullet)

europeana <- "http://europeana.ontotext.com/sparql"

read_string <- function(filename) {
  return(readChar(filename, file.info(filename)$size))
}

rights_by_provider <- read_string("rights_by_provider.rq")
rights_by_provider_data <- SPARQL(url = europeana, query = rights_by_provider)$results

rights_by_country <- read_string("rights_by_country.rq")
rights_by_country_data <- SPARQL(url = europeana, query = rights_by_country)$result

pbPost("note", "Starting rights by year")

rights_by_year <- read_string("rights_by_year.rq")
rights_by_year_data <- SPARQL(url = europeana, query = rights_by_year)$results

pbPost("note", "retrieved all rights")
