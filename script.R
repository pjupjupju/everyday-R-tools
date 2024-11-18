#install.packages("openxlsx")
library(openxlsx)

csv_files <- c("MemberOfParliaments.csv",
               "PersonAddresses.csv",
               "PersonConfessions.csv",
               "PersonInstitutions.csv",
               "PersonNationalities.csv",
               "PersonPersons.csv",
               "PersonProfessions.csv",
               "PersonTitles.csv",
               "Places.csv",
               "Professions.csv")

output_folder <- "xls/"

for (csv_file in csv_files) {
  data <- read.csv(csv_file, sep = ";")
  
  excel_file <- paste(output_folder, gsub(".csv", ".xlsx", csv_file), sep="")
  
  write.xlsx(data, excel_file)
  
  cat("Soubor", csv_file, "byl uložen jako", excel_file, "\n")
}

