# run_analysis.R 

## Original data files
UCI_HAR_Dataset

README.txt		activity_labels.txt	features.txt		features_info.txt	test			train

## new dataset\s

dim(tidydata)

[1] 181  68

## Variables: of tidy dataset
The set of variables that were estimated from these signals are:

mean: Mean value

std: Standard deviation

1 subject         activity tBodyAcc-mean()-X   tBodyAcc-mean()-Y 

2       1          WALKING 0.277330758736842 -0.0173838185273684 

3       1 WALKING UPSTAIRS 0.255461689622641 -0.0239531492643396 

etc .... and more values are means, aggregated over 30 types  and 6 activities.


