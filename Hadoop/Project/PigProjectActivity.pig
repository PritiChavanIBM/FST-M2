-- Load data from HDFS
inputDialouges = LOAD 'hdfs:///user/root/inputs' USING PigStorage('\t') AS (name:chararray, line:chararray);

-- Filter out the first 2 lines
ranked = RANK inputDialouges;
OnlyDialouges = FILTER ranked BY (rank_inputDialouges > 2);

-- Group by name
groupByName = GROUP OnlyDialouges BY name;

-- Count the number of lines by each character
names = FOREACH groupByName GENERATE $0 as name, COUNT($1) as no_of_lines;
namesOrdered = ORDER names BY no_of_lines DESC;

-- Remove the outputs folder
rmf hdfs:///user/root/outputs

-- Store result in HDFS
STORE namesOrdered INTO 'hdfs:///user/root/outputs' USING PigStorage('\t');