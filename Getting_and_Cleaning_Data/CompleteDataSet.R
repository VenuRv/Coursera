library(dplyr)        
        abs_dir <- "C:/Projects/2014/R/Getting and Cleaning data/UCI HAR Dataset/"
## Create variable names
        filename <- "features.txt"
        dir <- paste(abs_dir,filename,sep="")
        colname <- read.table(dir,sep=" ",col.names=c("id","name"))
        name<-t(colname$name)

##### Create training data    
        filename <- "train/y_train.txt"
        dir <- paste(abs_dir,filename,sep="")
        trainingAct <- read.table(dir,sep="\t",col.names=c("id"))


        filename <- "train/subject_train.txt"
        dir <- paste(abs_dir,filename,sep="")
        Subtrain <- read.table(dir,sep="\t",col.names=c("Subject"))

        filename <- "train/X_train.txt"
        dir <- paste(abs_dir,filename,sep="")
        trainingData <- read.table(dir,header=FALSE, strip.white=TRUE,col.names=name)
        
        trainingData <- cbind(Subtrain,trainingAct,trainingData)
        
### Create testing data
        filename <- "test/y_test.txt"
        dir <- paste(abs_dir,filename,sep="")
        testAct <- read.table(dir,sep="\t",col.names=c("id"))

        filename <- "test/subject_test.txt"
        dir <- paste(abs_dir,filename,sep="")
        Subtest <- read.table(dir,sep="\t",col.names=c("Subject"))

        filename <- "test/X_test.txt"
        dir <- paste(abs_dir,filename,sep="")
        testData <- read.table(dir,header=FALSE, strip.white=TRUE, col.names=name)
        testData <- cbind(Subtest,testAct,testData)

###Create merged data 
        mergedData <- rbind(testData,trainingData)

#### Create mean and Std data
        meanData<- select(mergedData,contains(".mean.."))
        stdData <- select(mergedData,contains(".std.."))
        measureData <- cbind(mergedData$Subject,mergedData$id,meanData,stdData)
        colnames(measureData)[1] <- "Subject"
        colnames(measureData)[2] <- "Activity"
        
       
#### renaming activities
        id <- c(1,2,3,4,5,6)
        Labels <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
        ActLabels <- data.frame(id,Labels)
        measureData$Activity <- ActLabels[match(measureData$Activity,ActLabels$id),2]

#### mean of all variables groups by subject and activity
        tidyData <- aggregate(measureData, by=list(measureData$Subject,measureData$Activity),FUN="mean")
        colnames(tidyData)[1]<- "Subject"
        colnames(tidyData)[2]<- "Activity"
        tidyData[3] <- NULL
        tidyData[3]<-NULL
                write.table(tidyData,"C:/Projects/2014/R/Getting and Cleaning data/tidyData.txt",row.names=FALSE)
        

