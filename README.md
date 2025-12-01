# Meta-analysis Mini (R / metafor)

A minimal reproducible random-effects meta-analysis workflow (public demo dataset).

## Folder structure
- `data/studies.csv` — demo study-level effect sizes (`yi`) + standard errors (`sei`)
- `analysis.R` — runs the meta-analysis and saves outputs
- `results/` — generated outputs

## How to run
1) Install R (any recent version)
2) In R, install package (first time only):
```r
install.packages("metafor")
```
3) Run from the repo folder:
```r
source("analysis.R")
```

## Outputs
- `results/forest_plot.png`
- `results/summary.txt`

## Notes
This repo is a demonstration of reproducible analysis using a public, toy dataset (no confidential data).
