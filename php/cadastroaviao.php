<?php
$nome_aviao=$_REQUEST['nome_aviao'];
$num_poltronas=$_REQUEST['num_poltronas'];


include_once 'bd.php';

$sql="insert into aviao values(null, '".$nome_aviao."','".$num_poltronas."')";

$stmt = $con->prepare($sql);
$stmt->execute();

?>