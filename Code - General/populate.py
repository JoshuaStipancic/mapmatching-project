# ----------------------------------------------------------------------------
# Author:      Joshua Stipancic
# Date:        May 15, 2015
# Description: This file contains functions for reading and writing to .csv 
#              files.
# ----------------------------------------------------------------------------

import csv

# Function for reading data from a .csv file
def read (ffilename):
    # Open data file using csv.reader
    with open(ffilename, 'rU') as csvfile:
        reader = csv.reader(csvfile)
        # Create an empty list to populate
        llist = []
        # Loop through the data file appending each new row to the list
        for row in reader:
            llist.append(row)
        return llist

# Function for writing data to a .csv file
def write (ffilename, llist):
    # Open data file using csv.writer
    with open(ffilename, 'wb') as csvfile:
        writer = csv.writer (csvfile)
        # Write each row of the list to file
        for i in range (len(llist)):
            writer.writerow(llist[i])