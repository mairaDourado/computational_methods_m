data1 <- read.csv("data/raw/cestes/comm.csv")

dim(data1)
#sum of the columns on vector abundance

abundance <- colSums(data1[,-1])
class(abundance)
cres_abundance <- sort(abundance, decreasing = TRUE)
cres_abundance

#sum of lines in the vector frequency

sites_abundance <- data1 > 0

sites_abundance

length(sites_abundance)

sites_data <- data.frame(sites = c(1:97)
                         sites_abundance)

