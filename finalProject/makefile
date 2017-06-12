execute_commands:
	export HADOOP_CLASSPATH=$(hadoop classpath)
	hadoop jar jarFiles/getUsers.jar GetUsers /Tweets/InputFiles/archivosFInales /Tweets/OutputFiles/getUsers
	hadoop jar jarFiles/getWords.jar GetWords /Tweets/InputFiles/archivosFInales /Tweets/OutputFiles/getWords
	hadoop jar jarFiles/getHashtags.jar GetHashtags /Tweets/InputFiles/archivosFInales /Tweets/OutputFiles/getHashtags
	hadoop jar jarFiles/getDistributionTime.jar GetDistributionTime /Tweets/InputFiles/archivosFInales /Tweets/OutputFiles/getDistributionTime
	hadoop jar jarFiles/getRelatedHashtags.jar GetRelatedHashtags /Tweets/InputFiles/archivosFInales /Tweets/OutputFiles/getRelatedHashtags
	hadoop dfs -get /Tweets/OutputFiles/* output_folders/
	mv output_folders/getUsers/totalUsers-r-00000 output_data/output1.json
	mv output_folders/getWords/totalWords-r-00000 output_data/output2.json
	mv output_folders/getHashtags/totalHashtags-r-00000 output_data/output3.json
	mv output_folders/getDistributionTime/distributionTime-r-00000 output_data/output4.json
	mv output_folders/getRelatedHashtags/totalRelatedHashtags-r-00000 output_data/output5.json
	rm -R output_folders/*
	java ModifyFiles
	php phpDocuments/index1.php
	php phpDocuments/index2.php
	php phpDocuments/index3.php
	php phpDocuments/index4.php
	php phpDocuments/index5.php
	hadoop fs -rm -R /Tweets/OutputFiles/*
