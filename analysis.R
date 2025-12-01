# Meta-analysis mini demo (random-effects) using metafor
# Run once to install:
# install.packages("metafor")

library(metafor)

dir.create("results", showWarnings = FALSE)

dat <- read.csv("data/studies.csv")

# Random-effects meta-analysis (REML)
m <- rma(yi = dat$yi, sei = dat$sei, method = "REML")

png("results/forest_plot.png", width = 1200, height = 800)
forest(m, slab = dat$study, xlab = "Effect size (yi)")
dev.off()

# Save a text summary too
sink("results/summary.txt")
print(summary(m))
sink()

cat("Done! Outputs saved to results/forest_plot.png and results/summary.txt\n")
