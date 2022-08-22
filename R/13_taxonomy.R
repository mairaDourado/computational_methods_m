comm <- read.csv("data/raw/cestes/comm.csv")
trait <- read.csv("data/raw/cestes/traits.csv")

head(comm)[,1:6]
head(trait)[,1:6]

rownames(comm)[1:6]
rownames(comm) <- paste0("Site", comm[,1])
rownames(comm)[1:6]

comm <- comm[,-1]

head(comm)[,1:6]

rownames(trait)[1:6]
trait <- trait[,-1]
rownames(trait)[1:6]
rownames(trait) <- paste0("Sp", rownames(trait))

head(trait)[,1:6]

library(vegan)

richness <- vegan::specnumber(comm)
shannon <- vegan::diversity(comm)
simpson <- vegan::diversity(comm, index = "simpson")

library(cluster)
library(FD)

gow <- cluster::daisy(trait, metric = "gower")
gow2 <- FD::gowdis(trait)

identical(gow, gow2)

class(gow) #different classes

class(gow2)

plot(gow, gow2, asp = 1) #same values

#install.packages(SYNCSA)
library(SYNCSA)
tax <- rao.diversity(comm)
fun <- rao.diversity(comm, traits = traits)
#plot(fun$Simpson,fun$FunRao, pch = 19, asp = 1)
#abline(a = 0, b = 1)


#install.packages("FD")
library(FD)
#we can use the distance matrix to calculate functional diversity indices
FuncDiv1 <- dbFD(x = gow, a = comm, messages = F)
#the returned object has Villéger's indices and Rao calculation
names(FuncDiv1)


FuncDiv <- dbFD(x = traits, a = comm, messages = F)

#-------------------------------------------------------

splist <-read.csv("data/raw/cestes/splist.csv")
splist$TaxonName

library(taxize)
classification_data <- classification(splist$TaxonName, db = 'ncbi')

str(classification)
length(classification_data)

classification_data$'Arisarum vulgare'
classification_data[[1]]
classification_data[[4]]

library(dplyr)
tible_ex <- classification_data[[1]] %>%
  filter(rank == "family") %>%
  select(name)

extract_family <- function(x){
  if(is.nu)
  x %>%
    filter(rank == "family") %>%
    select(name)
}


