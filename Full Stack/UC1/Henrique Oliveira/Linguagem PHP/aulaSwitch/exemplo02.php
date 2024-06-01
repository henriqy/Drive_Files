<?php

echo "-------------------------------------<br>";

echo "Exemplo2: Dias da semana <br>";
echo "-------------------------------------<br><br>";

$hoje = date('d/m/a');
echo "$hoje - ";

$diaSemana = date("w"); #Funcao que pega o dia exato da semana em seu computador - date("w")

switch($diaSemana){
    
    case 0:
        echo "Domingo";
        break;
    case 1:
        echo "Segunda - feira";
        break;
    case 2:
        echo "Terca - feira";
        break;
    case 3:
        echo "Quarta - feira";
        break;
    case 4:
        echo "Quinta - feira";
        break;
    case 5:
        echo "Sexta - feira";
        break;
    case 6:
        echo "Sabado";
        break;
}

?>