<?php
session_start(); //iniciando sessao

#1-Conectar com o banco de dados

include("conexao.php");//conectando com o arqutivo conexao.php

$conn = conectar();

#2-verificar se os campos estao vazios
if(empty($_POST["email"]) || empty($_POST["senha"])){
    header("Location:login.php");//redirecionando para pagina de login

    exit();
}

#3-Recuperando dados do formulario

$email = $_POST['email'];
$senha = MD5($_POST['senha']);

#4-Realizar uma Query no banco de dados para validar o acesso do user

$query = $conn->prepare("SELECT id FROM usuarios WHERE email=:e and senha=:s");
/*  -a variavel query armazena o email e senha do usuario no pseudocodigo "e" e "s"
    -metodo prepare() funciona com a linguagem sql pra acessar a tabela  */


#5-validar os dados do usuario no banco de dados com o metodo bindValue
$query->bindValue(":e", $email); //verificando se o email informado "e" eh igual ao email ja cadastrado
$query->bindValue(":s", $senha);

#6-Executar a consulta com o metodo execute
$query->execute();

#7-Armazenando o retorno da validacao dos dados do usuario
$row=$query->rowCount();

echo $row;

#Criando sistema de login com nivel de acesso

if($row==1){
    $verificar = $conn -> query("SELECT * FROM usuarios");

    while($linha = $verificar->fetch(PDO::FETCH_ASSOC)){
        if($linha['email'] == $email){
            $nivel = $linha['painel'];

            switch($nivel){
                case 'Administrador':
                    $_SESSION['usuario'] = $email;
                    header("Location:painel1.php");
                    exit();
                    break;

                case 'Professor':
                    $_SESSION['usuario'] = $email;
                    header("Location:painel2.php");
                    exit();
                    break;
                
                case 'Aluno':
                    $_SESSION['usuario'] = $email;
                    header("Location:painel3.php");
                    exit();
                    break;
                
                default:
                    $_SESSION['usuario'] = $email;
                    header("Location:painel4.php");
                    exit();
                    break;
            }

        }
    }

}else{
    $_SESSION['nao_autenticado']=true;
    header('Location:login.php');
    exit();
}




#Criando o sistema de login simples
/*if($row==1){
    $_SESSION['usuario'] = $email;
    header('Location:painel.php');
    exit();

}else{
    $_SESSION['nao_autenticado']=true;
    header('Location:login.php');
    exit();

}*/




?>