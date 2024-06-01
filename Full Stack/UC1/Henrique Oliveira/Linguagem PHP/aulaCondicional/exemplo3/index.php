<?php

/*
* Criar uma aplicacao para 
*analizar a idade de uma pessoa
*/
$qualSuaIdade =60;

$idadeCrianca = 12;
$idadeMaior = 18;
$idadeMelhor = 60;

if($qualSuaIdade <= $idadeCrianca){
    echo "voce eh uma crianca";

}else if($qualSuaIdade < $idadeMaior){
    echo "voce eh um adolescente";
}else if($qualSuaIdade < $idadeMelhor){
    echo "voce eh um adulto";
}else {
    echo "voce eh um idoso";
}

?>
