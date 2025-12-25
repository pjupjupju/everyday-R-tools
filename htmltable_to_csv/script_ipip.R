# install.packages(c("rvest", "xml2", "dplyr", "stringr", "readr"))

library(rvest)
library(dplyr)
library(readr)
library(stringr)

# this script uses https://ipip.ori.org/AlphabeticalItemList.htm saved as ipipmess.htm, but feel free to use it for any great design research tool or anything u need it for, ofc.

ipip <- read_html("ipipmess.htm")

rows <- html_elements(ipip, "tr")

magic <- lapply(rows, function(r) {
  cells_text <- html_text(html_elements(r, "td"))
  
  data.frame(
    item = cells_text[1],
    code = cells_text[2],
    stringsAsFactors = FALSE
  )
}) # frame is based on number of columns, obviously. if there is more than two, add more than two.

new <- bind_rows(magic)
head(new)
new <- new[-(1:2), ] # deleting first two "rows" because of the "table header"

write_csv(new, "ipip.csv")
