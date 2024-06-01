<?php

# Verificar se a sessao de usario nao existe
##caso seja verdadeiro, redirecionar para pagina de login
if(!$_SESSION['usuario']){ //"se a sessao de usuario n existir"
    header('Location:login.php');
        
    exit();
}

?>