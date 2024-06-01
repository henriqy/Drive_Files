<?php
#1-Conectando com o banco de dados
    include("conexao.php");
    $conn = conectar();




?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Registros</title>
</head>

<body>

    <h1 align='center' >Listar Registros</h1>
    <hr><br>

    <?php
        #2-Criar uma cunsultar para listar os usarios cadastrados

        $query_usuarios=$conn->prepare("SELECT id, matricula, nome, email, estatus, datacadastro FROM usuarios");
        $query_usuarios->execute(); //executando a consulta
        
        #3-Verifianco resultado da consulta

        if($query_usuarios->rowCount() != 0){
            //Mostrar os registros encontrados
            while($rowusuarios = $query_usuarios->fetch(PDO::FETCH_ASSOC)){
                extract($rowusuarios);
                echo "ID: $id<br>";
                echo "Matricula: $matricula<br>";
                echo "Nome: $nome<br>";
                echo "Email: $email<br>";
                echo "Status: $estatus<br>";
                echo "Data:" . date("d/m/Y H:i:s", strtotime($datacadastro))."<br><br>"; // strtotime = transformar a string em tipo tempo
                


            }
            
        }else{
            echo "<p style='color:red;'>Erro:usuario nao encontrado!</p>";

        }

    ?>

<br>
    

    
</body>
</html>