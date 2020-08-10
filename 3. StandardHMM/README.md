# Introduction to Probabilistic Map Matching (Viterbi)

## Algorithm Description
This algorithm provides map matching using a "conventional" Hidden Markov Model" (HMM) method with a Viterbi algorithm. This algorithm adopts a modified version of the Python library *map-matching* created by Mapillary (https://github.com/mapillary/map_matching). *map_matching* associates a GPS trajectory to the OSM road network considering both road network topology and spatial relations. 

## Publications
*No known publications.*

# Run the Probabilistic Map Matching (Viterbi) Algorithm 
1. In order to use the ViterbiHMM algorithm, the mapping data must be built in PostGIS using the tool *osm2pgrouting* (https://github.com/pgRouting/osm2pgrouting). Please follow all instructions, and use the mapping data contained in *Code/osm2pgrouting-master/build/montreal-latest.osm.pbf* to create the database.
2. Run the main algorithm file, *Code/RunFastHMM.java*.
3. Results are stored in the folder *Results/*.

# Licensing
*map_matching* is provided under the Berkeley Source Distribution (BSD) license (https://whatis.techtarget.com/definition/BSD-licenses).
