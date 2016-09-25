# Code Book

This code book describes data fields in `tidydata.txt` and operations performed with run_analysis.R script

### Identifiers

* subjectid - The test subject ID
* activitytype - The type of activity performed when measurements were taken
    * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

### Measurements (mean for each subject and activity)

* time_bodyaccelerator-mean-x
* time_bodyaccelerator-mean-y
* time_bodyaccelerator-mean-z
* time_bodyaccelerator-std-x
* time_bodyaccelerator-std-y
* time_bodyaccelerator-std-z
* time_gravityaccelerator-mean-x
* time_gravityaccelerator-mean-y
* time_gravityaccelerator-mean-z
* time_gravityaccelerator-std-x
* time_gravityaccelerator-std-y
* time_gravityaccelerator-std-z
* time_bodyacceleratorjerk-mean-x
* time_bodyacceleratorjerk-mean-y
* time_bodyacceleratorjerk-mean-z
* time_bodyacceleratorjerk-std-x
* time_bodyacceleratorjerk-std-y
* time_bodyacceleratorjerk-std-z
* time_bodygyroscope-mean-x
* time_bodygyroscope-mean-y
* time_bodygyroscope-mean-z
* time_bodygyroscope-std-x
* time_bodygyroscope-std-y
* time_bodygyroscope-std-z
* time_bodygyroscopejerk-mean-x
* time_bodygyroscopejerk-mean-y
* time_bodygyroscopejerk-mean-z
* time_bodygyroscopejerk-std-x
* time_bodygyroscopejerk-std-y
* time_bodygyroscopejerk-std-z
* time_bodyacceleratormagnitude-mean
* time_bodyacceleratormagnitude-std
* time_gravityacceleratormagnitude-mean
* time_gravityacceleratormagnitude-std
* time_bodyacceleratorjerkmagnitude-mean
* time_bodyacceleratorjerkmagnitude-std
* time_bodygyroscopemagnitude-mean
* time_bodygyroscopemagnitude-std
* time_bodygyroscopejerkmagnitude-mean
* time_bodygyroscopejerkmagnitude-std
* frequency_bodyaccelerator-mean-x
* frequency_bodyaccelerator-mean-y
* frequency_bodyaccelerator-mean-z
* frequency_bodyaccelerator-std-x
* frequency_bodyaccelerator-std-y
* frequency_bodyaccelerator-std-z
* frequency_bodyacceleratorjerk-mean-x
* frequency_bodyacceleratorjerk-mean-y
* frequency_bodyacceleratorjerk-mean-z
* frequency_bodyacceleratorjerk-std-x
* frequency_bodyacceleratorjerk-std-y
* frequency_bodyacceleratorjerk-std-z
* frequency_bodygyroscope-mean-x
* frequency_bodygyroscope-mean-y
* frequency_bodygyroscope-mean-z
* frequency_bodygyroscope-std-x
* frequency_bodygyroscope-std-y
* frequency_bodygyroscope-std-z
* frequency_bodyacceleratormagnitude-mean
* frequency_bodyacceleratormagnitude-std
* frequency_bodyacceleratorjerkmagnitude-mean
* frequency_bodyacceleratorjerkmagnitude-std
* frequency_bodygyroscopemagnitude-mean
* frequency_bodygyroscopemagnitude-std
* frequency_bodygyroscopejerkmagnitude-mean
* frequency_bodygyroscopejerkmagnitude-std

##Script description
1. Set working environment to perform data transfromation
2. Download the dataset and read it into R
3. Load the activity and feature data from downloaded files
4. assingns names for variables in test and training datasets
5. Merges the datasets
6. subsets columns with mean or standard deviations
7. transforms variables names to mor understandable
8. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
9. Exports result to file tidydata.txt.
