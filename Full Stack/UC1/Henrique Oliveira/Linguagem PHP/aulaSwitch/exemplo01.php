<?php
echo "-------------------------------------<br>";

echo "Exemplo1: Caixa Eletronico Online<br>";
echo "-------------------------------------<br><br>";

echo "por favor, selecione um dos metodos desejados<br><br>";

echo "#1 - SAQUE <br>
      #2 - DEPOSITO <br>
      #3 - TRANSFERENCIA <br><br>";

$codigo = 1;

switch($codigo){

    case 1:
         echo "Opcao selecionada realizar um saque";
         break;
    case 2:
        echo "Opcao selecionada realizar um deposito";
        break;
    case 3:
        echo "Opcao selecionada realizar uma transferencia";
        break;
    default:
        echo "Opcao selecionada nao existe";
        break;

}



?>