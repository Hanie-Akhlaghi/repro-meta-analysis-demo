# Reproducible Meta-analysis Demo (R / metafor)

## Project in 5 lines
- **Goal:** demonstrate a minimal **reproducible evidence synthesis / meta-analysis** workflow.
- **Data:** `data/processed/studies.csv` (public **toy/synthetic** study-level effect sizes; **no confidential data**).
- **Method:** random-effects meta-analysis (**REML**), plus funnel plot, bias test, and leave-one-out sensitivity.
- **Outputs:** forest plot + funnel plot + summary table(s) saved under `outputs/`.
- **Tools:** R + `metafor`.

## Folder structure
- `data/raw/` and `data/processed/` — input data
- `scripts/analysis.R` — single-click script that generates all outputs
- `outputs/figures/` — forest plot, funnel plot
- `outputs/tables/` — model summary, leave-one-out table
- `report/` — (optional) place an HTML/PDF report here

## How to run (3 steps)
1) Install R  
2) Install package (first time only):
```r
install.packages("metafor")
```
3) From the repo root, run:
```r
source("scripts/analysis.R")
```

## Outputs (generated)
- `outputs/figures/forest_plot.png`
- `outputs/figures/funnel_plot.png`
- `outputs/tables/summary.txt`
- `outputs/tables/leave_one_out.csv`

## What this demonstrates
- PRISMA mindset: structured inputs/outputs, reasoned workflow separation (`raw` → `processed` → `outputs`)
- QC & reporting: bias check + sensitivity analysis
- Reproducibility: one script regenerates the same outputs from the same inputs

## Disclaimer
This repository uses **public/toy synthetic data** for demonstration purposes only.
