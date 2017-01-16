<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../mss.css">
	</head>
<body bgcolor="#FFFFFF">
<h1>What the duck? Why is it so ugly?</h1>
<p>I don't care yet. I just set it up</p>
<table style="width:100%">
	<tr>
		<th>taunt ID</th>
		<th>download</th>
		<th>admin only</th>
		<th>execute word</th>
		<th>location</th>
		<th>timeout</th>
	</tr>
	<?php
	$servername = "";
	$username = "";
	$password = "";
	$dbname = "";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
		 die("Connection failed: " . $conn->connect_error);
	} 

	$sql = "SELECT * FROM GM_taunts";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		 // output data of each row
		 while($row = $result->fetch_assoc()) {
			echo("
			<tr>
				<td>$row[taunt_id]</td>
				<td>$row[download]</td> 
				<td>$row[admin]</td> 
				<td>$row[execute_word]</td>
				<td>$row[location]</td>
				<td>$row[timeout]</td>
			</tr>
			");
		 }
	} else {
		 echo "0 results";
	}

	$conn->close();
	?>
</table>
<hr>
<i>moustacheminer.com - Copyright 2002</i>
</body>
</html>