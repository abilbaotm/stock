<?php
	$con=mysqli_connect("localhost","root","","stock");
	//Makes print_r pretty
	function print_r_html ($arr) {
        ?><pre><?php
        print_r($arr);
        ?></pre><?php
	}
?>
