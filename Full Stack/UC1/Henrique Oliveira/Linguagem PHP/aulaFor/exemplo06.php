<?php

//Laco para mostrar os ultimos 100 anos

for($i = date("Y"); $i >= date("Y")-100; $i--){
    echo $i . "<br>";
}

?>