# Exploratory Data Analysis - Project_2

# Load ggplot2 library
require(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS("~/Project/GitHub/datasciencecoursera/Exploratory_Data_Analysis-Project_2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/Project/GitHub/datasciencecoursera/Exploratory_Data_Analysis-Project_2/exdata_data_NEI_data/Source_Classification_Code.rds")

# Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

# Generate the graph in the same directory as the source code
png(filename='~/Project/GitHub/datasciencecoursera/Exploratory_Data_Analysis-Project_2/plot4.png')

ggplot(data=merge.sum, aes(x=Year, y=Emissions/1000)) + 
    geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
    ggtitle(expression('Total Emissions of PM'[2.5])) + 
    ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
    geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
    theme(legend.position='none') + scale_colour_gradient(low='black', high='red')

dev.off()

