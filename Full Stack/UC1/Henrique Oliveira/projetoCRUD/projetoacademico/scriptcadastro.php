<?php
session_start();

// criar conexao com o banco de dados
include("conexao.php");
$conn = conectar();

#Recuperando dados do formulario com o metodo post
$matricula = $_POST['matricula'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = MD5($_POST['senha']);
$estatus = $_POST['estatus'];
$painel = $_POST['painel'];

#Preparando o INSERT com pseudo-nomes para cadastrar no banco de dados

$cadastro = $conn->prepare("INSERT INTO usuarios(matricula, nome, email, senha, estatus, painel)
VALUES(:matricula, :nome, :email, :senha, :estatus, :painel)");

#Passando os dados das variaveis para os pseudonome atravez do metodo bindvalue

$cadastro->bindvalue(":matricula", $matricula);
$cadastro->bindvalue(":nome", $nome);
$cadastro->bindvalue(":email", $email);
$cadastro->bindvalue(":senha", $senha);
$cadastro->bindvalue(":estatus", $estatus);
$cadastro->bindvalue(":painel", $painel);

#Verificando se ja existe um email cadastrado

$verificar = $conn->prepare("SELECT * FROM usuarios WHERE email=?");
$verificar->execute(array($email));

if($verificar->rowCount()==0):
    $cadastro->execute();
    echo "Usuario cadastrado com sucesso";
    
else:
    echo "Email ja cadastrado!";

endif;

# Quantidade de usarios cadastrados

$result=$cadastro->rowCount();

# Criando sessoes para mostrar as mensagens de usuario cadastrado ou email ja existente

if($result == 1){
    $_SESSION['cadastrado'] = true;
    header('Location: cadastro.php');
    exit();

}else{
    $_SESSION['nao_cadastrado'] = true;
    header('Location: cadastro.php');
    exit();

}


?>