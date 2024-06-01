<?php

$notas = [9,8,5,7,8,9,10,9,10,8,7,10,9];
$cont = 0;
$acm = 0;

foreach($notas as $nota){
    $cont++;
    $acm += $nota;
}
$media = $acm / $cont;

print "\n".$media;
?>