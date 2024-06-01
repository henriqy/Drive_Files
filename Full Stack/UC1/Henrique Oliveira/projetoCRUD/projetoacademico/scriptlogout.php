<?php

session_start();
session_destroy(); //encerra as sessoes abertas

header('Location:index.html'); //redireciona para pagina index



?>