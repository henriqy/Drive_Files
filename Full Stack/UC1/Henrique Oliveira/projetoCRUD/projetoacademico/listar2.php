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
    <div style="width: 100%;">
        <h2 style="float: left;">Listar Registros</h1>
        <h2 style="float: right;"> <a href="cadastro.php">Cadastrar</a></h2>

    </div>

    <?php
        //inicializar sessao
        session_start();
        
        //verificar se a sessao existe
        if(isset($_SESSION['msg'])){
            echo $_SESSION['msg'];
        }

        //destruir a sessao da mensagem
        unset($_SESSION['msg']);


    ?>


    <hr style="width:100%;">
    <br>

    <?php


        /* ---------------Paginacao parte 1 - Inicio--------------- */
        // 1-Criando a variavel "page" usando o metodo "get"  para receber o numero da pagina atual
        //http://localhost/projetoCRUD/projetoacademico/listar2.php?page=1
        
        //2-Criar uma variavel para receber um numero da pagina atual atravez da URL

        $pagina_atual = filter_input(INPUT_GET, "page", FILTER_SANITIZE_NUMBER_INT);

        //3- verificar se nao foi anviado atraves da URL do numero da pagina, caso verdadeiro, atribui o numero 1
        $pagina= (!empty($pagina_atual)) ? $pagina_atual : 1; 

        //4-Setar a quantidade de registros recebidos por pagina
        $limite_result = 2;

        //5-Calcular o inicio da visualizacao de registros na pagina

        $inicio = ($limite_result * $pagina) - $limite_result;


        /* ---------------Paginacao parte 1 - FIM--------------- */

        
        #2-Criar uma cunsultar para listar os usarios cadastrados
        
        $query_usuarios=$conn->prepare("SELECT id, matricula, nome, email, estatus, datacadastro FROM usuarios ORDER BY datacadastro DESC LIMIT $inicio, $limite_result");
        $query_usuarios->execute(); //executando a consulta
        ?>

<!-- Criar uma tabela para listar os registros -->

<table style="width: 100%; margin: 15px auto;">
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
                echo "<td> <a href='editar.php?id=$id'>[Editar]</a> <a href=#>[Excluir] </a> </td>"; // linha para editar os dados                
                echo "</tr>";
                
                
            }
            ?>
    <!-- Encerrar a tabela -->
</table>

<?php
/* ---------------Paginacao parte 2 - Inicio--------------- */
    //6-contar quantos registros temos no banco de dados
    $query_qnt_registros = $conn->prepare("SELECT COUNT(id) AS  num_result FROM usuarios");
    $query_qnt_registros->execute();

    //Criar um array associativo
    $row_qnt_registros = $query_qnt_registros->fetch(PDO::FETCH_ASSOC);

    //7-Identificar a quantidade de registros  nescessarias para exibir todos os regitros

    $qnt_pagina = ceil($row_qnt_registros['num_result'] / $limite_result);

    //8-criar uma variavel para informar o maximo de links na pagina
    $maximo_link = 2;

    //9-implementando o link da primeira pagina
    echo "<a href='listar2.php?page=1'>Primeira</a> ";

    //10 - utilizar um for para setar as paginas anteriores
    for($pagina_anterior = $pagina - $maximo_link; $pagina_anterior <= $pagina - 1; $pagina_anterior++)
    {
        if($pagina_anterior >= 1){
            echo " <a href= 'listar2.php?page= $pagina_anterior'>$pagina_anterior</a> ";
        }
    }



    //11-mostrar a pagina atual
    echo "$pagina";

    //12- utilizar um for para setar as paginas posteriores
    for($pagina_posterior = $pagina + 1; $pagina_posterior <= $pagina + $maximo_link; $pagina_posterior++)
    {
        if($pagina_posterior <= $qnt_pagina){
            echo " <a href= 'listar2.php?page= $pagina_posterior'>$pagina_posterior</a> ";
        }
    }

    //13-implementando o link da ultima pagina
    echo " <a href='listar2.php?page=$qnt_pagina'>Ultimo</a>";

    
/* ---------------Paginacao parte 2 - Fim--------------- */
            
        }else{
            echo "<p style='color:red;'>Erro:usuario nao encontrado!</p>";

        }

    ?>

<br>
    

    
</body>
</html>