<?php

$codigo = 1;

echo "Status: ";

if($codigo == 1){
    echo "Aguardando pagamento ";

} else if($codigo == 2){
    echo "Pagamento confirmado";

} else if($codigo == 3){
    echo "Em transporte";

} else{
    echo "Entregue ";
}