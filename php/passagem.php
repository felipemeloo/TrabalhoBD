<?php
$origem=$_REQUEST['origem'];
$destino=$_REQUEST['destino'];
$dt_saida=$_REQUEST['dt_saida'];
$dt_chegada=$_REQUEST['dt_chegada'];
$num_passagem=$_REQUEST['num_passagem'];


include_once 'bd.php';

$sql="insert into passagem values(null, '".$origem."','".$destino."','".$dt_saida."','".$dt_chegada."','".$num_passagem."')";

$stmt = $con->prepare($sql);
$stmt->execute();
header("Location: login.php");
?>