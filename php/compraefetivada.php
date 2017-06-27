<?php
$nome_passageiro= $_REQUEST['nome_passageiro'];



include_once 'bd.php';

$sql="update passagem set nome_passageiro= '".$nome_passageiro."' where id='".$_GET['id']."'";

$stmt = $con->prepare($sql);
$stmt->execute();

?>