<?php
    session_start(); //iniciando uma sessao
    
    include('scriptverificalogin.php'); //chamando arquivo para verificar se existe uma sessao 

?>

<!--mostrar nome de usuario logado-->

<div align='right'>
  
    <h2>Ola, <?php echo $_SESSION['usuario']; ?> </h2>
    
<div>
    
<!--Link para encerrar a sessao do usuario-->

<nav align="center">
    <h3> <a href="scriptlogout.php"> Logout <a> </h3>
<nav>

<div>
    <h1>Usuario sem nivel de acesso</h1>
    <h2>Por favor entre em contato com adm meu amigo</h2>
    
</div>

<!-- -->