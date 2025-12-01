# Reproducible Meta-analysis Demo (R / metafor)
# Outputs:
# - outputs/figures/forest_plot.png
# - outputs/figures/funnel_plot.png
# - outputs/tables/summary.txt
# - outputs/tables/leave_one_out.csv
#
# First time only:
# install.packages("metafor")

suppressPackageStartupMessages(library(metafor))

dir.create("outputs/figures", showWarnings = FALSE, recursive = TRUE)
dir.create("outputs/tables", showWarnings = FALSE, recursive = TRUE)

dat <- read.csv("data/processed/studies.csv")

# Random-effects meta-analysis (REML)
m <- rma(yi = dat$yi, sei = dat$sei, method = "REML")

# Forest plot
png("outputs/figures/forest_plot.png", width = 1400, height = 900)
forest(m, slab = dat$study, xlab = "Effect size (yi)")
dev.off()

# Funnel plot
png("outputs/figures/funnel_plot.png", width = 1400, height = 900)
funnel(m, xlab = "Effect size (yi)")
dev.off()

# Simple small-study/publication bias check (Egger-type)
bias <- tryCatch(regtest(m, model = "rma"), error = function(e) e)

# Leave-one-out sensitivity
loo <- leave1out(m)
write.csv(loo, "outputs/tables/leave_one_out.csv", row.names = FALSE)

# Save text outputs
sink("outputs/tables/summary.txt")
cat("Reproducible Meta-analysis Demo (R / metafor)\n")
cat("Run date: ", as.character(Sys.Date()), "\n\n", sep="")
cat("Model: Random-effects (REML)\n\n")
print(summary(m))
cat("\n---\nBias test (regtest):\n")
print(bias)
cat("\n---\nLeave-one-out saved to outputs/tables/leave_one_out.csv\n")
sink()

cat("Done! See outputs/figures and outputs/tables\n")
