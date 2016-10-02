# Exploratory Data Analysis - Project_2

# Loading provided datasets - loading from local machine
NEI <- readRDS("~/Project/GitHub/datasciencecoursera/Exploratory_Data_Analysis-Project_2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Project/GitHub/datasciencecoursera/Exploratory_Data_Analysis-Project_2/exdata_data_NEI_data/Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Generate the graph in the same directory as the source code
png(filename='~/Project/GitHub/datasciencecoursera/Exploratory_Data_Analysis-Project_2/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()