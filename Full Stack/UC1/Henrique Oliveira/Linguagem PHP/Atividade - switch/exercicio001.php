<?php

$salario = 1200;
$codigo = 1;

switch($codigo){
    case 1:
        $percentual = 0.5;
        echo "Escrituario";
        break;

    case 2:
        $percentual = 0.35;
        echo "Secretário";
        break;

    case 3:
        $percentual = 0.2;
        echo 'Caixa';
        break;

    case 4:
        $percentual = 0.10;
        echo 'Gerente';
        break;

    case 5:
        $percetual = 0.5;
        echo 'Diretor';
        break;
}

$novoSalario = $salario + ($salario * $percentual);
$aumento = $novoSalario - $salario;

echo "<br>Seu salario atual eh: R$ " . number_format($salario, 2, ",", ".");
echo "<br>Voce teve um aumento de: R$ " . number_format($aumento, 2, ",", ".");
echo "<br>Seu Seu novo salario eh: R$" . number_format($novoSalario, 2, ",", ".");

?>