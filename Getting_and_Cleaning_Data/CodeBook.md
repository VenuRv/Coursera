this code book explain the algorithm and variables


download project data sets from the provided URL and extract.

Algorithm
	read the features store them 
	read the training data set (y_train,x_train, subject_training) 
	combine (cbind) all the three data set into training data set.
	read the test data set (y_test.x_test, subject_test)
	combine (cbind) all the three data set into test data set.
	
	using rbind combine test and training date set - (ask 1 from the project)

	from the above combined data set only select column names (variables) that are ending with mean and std by using matches function. the reason I picked ending in mean and std is because all other column name occurences of mean and std not actually mean or std there are used as part of the variable ex: "angle(Z,gravityMean)"  - (ask 2 from the project)

	replace the activity numbers with activity names, I used match function to change activity numbers to name - (ask 3 from the project)
	
	use aggregate function to find the mean of all the variables in the measure data set from ask 2.

	Write the the file into the file system as csv file

Variables 

	abs_dir: stores the parent directory structure where the data set was extracted into
	filename: store filename(s)
	dir: stores the complete directory structure with the filename
	colname: stores the feature/variable names - transposed
	traningAct: Stores the training data set activities
	Subtrain: Stores the trianing data set subjects
	trainingData: Stores the complete training data set readings from x_train.txt file, subjects and activities
        testAct: Stores the testing data set activities
	Subtest: Stores the testing data set subjects
	testData: Stores the complete testing data set readings from x_test.txt file, subjects and activities
      	mergedData: stores the combined data from test and training
	meanData: Stores variable data that ends with mean() 
	stdData: Stores variable data that ends with std()
	measureData: stores the combined mean and std data
	ActLabels: Stores the activity id and labels respectivity
	tidyData: Stores the mean of the measure data        
       


        

