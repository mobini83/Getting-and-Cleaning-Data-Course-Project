# Getting and Cleaning Data: Course Project: Codebook
mobini83 (github id)  
24-Oct-2015  

## Project Description
The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set. The final goal is to prepare tidy data that can be used for later analysis.

##Study design and data processing

###Collection of the raw data
The specific data used in this project are downloaded from following link (accessed 21 October 2015):
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Notes on the original (raw) data 
The original data including the data used in this project can be accessed through: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The use of the data set is acknowledged from the following publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. 

##Creating the tidy datafile

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/
The prepration of the tidy data is conducted by following steps:
1. Downloaded the raw data from the given link.  
2. After briefing the data sets and getting familiar with the data sets, the test and train data sets are merged. Activity labels and subject columns are also added to the data frame to create a wide set of data.  
3. The variabels with specifict strings of `mean()` and `std()` are considered as meand and std of measurement data and are extracted from the rest.  
4. Descriptive activity names from the `features.txt` file are read and assigned as a column in the data set corresponding to the `activityid` variable.  
5. The variable names in the prepared data set are refined to conform with the guidlines of the course notes. Capital letters are removed and undesired characters are eliminaed.   
6. The wide data set created in the previous steps is melted to a long data set based on the subject and activity as the identifiers. Then this data set is converted to a wide data set with the mean as the aggregation function so that for each suject and each activity average of the measurement data is reported.  
7. an output txt file is created that contains the tidy data set ready for further analysis. 

###Cleaning of the data
Since there are separate files for different sets of data, first of all the data are merged together to form a tidy and wide set of data which includes the subject id, activity id, and measurement data for all the variables of interest. Then the scope is limited to the average and standard deviation of the measurement data. The descriptive variable names are assigned in the tidy data frame so that debugging efforts can be minimized. Finally, the averages of the data for each subject and for each activity are calculated and stored in an independent tidy data set. 
For detailed information on these steps refer to the associated [readme.md](https://github.com/mobini83/Getting-and-Cleaning-Data-Course-Project/blob/master/README.md) file.

###Units 
The measurement data in the original data sets were normalized and have no units. The same is true for the averages reported in the `output.txt` file. 

##Description of the variables in the output.txt file
- The tidy data set that is prepared for this project has 69 columns and 180 rows.  

```
## [1] 180  69
```
- a summary of the data is as follows

```
##     subject       activityid               activity  tbodyaccmeanx   
##  Min.   : 1.0   Min.   :1.0   laying           :30   Min.   :0.2216  
##  1st Qu.: 8.0   1st Qu.:2.0   sitting          :30   1st Qu.:0.2712  
##  Median :15.5   Median :3.5   standing         :30   Median :0.2770  
##  Mean   :15.5   Mean   :3.5   walking          :30   Mean   :0.2743  
##  3rd Qu.:23.0   3rd Qu.:5.0   walkingdownstairs:30   3rd Qu.:0.2800  
##  Max.   :30.0   Max.   :6.0   walkingupstairs  :30   Max.   :0.3015  
##  tbodyaccmeany       tbodyaccmeanz       tbodyaccstdx    
##  Min.   :-0.040514   Min.   :-0.15251   Min.   :-0.9961  
##  1st Qu.:-0.020022   1st Qu.:-0.11207   1st Qu.:-0.9799  
##  Median :-0.017262   Median :-0.10819   Median :-0.7526  
##  Mean   :-0.017876   Mean   :-0.10916   Mean   :-0.5577  
##  3rd Qu.:-0.014936   3rd Qu.:-0.10443   3rd Qu.:-0.1984  
##  Max.   :-0.001308   Max.   :-0.07538   Max.   : 0.6269  
##   tbodyaccstdy       tbodyaccstdz     tgravityaccmeanx  tgravityaccmeany  
##  Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.6800   Min.   :-0.47989  
##  1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.: 0.8376   1st Qu.:-0.23319  
##  Median :-0.50897   Median :-0.6518   Median : 0.9208   Median :-0.12782  
##  Mean   :-0.46046   Mean   :-0.5756   Mean   : 0.6975   Mean   :-0.01621  
##  3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.: 0.9425   3rd Qu.: 0.08773  
##  Max.   : 0.61694   Max.   : 0.6090   Max.   : 0.9745   Max.   : 0.95659  
##  tgravityaccmeanz   tgravityaccstdx   tgravityaccstdy   tgravityaccstdz  
##  Min.   :-0.49509   Min.   :-0.9968   Min.   :-0.9942   Min.   :-0.9910  
##  1st Qu.:-0.11726   1st Qu.:-0.9825   1st Qu.:-0.9711   1st Qu.:-0.9605  
##  Median : 0.02384   Median :-0.9695   Median :-0.9590   Median :-0.9450  
##  Mean   : 0.07413   Mean   :-0.9638   Mean   :-0.9524   Mean   :-0.9364  
##  3rd Qu.: 0.14946   3rd Qu.:-0.9509   3rd Qu.:-0.9370   3rd Qu.:-0.9180  
##  Max.   : 0.95787   Max.   :-0.8296   Max.   :-0.6436   Max.   :-0.6102  
##  tbodyaccjerkmeanx tbodyaccjerkmeany    tbodyaccjerkmeanz  
##  Min.   :0.04269   Min.   :-0.0386872   Min.   :-0.067458  
##  1st Qu.:0.07396   1st Qu.: 0.0004664   1st Qu.:-0.010601  
##  Median :0.07640   Median : 0.0094698   Median :-0.003861  
##  Mean   :0.07947   Mean   : 0.0075652   Mean   :-0.004953  
##  3rd Qu.:0.08330   3rd Qu.: 0.0134008   3rd Qu.: 0.001958  
##  Max.   :0.13019   Max.   : 0.0568186   Max.   : 0.038053  
##  tbodyaccjerkstdx  tbodyaccjerkstdy  tbodyaccjerkstdz   tbodygyromeanx    
##  Min.   :-0.9946   Min.   :-0.9895   Min.   :-0.99329   Min.   :-0.20578  
##  1st Qu.:-0.9832   1st Qu.:-0.9724   1st Qu.:-0.98266   1st Qu.:-0.04712  
##  Median :-0.8104   Median :-0.7756   Median :-0.88366   Median :-0.02871  
##  Mean   :-0.5949   Mean   :-0.5654   Mean   :-0.73596   Mean   :-0.03244  
##  3rd Qu.:-0.2233   3rd Qu.:-0.1483   3rd Qu.:-0.51212   3rd Qu.:-0.01676  
##  Max.   : 0.5443   Max.   : 0.3553   Max.   : 0.03102   Max.   : 0.19270  
##  tbodygyromeany     tbodygyromeanz     tbodygyrostdx     tbodygyrostdy    
##  Min.   :-0.20421   Min.   :-0.07245   Min.   :-0.9943   Min.   :-0.9942  
##  1st Qu.:-0.08955   1st Qu.: 0.07475   1st Qu.:-0.9735   1st Qu.:-0.9629  
##  Median :-0.07318   Median : 0.08512   Median :-0.7890   Median :-0.8017  
##  Mean   :-0.07426   Mean   : 0.08744   Mean   :-0.6916   Mean   :-0.6533  
##  3rd Qu.:-0.06113   3rd Qu.: 0.10177   3rd Qu.:-0.4414   3rd Qu.:-0.4196  
##  Max.   : 0.02747   Max.   : 0.17910   Max.   : 0.2677   Max.   : 0.4765  
##  tbodygyrostdz     tbodygyrojerkmeanx tbodygyrojerkmeany
##  Min.   :-0.9855   Min.   :-0.15721   Min.   :-0.07681  
##  1st Qu.:-0.9609   1st Qu.:-0.10322   1st Qu.:-0.04552  
##  Median :-0.8010   Median :-0.09868   Median :-0.04112  
##  Mean   :-0.6164   Mean   :-0.09606   Mean   :-0.04269  
##  3rd Qu.:-0.3106   3rd Qu.:-0.09110   3rd Qu.:-0.03842  
##  Max.   : 0.5649   Max.   :-0.02209   Max.   :-0.01320  
##  tbodygyrojerkmeanz  tbodygyrojerkstdx tbodygyrojerkstdy tbodygyrojerkstdz
##  Min.   :-0.092500   Min.   :-0.9965   Min.   :-0.9971   Min.   :-0.9954  
##  1st Qu.:-0.061725   1st Qu.:-0.9800   1st Qu.:-0.9832   1st Qu.:-0.9848  
##  Median :-0.053430   Median :-0.8396   Median :-0.8942   Median :-0.8610  
##  Mean   :-0.054802   Mean   :-0.7036   Mean   :-0.7636   Mean   :-0.7096  
##  3rd Qu.:-0.048985   3rd Qu.:-0.4629   3rd Qu.:-0.5861   3rd Qu.:-0.4741  
##  Max.   :-0.006941   Max.   : 0.1791   Max.   : 0.2959   Max.   : 0.1932  
##  tbodyaccmagmean   tbodyaccmagstd    tgravityaccmagmean tgravityaccmagstd
##  Min.   :-0.9865   Min.   :-0.9865   Min.   :-0.9865    Min.   :-0.9865  
##  1st Qu.:-0.9573   1st Qu.:-0.9430   1st Qu.:-0.9573    1st Qu.:-0.9430  
##  Median :-0.4829   Median :-0.6074   Median :-0.4829    Median :-0.6074  
##  Mean   :-0.4973   Mean   :-0.5439   Mean   :-0.4973    Mean   :-0.5439  
##  3rd Qu.:-0.0919   3rd Qu.:-0.2090   3rd Qu.:-0.0919    3rd Qu.:-0.2090  
##  Max.   : 0.6446   Max.   : 0.4284   Max.   : 0.6446    Max.   : 0.4284  
##  tbodyaccjerkmagmean tbodyaccjerkmagstd tbodygyromagmean 
##  Min.   :-0.9928     Min.   :-0.9946    Min.   :-0.9807  
##  1st Qu.:-0.9807     1st Qu.:-0.9765    1st Qu.:-0.9461  
##  Median :-0.8168     Median :-0.8014    Median :-0.6551  
##  Mean   :-0.6079     Mean   :-0.5842    Mean   :-0.5652  
##  3rd Qu.:-0.2456     3rd Qu.:-0.2173    3rd Qu.:-0.2159  
##  Max.   : 0.4345     Max.   : 0.4506    Max.   : 0.4180  
##  tbodygyromagstd   tbodygyrojerkmagmean tbodygyrojerkmagstd
##  Min.   :-0.9814   Min.   :-0.99732     Min.   :-0.9977    
##  1st Qu.:-0.9476   1st Qu.:-0.98515     1st Qu.:-0.9805    
##  Median :-0.7420   Median :-0.86479     Median :-0.8809    
##  Mean   :-0.6304   Mean   :-0.73637     Mean   :-0.7550    
##  3rd Qu.:-0.3602   3rd Qu.:-0.51186     3rd Qu.:-0.5767    
##  Max.   : 0.3000   Max.   : 0.08758     Max.   : 0.2502    
##  fbodyaccmeanx     fbodyaccmeany      fbodyaccmeanz      fbodyaccstdx    
##  Min.   :-0.9952   Min.   :-0.98903   Min.   :-0.9895   Min.   :-0.9966  
##  1st Qu.:-0.9787   1st Qu.:-0.95361   1st Qu.:-0.9619   1st Qu.:-0.9820  
##  Median :-0.7691   Median :-0.59498   Median :-0.7236   Median :-0.7470  
##  Mean   :-0.5758   Mean   :-0.48873   Mean   :-0.6297   Mean   :-0.5522  
##  3rd Qu.:-0.2174   3rd Qu.:-0.06341   3rd Qu.:-0.3183   3rd Qu.:-0.1966  
##  Max.   : 0.5370   Max.   : 0.52419   Max.   : 0.2807   Max.   : 0.6585  
##   fbodyaccstdy       fbodyaccstdz     fbodyaccjerkmeanx fbodyaccjerkmeany
##  Min.   :-0.99068   Min.   :-0.9872   Min.   :-0.9946   Min.   :-0.9894  
##  1st Qu.:-0.94042   1st Qu.:-0.9459   1st Qu.:-0.9828   1st Qu.:-0.9725  
##  Median :-0.51338   Median :-0.6441   Median :-0.8126   Median :-0.7817  
##  Mean   :-0.48148   Mean   :-0.5824   Mean   :-0.6139   Mean   :-0.5882  
##  3rd Qu.:-0.07913   3rd Qu.:-0.2655   3rd Qu.:-0.2820   3rd Qu.:-0.1963  
##  Max.   : 0.56019   Max.   : 0.6871   Max.   : 0.4743   Max.   : 0.2767  
##  fbodyaccjerkmeanz fbodyaccjerkstdx  fbodyaccjerkstdy  fbodyaccjerkstdz   
##  Min.   :-0.9920   Min.   :-0.9951   Min.   :-0.9905   Min.   :-0.993108  
##  1st Qu.:-0.9796   1st Qu.:-0.9847   1st Qu.:-0.9737   1st Qu.:-0.983747  
##  Median :-0.8707   Median :-0.8254   Median :-0.7852   Median :-0.895121  
##  Mean   :-0.7144   Mean   :-0.6121   Mean   :-0.5707   Mean   :-0.756489  
##  3rd Qu.:-0.4697   3rd Qu.:-0.2475   3rd Qu.:-0.1685   3rd Qu.:-0.543787  
##  Max.   : 0.1578   Max.   : 0.4768   Max.   : 0.3498   Max.   :-0.006236  
##  fbodygyromeanx    fbodygyromeany    fbodygyromeanz    fbodygyrostdx    
##  Min.   :-0.9931   Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9947  
##  1st Qu.:-0.9697   1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9750  
##  Median :-0.7300   Median :-0.8141   Median :-0.7909   Median :-0.8086  
##  Mean   :-0.6367   Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.7110  
##  3rd Qu.:-0.3387   3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.4813  
##  Max.   : 0.4750   Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.1966  
##  fbodygyrostdy     fbodygyrostdz     fbodyaccmagmean   fbodyaccmagstd   
##  Min.   :-0.9944   Min.   :-0.9867   Min.   :-0.9868   Min.   :-0.9876  
##  1st Qu.:-0.9602   1st Qu.:-0.9643   1st Qu.:-0.9560   1st Qu.:-0.9452  
##  Median :-0.7964   Median :-0.8224   Median :-0.6703   Median :-0.6513  
##  Mean   :-0.6454   Mean   :-0.6577   Mean   :-0.5365   Mean   :-0.6210  
##  3rd Qu.:-0.4154   3rd Qu.:-0.3916   3rd Qu.:-0.1622   3rd Qu.:-0.3654  
##  Max.   : 0.6462   Max.   : 0.5225   Max.   : 0.5866   Max.   : 0.1787  
##  fbodybodyaccjerkmagmean fbodybodyaccjerkmagstd fbodybodygyromagmean
##  Min.   :-0.9940         Min.   :-0.9944        Min.   :-0.9865     
##  1st Qu.:-0.9770         1st Qu.:-0.9752        1st Qu.:-0.9616     
##  Median :-0.7940         Median :-0.8126        Median :-0.7657     
##  Mean   :-0.5756         Mean   :-0.5992        Mean   :-0.6671     
##  3rd Qu.:-0.1872         3rd Qu.:-0.2668        3rd Qu.:-0.4087     
##  Max.   : 0.5384         Max.   : 0.3163        Max.   : 0.2040     
##  fbodybodygyromagstd fbodybodygyrojerkmagmean fbodybodygyrojerkmagstd
##  Min.   :-0.9815     Min.   :-0.9976          Min.   :-0.9976        
##  1st Qu.:-0.9488     1st Qu.:-0.9813          1st Qu.:-0.9802        
##  Median :-0.7727     Median :-0.8779          Median :-0.8941        
##  Mean   :-0.6723     Mean   :-0.7564          Mean   :-0.7715        
##  3rd Qu.:-0.4277     3rd Qu.:-0.5831          3rd Qu.:-0.6081        
##  Max.   : 0.2367     Max.   : 0.1466          Max.   : 0.2878
```
- The variables that are included in the data set are listed below. 

```
##  [1] "subject"                  "activityid"              
##  [3] "activity"                 "tbodyaccmeanx"           
##  [5] "tbodyaccmeany"            "tbodyaccmeanz"           
##  [7] "tbodyaccstdx"             "tbodyaccstdy"            
##  [9] "tbodyaccstdz"             "tgravityaccmeanx"        
## [11] "tgravityaccmeany"         "tgravityaccmeanz"        
## [13] "tgravityaccstdx"          "tgravityaccstdy"         
## [15] "tgravityaccstdz"          "tbodyaccjerkmeanx"       
## [17] "tbodyaccjerkmeany"        "tbodyaccjerkmeanz"       
## [19] "tbodyaccjerkstdx"         "tbodyaccjerkstdy"        
## [21] "tbodyaccjerkstdz"         "tbodygyromeanx"          
## [23] "tbodygyromeany"           "tbodygyromeanz"          
## [25] "tbodygyrostdx"            "tbodygyrostdy"           
## [27] "tbodygyrostdz"            "tbodygyrojerkmeanx"      
## [29] "tbodygyrojerkmeany"       "tbodygyrojerkmeanz"      
## [31] "tbodygyrojerkstdx"        "tbodygyrojerkstdy"       
## [33] "tbodygyrojerkstdz"        "tbodyaccmagmean"         
## [35] "tbodyaccmagstd"           "tgravityaccmagmean"      
## [37] "tgravityaccmagstd"        "tbodyaccjerkmagmean"     
## [39] "tbodyaccjerkmagstd"       "tbodygyromagmean"        
## [41] "tbodygyromagstd"          "tbodygyrojerkmagmean"    
## [43] "tbodygyrojerkmagstd"      "fbodyaccmeanx"           
## [45] "fbodyaccmeany"            "fbodyaccmeanz"           
## [47] "fbodyaccstdx"             "fbodyaccstdy"            
## [49] "fbodyaccstdz"             "fbodyaccjerkmeanx"       
## [51] "fbodyaccjerkmeany"        "fbodyaccjerkmeanz"       
## [53] "fbodyaccjerkstdx"         "fbodyaccjerkstdy"        
## [55] "fbodyaccjerkstdz"         "fbodygyromeanx"          
## [57] "fbodygyromeany"           "fbodygyromeanz"          
## [59] "fbodygyrostdx"            "fbodygyrostdy"           
## [61] "fbodygyrostdz"            "fbodyaccmagmean"         
## [63] "fbodyaccmagstd"           "fbodybodyaccjerkmagmean" 
## [65] "fbodybodyaccjerkmagstd"   "fbodybodygyromagmean"    
## [67] "fbodybodygyromagstd"      "fbodybodygyrojerkmagmean"
## [69] "fbodybodygyrojerkmagstd"
```

####subject
This variable identifies the subject of the test. Its class is integer. It ranges between 1 to 30. 

####activityid
This variable indicates the activity id. There are 6 activities considered in this data set. 

####activity 
This is a character variable corresponding to the activity id variable and names the activity that is measured. 

####Other variables in the data set
The rest of the variables are the averages of the variables that are included in the final data set. For more informaion on these variables see the `readme.md` file along with the original files in the raw data set in the zip folder downloaded from the project's web page (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).  
