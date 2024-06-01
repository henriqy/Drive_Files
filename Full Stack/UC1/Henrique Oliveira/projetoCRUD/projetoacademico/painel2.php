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
    <h1>Pagina Professor</h1>
</div>

<!-- -->