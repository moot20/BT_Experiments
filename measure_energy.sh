#!/bin/bash

# Define the CSV file
CSVFILE="energy_consumption_log.csv"

# Write the header to the CSV file
echo "Run,File,Energy_pkg_Joules,Energy_psys_Joules,Time_elapsed_seconds" > $CSVFILE

# Function to run the measurement for a given file
measure_energy() {
    local FILEPATH=$1
    local FILENAME=$(basename $FILEPATH)
    local INTERPRETER=$2

    for i in {1..50}
    do
        # Run the command and capture the output
        OUTPUT=$(sudo perf stat -e power/energy-pkg/ -e power/energy-psys/ $INTERPRETER $FILEPATH 2>&1)
        
        # Extract the values from the output
        ENERGY_PKG=$(echo "$OUTPUT" | grep "power/energy-pkg/" | awk '{print $1}')
        ENERGY_PSYS=$(echo "$OUTPUT" | grep "power/energy-psys/" | awk '{print $1}')
        TIME_ELAPSED=$(echo "$OUTPUT" | grep "seconds time elapsed" | awk '{print $1}')
        
        # Append the results to the CSV file
        echo "$i,$FILENAME,$ENERGY_PKG,$ENERGY_PSYS,$TIME_ELAPSED" >> $CSVFILE
    done
}

# Measure energy for Python files
measure_energy "./Python/SVM.py" "./venv/bin/python"
measure_energy "./Python/RF.py" "./venv/bin/python"

# Measure energy for R files
measure_energy "./R/SVM.R" "Rscript"
measure_energy "./R/RF.R" "Rscript"

echo "Completed 50 runs for each file. Logs are saved in $CSVFILE"
