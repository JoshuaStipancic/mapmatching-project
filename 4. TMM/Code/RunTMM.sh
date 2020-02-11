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

  # Run the map matching algorithm
  start=$(gdate +%s%3N)

  curl -X POST -H 'Content-Type: application/gpx+xml' -H 'Accept: application/json' --data-binary @"$f" "http://test.roadmatching.com/rest/mapmatch/?app_id=a80ebc48&app_key=4b1c7110f6674008f10e115e6daf40fe&output.waypoints=true" -o "../Results/$name3"

  # Calculate and ouput run time
  end=$(gdate +%s%3N)
  runTime=$(bc <<<"scale=3;($end-$start)/1000")

  name4="${name3//.csv/_time.txt}"
  echo "$runTime" > "../Results/$name4"

  # Create temporary results file
  name5="${name3//.csv/_full.csv}"
  tr '{' '\n' < "../Results/$name3" > "../Results/$name5"

  # Read temporary file and format full output
  declare -i i=1
  newLine=
  while IFS=',' read -r f1 f2
   do
    if [[ $f1 == *id* ]];
    then
      id="${f1//[!0-9,.,-]/}"
    elif [[ $f1 == *x* ]];
    then
      x="${f1//[!0-9,.,-]/}"
      y="${f2//[!0-9,.,-]/}"
      y="${y//,/}" #not sure why this is happening?
      newLine=$newLine$i','$y','$x','$id'\n'
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