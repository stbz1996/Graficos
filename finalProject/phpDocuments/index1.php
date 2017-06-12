<?php
$db = new PDO('mysql:host=localhost;dbname=proyecto','root','1234');

$jsondata = file_get_contents('/home/jorge/Desktop/finalProject/output_data/output1.json');
$data = json_decode($jsondata, true);

$stmt = $db->prepare("insert into Hashtag (hashtagName, countUsers, countTweets) values (?,?,?)");

foreach ($data as $row) {
	# Size of table
	$stmt->bindParam(1, $row['Hashtag']);
	$stmt->bindParam(2, $row['TotalUsers']);
	$stmt->bindParam(3, $row['TotalTweets']);
	
	$stmt->execute();
	# code...
}
?>
