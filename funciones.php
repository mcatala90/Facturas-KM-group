<?php 
function get_row($table,$row, $id, $equal){
	global $con;
	$query=mysqli_query($con,"select $row from $table where $id='$equal'");
	$rw=mysqli_fetch_array($query);
	$value=$rw[$row];
	return $value;
}

function alert_msg($content, $type){

	$str = '';
	
	$str .= '<div class="alert alert-'.$type.'" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">&times;</span></button>'.$content.'</div>';
	
	return $str;
	
	}
?>