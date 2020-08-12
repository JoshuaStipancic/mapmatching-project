# Introduction to the MapMatching Project

The continuous monitoring and tracking of individuals is of great interest to many in the public and private sectors. The development of Global Navigation Satellite Systems (GNSS) has led to a dramatic increase in the number of location-based services (LBS) used to track the location of individuals or vehicles. GPS data accuracy is critical to provide accurate performance measures, yet the optimal operating conditions for GPS receivers are rarely experienced in the field. Tall buildings and other aspects of urban environments can completely block GPS signals or create spurious signals (the urban canyon effect) and radio frequency-based systems remain sensitive to interference, signal blocking, jamming, and multipath errors.

Obviously, obtaining reliable results in difficult environments requires a method to reduce or eliminate positional noise. Map matching is the process of estimating an individual’s position in the road network using their GPS trip data. The objective of this study is to evaluate the performance of several algorithms on smartphone GPS data in urban environments. Algorithms are compared based on accuracy (by comparing to ground truth route data) and computational time. Performance is compared across several types of smartphones, several data collection applications, and several environments in Montreal, Canada. Specifically, algorithms from four different map matching methodologies are considered including:

1) Topological Map Matching (TMM)
2) Probabilistic Map Matching (PMM, in both Standard and Fast variations)
3) Fuzzy Map Matching (FMM)
4) Hybrid Map Matching (HyMM) 

# General Steps for Generating Map Matching Results
1) For each of Algorithms 1-5, navigate to the "Code" folder.
2) Specific instructions for running each algorithm is contained in a separate README file located in the primary algorithm directory.
3) The implementation of each algorithm is contained in a file entitled "Run" followed by the algorithm abbreviation. For example in Algorithm 1, the script is located in 1. "FMM/Code/RunFMM.R" 
4) Generated results "Results" within the primary algorithm directory, where the results are stored using the same directory structure as the raw data. The exception to this is Algorithm 2, where results are stored in separate folders for each of the considered working algorithms. For example, for Algorithm 2 using Dijkstra's routing algorithm, the results are found in "2. FastHMM/Results - dijkstra". Outputs of the map matching algorithms include the map matched results and run times.
5) Run the python script "AnalyzeData.py" to produce the final results. The script is located in the following directory: "mapmatching-project/Code - General". This single file completes several steps: computing accuracy measures, normalizing run times, compiling results into a single data file, producing plots, and running ANOVA tests. All results are contained within the folder "mapmatching-project/Results".