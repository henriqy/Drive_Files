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
    <div style="width:100%;">
        <h1 style="float: left;">Listar Registros</h1>
        <h2 style="float: right;"> <a href="cadastro.php">Cadastrar</a></h2>

    </div>


    <hr style="width:100%;">
    <br>

    <?php
        #2-Criar uma cunsultar para listar os usarios cadastrados

        $query_usuarios=$conn->prepare("SELECT id, matricula, nome, email, estatus, datacadastro FROM usuarios ORDER BY datacadastro DESC");
        $query_usuarios->execute(); //executando a consulta
    ?>

    <!-- Criar uma tabela para listar os registros -->

    <table style="width=100%; margin:15px auto;">
        <thead>
            <tr> <!--primeira linha da tabela_Titulo-->
                <th style="background-color: #E6E6FA; padding: 10px";>ID</th>
                <th style="background-color: #E6E6FA; padding: 10px";>Matricula</th>
                <th style="background-color: #E6E6FA; padding: 10px";>Nome</th>                
                <th style="background-color: #E6E6FA; padding: 10px";>E-mail</th>
                <th style="background-color: #E6E6FA; padding: 10px";>Estatus</th>
                <th style="background-color: #E6E6FA; padding: 10px";>Data de Cadastro</th>
                <th style="background-color: #E6E6FA; padding: 10px";>Ações</th>
            </tr>
        </thead>
    

    <?php
        #3-Verifianco resultado da consulta

        if($query_usuarios->rowCount() != 0){
            //Mostrar os registros encontrados
            while($rowusuarios = $query_usuarios->fetch(PDO::FETCH_ASSOC)){

                echo "<tr>"; //Criando a 2 linha da tabela
                    extract($rowusuarios);
                    echo "<td>". $id. "</td>";
                    echo "<td>". $matricula. "</td>";
                    echo "<td>". $nome. "</td>";
                    echo "<td>". $email. "</td>";
                    echo "<td>". $estatus. "</td>";
                    echo "<td>". date("d/m/Y H:i:s", strtotime($datacadastro))."</td>"; // strtotime = transformar a string em tipo tempo
                    echo "<td> <a href=#>[Editar]</a> <a href=#>[Excluir] </a> </td>"; // linha para editar os dados                
                echo "</tr>";


            }
    ?>
    <!-- Encerrar a tabela -->
    </table>

    <?php
            
        }else{
            echo "<p style='color:red;'>Erro:usuario nao encontrado!</p>";

        }

    ?>

<br>
    

    
</body>
</html>