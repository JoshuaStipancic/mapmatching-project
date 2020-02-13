# Introduction to Probabilistic Map Matching (Fast)

## Algorithm Description
This algorithm provides map matching using a "fast" Hidden Markov Model" (HMM) method. This algorithm adopts a modified version of *GraphHopper* created by Peter Karich. The algorithm implements both the GraphHopper routing engine (https://github.com/graphhopper/graphhopper) and map matching procedures (https://github.com/graphhopper/map-matching/). GraphHopper improves computational times over conventional HMM algorithms by implementing one of several shortest path algorithms. The four considered in this code are:

* A-STAR
* Bidirectional A-STAR
* Dijkstra
* Bidirectional Dijkstra

## Publications
Koller, H. Fast Hidden Markov Model MapMatching for Spare and Noisy Trajectories. *2015 IEEE 18th International Conference on Intelligent Transportation Systems*, 2015.

# Run the Probabilistic Map Matching (Fast) Algorithm
1a. An archived version of *GraphHopper* (along with other required java classes) is provided (prebuilt) in the folder *Code/jar/*
1b. Advanced users can download *GraphHopper* and *GraphHopper MapMatching* directly and built them using Maven. The code is designed to work with Version 0.10.
2. Run the main algorithm file, *Code/RunFastHMM.java*.
3. Results are stored in individual folders by routing algorithm name (i.e.*Results - astar/*).

# Licensing
*GraphHopper* is provided under the Apache License (https://www.apache.org/licenses/LICENSE-2.0).


