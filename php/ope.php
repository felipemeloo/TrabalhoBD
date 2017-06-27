<?php 
  $login = $_POST['login'];
  $senha = md5($_POST['senha']);
  $connect = new PDO("mysql:host=localhost;dbname=trabalho_bd2", "root", "");
    if (isset($login) && isset($senha)) {
            
      $sql = "SELECT * FROM usuario WHERE login = '$login' AND senha = '$senha'";
        $stmt = $connect->prepare($sql);
        $stmt->execute();
        $valores = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($stmt->fetchColumn()<=0){
          echo"<script language='javascript' type='text/javascript'>alert('Login e/ou senha incorretos');window.location.href='index.php';</script>";
          die();

        }else{
          setcookie("login",$login);
          header("Location:login.php");
        }
    }
?>