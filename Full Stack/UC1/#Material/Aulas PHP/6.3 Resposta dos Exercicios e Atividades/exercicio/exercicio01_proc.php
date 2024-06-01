<?php 

$Hectares = $_POST["Hectares"];
$Quantidade = $_POST["Quantidade"];
$Preco = $_POST["Preco"];
$Valores = $_POST["Valores"];

echo "Quantidade de hectares: $Hectares";
echo "<br>";
echo "Quantidade de m³ por hectares: $Quantidade";
echo "<br>";
echo "Preço do m³ de agua: R$ $Preco";
echo "<br>";
echo "Valores agregados: R$ $Valores";
echo "<br>";

?>