<?php
$db = new PDO('mysql:host=localhost;dbname=proyecto','root','1234');

$jsondata = file_get_contents('/home/jorge/Desktop/finalProject/output_data/output5.json');
$data = json_decode($jsondata, true);

$stmt = $db->prepare("insert into RelatedHashtag( hashtag, relatedHashtag, total) values (?,?,?)");

foreach ($data as $row) {
	foreach($row['TotalHashtags'] as $hashtag){
		$stmt->bindParam(1,$row['Hashtag']);
		$stmt->bindParam(2,$hashtag['Tag']);
		$stmt->bindParam(3,$hashtag['total']);
		$stmt->execute();
		

	}

	#foreach ($row['TotalWords'] as $words){
	#	$stmt->bindParam(1, $words['Word']);
	#	$stmt->bindParam(2, $words['Total']);
	#	$stmt->bindParam(3, $row['Hashtag']);
	#	$stmt->execute();	
	#}
	# Size of tabe
	#$stmt->bindParam(1, $row['Hashtag']);
	#$stmt->bindParam(2, $row['TotalUsers']);
	#$stmt->bindParam(3, $row['TotalTweets']);
	
	#$stmt->execute();
	# code...
}
?>
