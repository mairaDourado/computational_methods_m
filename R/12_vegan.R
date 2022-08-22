library(vegan)

community_a <- c(10, 6, 4 ,1)
community_b <- c(7, rep(1, 7))

ren_com_a <- renyi(community_a)
ren_com_b <- renyi(community_b)

ren_AB <- rbind(ren_com_a, ren_com_b)

matplot(t(ren_AB), type = "l", axes = F)
box()
axis(side = 2)
axis(side = 1, label = c(0, 0.25, 0.5, 1, 2, 4, 8, 16, 32, 62, "Inf"), at = 1:11)

legend("topright", legend = c("Community A", "Community B"),
       lty = c(1,2),
       col = c(1,2))
