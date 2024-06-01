<?php

$usuario = $_POST['usuario'];
$email = $_POST['email'];
$senha = md5($_POST['senha']);

echo "Nome do usuario: $usuario <br><br>";
echo  "E-mail do usuario: $email <br><bre> ";
echo "Senha do usuario: $senha <br><br>";



?>

<html>
    <br><br>
    <a href="cadastro.php">Novo Cadastro</a>


</html>