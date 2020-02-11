# OSRM is run on the local server using the command below in a separate terminal:
# osrm-backend/build/osrm-routed --algorithm=MLD osrm-backend/montreal-latest.osrm --max-matching-size=5000

# Read all gpx files from the data folder
files="../../Data/*/*/*/*.gpx"

# Loop through each file
for f in $files
  do

  # Format the directory name
  name1="${f//..\/..\/Data\//}"
  index=${name1##*/}
  name2="${name1//$index/}"
  
  # Create the necessary directory
  mkdir -p "../Results/$name2"
  
  # Create output file name
  name3="${name1//.gpx/.csv}"
  
  # Create blank string to hold coordinates
  coords=
  
  # Loop through each line in a single file
  while read -r line
  do
    # Find all lines which contain longitude and latitude
    if [[ $line == *lat=* ]];
    then
    
      # Delete all additional text from the line
      newLine1="${line//[!0-9,.,-]/}"
      newLine2="${newLine1//-/;-}"
       
      # Extract the longitude and latitude
      lon=${newLine2##*;}
      lat="${newLine2//$lon/}"
      lonlat=$lon','$lat
      
      # Append longitude and latitude to the string
      coords=$coords$lonlat
      
    fi
  done < "$f"
  
  # Run the map matching algorithm
  start=$(gdate +%s%3N)
  
  curl 'http://localhost:5000/match/v1/driving/'${coords%?}'?steps=false&overview=false&annotations=true' -o "../Results/$name3"
  
  # Calculate and ouput run time
  end=$(gdate +%s%3N)
  runTime=$(bc <<<"scale=3;($end-$start)/1000")
  
  name4="${name3//.csv/_time.txt}"
  echo "$runTime" > "../Results/$name4"
  
  # Create temporary results file
  name5="${name3//.csv/_full.csv}"
  tr '{' '\n' < "../Results/$name3" > "../Results/$name5"

  # Read temporary file and format final output  
  declare -i i=1
  newLine=
  while IFS=',' read -r f1 f2 f3 f4 f5 f6 f7 f8
  do
    if [[ $f1 == *location* ]];
    then
      x="${f1//[!0-9,.,-]/}"
      y="${f2//[!0-9,.,-]/}"
      osm="${f7//[!0-9,.,-]/}"
      newLine=$newLine$i','$y','$x','$osm'\n'
      i=$(( i + 1 ))
    fi
  done < "../Results/$name5"
  
  # Output full results file with proper format
  echo "$newLine" > "../Results/$name5"
  
  # Read the full output file and generate a list of only the OSM IDs
  declare -i i=1
  osmIDs=
  while IFS=',' read -r f1 f2 f3 f4
  do
      osmIDs+=("$f4")
      i=$(( i + 1 ))
  done < "../Results/$name5"

  # Loop through each observation
  # If the current link is different from the previous link, add the current link to the output list
  newLine=
  i=1
  while [ $i -lt ${#osmIDs[@]} ]
  do
    if [ "${osmIDs[i]}" != "${osmIDs[i+1]}" ]; then
      newLine=$newLine"${osmIDs[i]}"'\n'
    fi
    i=$(( i + 1 ))
  done
  
  # Output final results file with proper format
  echo "$newLine" > "../Results/$name3"
  
done