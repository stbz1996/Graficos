<?php
$db = new PDO('mysql:host=localhost;dbname=proyecto','root','1234');

$jsondata = file_get_contents('/home/jorge/Desktop/finalProject/output_data/output3.json');
$data = json_decode($jsondata, true);

$stmt = $db->prepare("insert into NewHashtag (hashtag, newHashtag, total) values (?,?,?)");

foreach ($data as $row) {
	foreach ($row['TotalHashtags'] as $hashtags){
		$stmt->bindParam(1, $row['Hashtag']);
		$stmt->bindParam(2, $hashtags['Tag']);
		$stmt->bindParam(3, $hashtags['total']);
		$stmt->execute();	
	}
	# Size of table
	#$stmt->bindParam(1, $row['Hashtag']);
	#$stmt->bindParam(2, $row['TotalUsers']);
	#$stmt->bindParam(3, $row['TotalTweets']);
	
	#$stmt->execute();
	# code...
}
?>
