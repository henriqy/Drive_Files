<?php
    session_start(); //iniciando uma sessao
    
    include('scriptverificalogin.php'); //chamando arquivo para verificar se existe uma sessao 

?>

<!--mostrar nome de usuario logado-->

<div align='right'>
     <!--Link para listar usuarios-->
     <h3> <a href="listar2.php"> Listar Usuarios <a> </h3>
    <h2>Ola, <?php echo $_SESSION['usuario']; ?> </h2>
    
<div>
    


<nav align="center">

    <!--Link para encerrar a sessao do usuario-->
    <h3> <a href="scriptlogout.php"> Logout <a> </h3>
<nav>

<div>
    <h1>Pagina administrador</h1>
</div>

<!-- -->