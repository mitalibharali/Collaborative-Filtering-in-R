library(recommenderlab)
library(readxl)
netflix.df <- read_excel("Netflix.xlsx")
View(netflix.df)
row.names <- netflix.df[,1]
netflix.df <- netflix.df[,-1]
netflix.df 

m <- as.matrix(netflix.df)
r <- as(m, "realRatingMatrix")

#calculate simialrities between users for user based collaborative filter
similarity(r, method = "cosine")

#calculate simialrities between and among users for item based collaborative filter
similarity(r, method = "pearson", which = "items")

# movie-rating based recommendation for user 4
IB.Rec <- Recommender(r, "IBCF")
pred <- predict(IB.Rec, r[4,], n = 3, type = "topNList")
as(pred, "matrix")

