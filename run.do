# Start the simulation with read access for all signals
vsim +access+r;

# Run the simulation until all the testbench operations are completed
run -all;

# Save the coverage database to a file called fcover.acdb
acdb save;

# Generate a text report of the coverage results from the coverage database
acdb report -db fcover.acdb -txt -o cov.txt -verbose;

# Display the content of the coverage text report in the console
exec cat cov.txt;

# Generate an HTML report of the coverage results from the coverage database
acdb report -db fcover.acdb -html -o cov.html -verbose;

# Display the content of the coverage HTML report in the console
exec cat cov.html;

# Exit the simulation environment after all operations are complete
exit;
