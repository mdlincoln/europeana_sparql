library(dplyr)
library(ggplot2)
library(maps)

dates <- rights_by_year_data
dates$year <- as.numeric(dates$edmyear)
dates$rights <- as.factor(dates$edmrights)
dates <- dates %>% filter(year %in% 1000:2014, rights %in% c(
  "<http://www.europeana.eu/rights/rr-f/>",
  "<http://creativecommons.org/publicdomain/zero/1.0/>",
  "<http://creativecommons.org/publicdomain/mark/1.0/>"))
ggplot(dates, aes(x=year, y=count, color=edmrights)) +
  geom_point() + geom_smooth() + facet_wrap(~ country) +
  scale_y_log10() + ylim(0, 1000)

countries <- rights_by_country %>% filter(edmrights=="<http://creativecommons.org/licenses/by/3.0/nl/>")
