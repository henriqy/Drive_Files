<?php
//1- Receber o id do usuário através da URL
$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

//2- Criar a mensagem de confirmação de exclusão
echo "<br>";

echo "<p style='color: #f00;'>Deseja realmente excluir esse registro? </p>";

echo "<a href='excluir.php?id=$id'>Sim</a>  |  ";

echo "<a href='listar2.php'>Não</a>";

?>