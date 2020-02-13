# Introduction to Hybrid Map Matching

## Algorithm Description
This algorithm provides map matching using hybrid topological/probabilistic map matching method. This algorithm uses a modified version of the Open Source Routing Machine (OSRM, https://github.com/Project-OSRM/osrm-backend)

## Publications
Luxen, D. and C. Vetter. Real-time routing with OpenStreetMap data. *Proceedings of the 19th ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems*, 2011.

# Run the Hybrid Map Matching Algorithm
1. OSRM is run on the local server using *osrm-backend/build/osrm-routed --algorithm=MLD osrm-backend/montreal-latest.osrm --max-matching-size=5000*.
2. Run the main script in *Code/RunHyMM.sh* in a separate terminal window.
3. Results are stored in the folder *Results/*.

# Licensing
The *Open Source Routing Machine* is provided under the Berkeley Source Distribution (BSD) license (https://whatis.techtarget.com/definition/BSD-licenses).


