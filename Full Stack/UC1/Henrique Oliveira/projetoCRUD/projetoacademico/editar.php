<?php
 session_start();

#1-conectar com p banco de dados
include("conexao.php");
$conn=conectar();

#2-receber o "id" do usuario atravez da URL, utilizando o metodo GET

$id = filter_input(INPUT_GET, "id",FILTER_SANITIZE_NUMBER_INT);

#3-verificando se existe um "id", caso nao existe retornar para o "listar2.php"

if(empty($id)){
    $_SESSION['msg'] = "<p style='color:red'> Error, usuario nao encontrado </p>";
    header("Location: listar2.php");

}

#4-Pesquisar no banco de dados pelo ID do usuario selecionado.
$query_usuario = "SELECT id, matricula, nome, email, estatus, datacadastro FROM usuarios WHERE id=$id LIMIT 1";

#5-Preparando a query
$result_usuario = $conn -> prepare($query_usuario);

#6-Executando a query
$result_usuario->execute();

#7-Verificando se encontrou usuario no Banco de Dados
if ($result_usuario && $result_usuario->rowCount() != 0) {
    $row_usuario = $result_usuario->fetch(PDO::FETCH_ASSOC);
} else {
    $_SESSION['msg'] = "<p style='color:red'>Erro, usuário não encontrado</p>";
    header("Location: listar2.php");
    exit(); // É uma boa prática adicionar um exit() após o redirecionamento para evitar execução adicional do código.
}


?>



<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atualização de registros</title>

    <style>
        .edicao{
            width:100%;
            max-width: 700px;
            margin: 10px auto;
            background-color: rgb(219, 218, 218);
            padding: 20px;
            border-radius: 5px;
            margin-top: 10px;
            font-family: Arial; 
        }

        input{
            width: 90%;
            padding: 10px 5px;
            border-radius: 5px;
            outline-color: #cdf;
        }

        label{
            font-weight: bold;
        }

        .atualizar{
            text-align: center;
            outline-color: #cdf;
        }

        header{
            text-align:center;
            padding-bottom: 20px;
            padding-top: 20px;
        }
    </style>
</head>
<body>

<?php

    #8-Recebendo dados do formulario atravez do metodo post
    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
    
    #9- Verificar se o usuario cliclou no botao "atualizar"

    if(!empty($dados['EditUsuario'])){
        
        //Aplicar algumas validacoes
        $empty_input=false;
        //Retirando espacos em branco no inicio e no final
        array_map('trim', $dados);

        #10-verificando se ha campo em branco 

        if(in_array("", $dados)){
            $empty_input = true;
            echo "<p style='color:red'> Error, eh necessario preencher todos o brancos </p>";
                
        #11-verificando se a estrutura do email informada pelo usuario eh valida

        }elseif(!filter_var($dados['email'], FILTER_VALIDATE_EMAIL)){
            $empty_input = true;
            echo "<p style='color:red'> Error, eh necessario preencher com o email valido </p>";
        }

        #12-verificar se nao ha erros, se verdadeiro : atualizar bando de dados
        if(!$empty_input){
            //implementar o update no banco de dados
            $query_up_usuario = "UPDATE usuarios SET matricula=:matricula, nome=:nome, email=:email, estatus=:estatus WHERE id=:id";
        }else{
            //Preparando a query de atualizacao
            $edit_usuario = $conn->prepare($query_up_usuario);

            #13-Passando os valores do array de dados para os pseudonome

            $edit_usuario->bindParam(":matricula", $dados['matricula'], PDO::PARAM_INT);
            $edit_usuario->bindParam(":nome", $dados['nome'], PDO::PARAM_STR);
            $edit_usuario->bindParam(":email", $dados['email'], PDO::PARAM_STR);
            $edit_usuario->bindParam(":estatus", $dados['estatus'], PDO::PARAM_STR);
            $edit_usuario->bindParam(":id", $id, PDO::PARAM_INT);

            #14-Verificando se a execucao da query foi realizada com sucesso.
            if($edit_usuario->execute()){
                $_SESSION['msg'] = "<p style='color:green; text-align: center;'>Usuario atualizado com sucesso </p>";
                header("Location: listar2.php");
            }else{
                echo "<p style='color:#F00'>Error: Usuario nao atualizado </p>";
            }
        }

    }


?>
    <header>
        <h1>Edição de Registros</h1>
    </header>

    <!--Criando o formulário para edição de registros-->
    <div class="edicao">
        <form action="" method="POST">
            <label>Matrícula: </label>
            <input type="int" name="matricula" id="matricula" placeholder="Digite uma matrícula" value="<?php
                //verificar se os dados de atualizacao veio do formulario
                if(isset($dados['matricula'])){
                    echo $dados['matricula'];

                //verificar se os dados de atualizacao veio do banco de dados
                }elseif(isset($row_usuario['matricula'])){
                    echo $row_usuario['matricula'];


                }
            
            ?>"><br><br>

            <label>Nome: </label> <br>
            <input type="text" name="nome" id="nome" placeholder="Nome completo" value="<?php
                //verificar se os dados de atualizacao veio do formulario
                if(isset($dados['nome'])){
                    echo $dados['nome'];

                //verificar se os dados de atualizacao veio do banco de dados
                }elseif(isset($row_usuario['nome'])){
                    echo $row_usuario['nome'];
                    

                }
            
            ?>"><br><br>

            <label>E-mail: </label>
            <input type="email" name="email" id="email" placeholder="Digite o melhor e-mail" value="<?php
                //verificar se os dados de atualizacao veio do formulario
                if(isset($dados['email'])){
                    echo $dados['email'];

                //verificar se os dados de atualizacao veio do banco de dados
                }elseif(isset($row_usuario['email'])){
                    echo $row_usuario['email'];
                    

                }
            
            ?>"><br><br>

            <label>Status: </label>
            <input type="text" name="estatus" id="estatus" value="<?php
                //verificar se os dados de atualizacao veio do formulario
                if(isset($dados['estatus'])){
                    echo $dados['estatus'];

                //verificar se os dados de atualizacao veio do banco de dados
                }elseif(isset($row_usuario['estatus'])){
                    echo $row_usuario['estatus'];
                    

                }
            
            ?>"><br><br><br>

            <div class="atualizar">
                <input type="submit" value="Atualizar" name="EditUsuario">
            </div>
        </form>
    </div>
    <!--Fim do formulário-->
    
</body>
</html>