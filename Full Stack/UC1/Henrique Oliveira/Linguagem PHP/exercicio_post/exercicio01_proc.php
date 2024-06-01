<?php

$nota = $_POST['nota'];

if($nota <= 0 && $nota <5){
    echo "Conceito E";

}else if($nota >= 5 && $nota < 6){
    echo "Conceito D";
}else if($nota >= 6 && $nota < 7){
    print "Conceito C";

}else if($nota >= 7 && $nota < 8){
    echo "Conceito B";

}else if($nota >= 8 && $nota <= 10){
    echo "Conceito A";

}else {
    echo "Nota Invalida";

}


?>

<html>
<br><br>

<a href="exercicio01_form.php"> Novo Cadastro</a>


</html>