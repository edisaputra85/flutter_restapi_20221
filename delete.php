<?php
	include 'conn.php';
	$itemcode = $_REQUEST['item_code'];
	// sql to delete a record
	$sql = "DELETE FROM tb_item WHERE item_code='".$itemcode."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>