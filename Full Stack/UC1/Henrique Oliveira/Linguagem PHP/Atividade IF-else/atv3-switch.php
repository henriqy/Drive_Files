<?php

$codigo = 91;
$salario = 1300;

switch ($codigo) {
    case 91: 
        $novoSalario = ($salario * 0.1) + $salario;
        $diferencaSalario = $novoSalario - $salario;
        break;
    
    case 92:
        $novoSalario = ($salario * 0.2) + $salario;
        $diferencaSalario = $novoSalario - $salario;
    
    case 93:
        $novoSalario = ($salario * 0.3) + $salario;
        $diferencaSalario = $novoSalario - $salario;
    
    default:
        $novoSalario = ($salario * 0.35) + $salario;
        $diferencaSalario = $novoSalario - $salario;
}

echo "seu salario antigo: $salario\n";
echo "seu novo salario: $novoSalario\n";
echo "diferenca entre os salarios: $diferencaSalario\n";
?>