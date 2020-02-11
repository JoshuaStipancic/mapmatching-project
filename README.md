# Introduction the the MapMatching Project

Location-Based Services (LBS) in land navigation systems rely mostly on global positioning and global navigation satellite systems
 (referred to as GPS/GNSS) in smartphones for providing accurate and robust navigational solutions. However, GPS/GNSS accuracy is 
 strongly affected by interference, jamming and multipath errors, which depend mainly on environmental conditions. 
 The environmental noise prevents obtaining accurate localizations in tunnels, indoor-parking, urban tall buildings, 
 canyons, etc. To correct the inaccurate positions, several map-matching (MM) algorithms have been proposed in the last years; 
 MM methods have been integrated as part of the land-navigation solutions than a GPS standalone system can provide. 
 This study carefully revises and compares different map-matching methods and algorithms that can be divided in: 
 i) probabilistic map matching (PMM), 
 ii) geometrical map matching, 
 iii) FIS-based advanced MM, and 
 iv) topological map matching (TMM) methods. 

# General Steps for Generating Map Matching Results

1) For each of Algorithms 1-5, navigate to the "Code" folder.

2) Specific instructions for running each algorithm is contained in a separate README file located in the primary algorithm directory.

3) The implementation of each algorithm is contained in a file entitled "Run" followed by the algorithm abbreviation. For example in Algorithm 1, the script is located in 1. "AMM/Code/RunAMM.R" 

4) Generated results "Results" within the primary algorithm directory, where the results are stored using the same directory structure as the raw data. The exception to this is Algorithm 2, where results are stored in separate folders for each of the considered working algorithms. For example, for Algorithm 2 using Dijkstra's routing algorithm, the results are found in "2. FastHMM/Results - dijkstra". Outputs of the map matching algorithms include the map matched results and run times.

5) Run the python script to generate the accuracy measures. The script is located in the following directory: "mapmatching-project/Code - General".

6) Run the python script to compile the accuracy and run time metrics. This script is located in the following directory: "mapmatching-project/Code - General/CompileResults" This will generate two new folders: "Code - General/TimeResults" and "Code - General/AccuracyResults". Finally, analysis can be performed on the resulting files. 
 