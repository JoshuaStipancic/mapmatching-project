import MeasureAccuracy
import AdjustTime
import CompileResults
import subprocess

# Initial data processing is handled using Python
# -----------------------------------------------
# Compute accuracy measures by comparing map matched data to ground truth
MeasureAccuracy
# Adjust measured run times by file length (MAY BE REMOVED IN FINAL VERSION)
AdjustTime
# Compile performance measures into individual files (useful for troubleshooting)
CompileResults

# Final data processing and analysis is handled using R
# -----------------------------------------------------
# Compile all performance measures into single data file
subprocess.check_call(['Rscript', 'CreateAnalysisData.R'], shell=False)
# Create analysis box, line, and scatter plots
subprocess.check_call(['Rscript', 'GeneratePlots.R'], shell=False)
# Run and output required ANOVA tests
subprocess.check_call(['Rscript', 'ANOVA.R'], shell=False)

