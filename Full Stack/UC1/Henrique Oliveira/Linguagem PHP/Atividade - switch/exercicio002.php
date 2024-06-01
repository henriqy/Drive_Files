<?php

$codigo = 3;

echo "Status: ";

switch($codigo){
    case 1:
        
        echo "Aguardando pagamento";
        break;

    case 2:
        
        echo "Pago";
        break;

    case 3:
        
        echo 'Em transporte';
        break;
    
    case 4: 
        echo "Entregue";
        break;

}



?>