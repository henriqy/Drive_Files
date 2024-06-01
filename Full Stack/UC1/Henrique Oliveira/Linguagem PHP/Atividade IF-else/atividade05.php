<?php

$nota = 6.9;

echo"Conceito: ";

if($nota >= 8.0 && $nota <= 10) {
    echo"A";

}else if($nota >=7.0 && $nota <= 7.9) {
    echo "B";

}else if($nota >= 6.0 && $nota <= 6.9) {
    echo "C";

}else if($nota >= 5.0 && $nota <= 5.9) {
    echo "D";

}else {
    echo "E";
}