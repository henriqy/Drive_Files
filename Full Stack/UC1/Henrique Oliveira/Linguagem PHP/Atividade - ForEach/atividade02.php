<?php

$pesquisas = ['S','S','S','N','S','N','N','S','S',
                'S','S','N','S','S','N','S','S','S'];

$contS = 0;
$contN = 0;

foreach($pesquisas as $pesquisa){
        if($pesquisa == 'S'){
            $contS++;
        }else{
            $contN++;
        }
    }

    print "Quantidade de S: $contS\nQuantidade de N: $contN";

?>