<?php
//Inicializar a sessão
session_start();

//1- Conectar com o banco de dados
include("conexao.php");
$conn=conectar();

//2- Receber o id do usuário atrvaés da URL, utilizando o metodo GET
$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

//3- Verificando se existe um id. Caso não exista, retornar para o listar2.php
if(empty($id)){
    $_SESSION['msg'] = "<p style='color:#f00;'>Erro: Usuário não encontrado</p>";
    header("Location: listar2.php");
}

//4- Pesquisar no Bando de Dados pelo id do usuário selecionado.
$query_usuario = "SELECT id, matricula, nome, email, estatus, dtcadastro FROM usuarios WHERE id=$id LIMIT 1";

//5- Preparando a query
$result_usuario = $conn->prepare($query_usuario);

//6- Executando a query
$result_usuario->execute();

//7- Verificando se encontrou usuário no Banco de Dados
if(($result_usuario) and ($result_usuario->rowCount() !=0)){

    //Armazenando os dados em um array associativo
    $row_usuario = $result_usuario->fetch(PDO::FETCH_ASSOC);
}else{
    $_SESSION['msg'] = "<p style='color:#f00;'>Erro: Usuário não encontrado</p>";
    header("Location: listar2.php");
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
    //8- Recebendo dados do formulário através do metodo POST
    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);

    //9- Verificar se o usuário clicou no botão "Atualizar"
    if(!empty($dados['EditUsuario'])){

        //Aplicar algumas validações
        $empty_input=false;

        //Retirando espaços em branco no início e no final 
        array_map('trim', $dados);

        //10- Verificando se há campo em branco
        if(in_array("", $dados)){

            $empty_input = true;
            echo "<p style='color:#f00; text-align: center;'>Erro: Necessário preencher todos os campos!</p>";

        //11- Verificando se a estrutura do email informado pelo usuário é válida.
        }elseif(!filter_var($dados['email'], FILTER_VALIDATE_EMAIL)){

            $empty_input = true;
            echo "<p style='color:#f00;'>Erro: Necessário preencher com email válido!</p>";
        }

        //12- Verificar se não há erros. Se verdadeiro atualizar o banco de dados
        if(!$empty_input){

            //Implementar o UPDATE no banco de dados
            $query_up_usuarios = "UPDATE usuarios SET matricula=:matricula, nome=:nome, email=:email, estatus=:estatus WHERE id=:id";

            //Preparando a query de atualização
            $edit_usuario = $conn->prepare($query_up_usuarios);

            //13- Passando os valores do array de $dados para os pseudo-nomes
            $edit_usuario->bindParam(':matricula', $dados['matricula'], PDO::PARAM_INT);
            $edit_usuario->bindParam(':nome', $dados['nome'], PDO::PARAM_STR);
            $edit_usuario->bindParam(':email', $dados['email'], PDO::PARAM_STR);
            $edit_usuario->bindParam(':estatus', $dados['estatus'], PDO::PARAM_STR);
            $edit_usuario->bindParam(':id', $id, PDO::PARAM_INT);

            //14- Verificando se a execução da query de atualização foi realizada com sucesso.
            if($edit_usuario->execute()){
                $_SESSION['msg'] = "<p style='color:green; text-align: center;'>Usuário atualizado com sucesso!</p>";
                header("Location: listar2.php");

            }else{
                echo "<p style='color:#f00;'>Erro: Usuário não atualizado!</p>";
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
            //Verificar se os dados de atualização veio do formulário.
            if(isset($dados['matricula'])){
                echo $dados['matricula'];
            
            //Verificar se os dados de atualização veio do banco de dados.
            }elseif(isset($row_usuario['matricula'])){
                echo $row_usuario['matricula'];
            }
            ?>"><br><br>

            <label>Nome: </label>
            <input type="text" name="nome" id="nome" placeholder="Nome completo" value="<?php  
            //Verificar se os dados de atualização veio do formulário.
            if(isset($dados['nome'])){
                echo $dados['nome'];
            
            //Verificar se os dados de atualização veio do banco de dados.
            }elseif(isset($row_usuario['nome'])){
                echo $row_usuario['nome'];
            }
            
            ?>"><br><br>

            <label>E-mail: </label>
            <input type="email" name="email" id="email" placeholder="Digite o melhor e-mail" value="<?php 
            //Verificar se os dados de atualização veio do formulário.
            if(isset($dados['email'])){
                echo $dados['email'];
            
            //Verificar se os dados de atualização veio do banco de dados.
            }elseif(isset($row_usuario['email'])){
                echo $row_usuario['email'];
            }
            
            ?>"><br><br>

            <label>Status: </label>
            <input type="text" name="estatus" id="estatus" value="<?php 
            //Verificar se os dados de atualização veio do formulário.
            if(isset($dados['estatus'])){
                echo $dados['estatus'];
            
            //Verificar se os dados de atualização veio do banco de dados.
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