<?php

$codigo = 91;
$salario = 1300;

if($codigo == 91){
    $percentual = 0.1;
    
} else if($codigo == 92){
    $percentual = 0.2;

} else if($codigo == 93){
    $percentual = 0.3;

} else{
    $percentual = 0.35;

}

$novoSalario = ($salario * $percentual) + $salario;
$diferencaSalario = $novoSalario - $salario;

echo "Seu salário antigo: $salario\n";
echo "Seu novo salário: $novoSalario\n";
echo "Diferença entre os salários: $diferencaSalario\n";

?>