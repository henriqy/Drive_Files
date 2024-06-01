<?php

echo "-------------------------------------<br>";

echo "Exemplo3: Sistema de Desconto <br>";
echo "-------------------------------------<br><br>";

echo "Escolha um dos metodos de pagamento:<br>";

echo "#1 - PIX <br>
      #2 - DEBITO <br>
      #3 - CREDITO <br> <br>";


$formaPagamento  = 4;
$compra = 100;

switch($formaPagamento){
    case 1: 
        $desconto = 0.2;
        break;
    case 2:
        $desconto = 0.15;
        break;

    case 3:
        $desconto = 0.10;
        break;
    default :
        echo " forma de pagamento invalido!";
}

$verdade = ($formaPagamento == 1 || $formaPagamento == 2 || $formaPagamento == 3);

if($verdade){
    $valorTotal = $compra - ($compra * $desconto);
    $valorDesconto = $compra - $valorTotal;
    
    echo "valor da compra: R$ " . number_format($compra, 2, ",", ".");
    echo "<br>voce pagara: R$ " . number_format($valorTotal, 2, ",", ".");
    echo "<br> voce teve um desconto de: R$ " . number_format($valorDesconto, 2, ",", ".");

}


?>