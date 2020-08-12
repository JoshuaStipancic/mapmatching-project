import MeasureAccuracy
import AdjustTime
import CompileResults
import subprocess

# Initial data processing is handled using Python
# -----------------------------------------------
# Compute accuracy measures by comparing map matched data to ground truth
print("Computing accuracy measures ...")
MeasureAccuracy
# Adjust measured run times by file length (MAY BE REMOVED IN FINAL VERSION)
print("Normalizing runtimes ...")
AdjustTime
# Compile performance measures into individual files (useful for troubleshooting)
print("Compiling results ...")
CompileResults

# Final data processing and analysis is handled using R
# -----------------------------------------------------
# Compile all performance measures into single data file
print("Creating analysis data ...")
subprocess.check_call(['Rscript', 'CreateAnalysisData.R'], shell=False)
# Create analysis box, line, and scatter plots
print("Generating plots ...")
subprocess.check_call(['Rscript', 'GeneratePlots.R'], shell=False)
# catRun and output required ANOVA tests
print("Running ANOVA analysis ...")
subprocess.check_call(['Rscript', 'ANOVA.R'], shell=False)

