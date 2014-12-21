# run_analysis.R 


## new dataset\s

dim(tidydata)

[1] 181  68

## Variables: of tidy dataset
The set of variables that were estimated from these signals are:

mean: Mean value

std: Standard deviation

1 subject         activity tBodyAcc-mean()-X   tBodyAcc-mean()-Y \\
2       1          WALKING 0.277330758736842 -0.0173838185273684 \\
3       1 WALKING UPSTAIRS 0.255461689622641 -0.0239531492643396 \\

V5                 V6                   V7 \\
1   tBodyAcc-mean()-Z   tBodyAcc-std()-X     tBodyAcc-std()-Y \\
2  -0.111148103547368 -0.283740258842105    0.114461336747368 \\
3 -0.0973020020943396  -0.35470802509434 -0.00232026501698113 \\

etc .... and more values are means, aggregated over 30 types  and 6 activities.


