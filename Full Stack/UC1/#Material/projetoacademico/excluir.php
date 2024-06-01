<?php
session_start();
ob_start();//Limpar o BUFFER de memória

//1- Conectar com Banco de Dados
include("conexao.php");
$conn = conectar();

//2- Receber o id do usuário através da URL
$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);

//3- Verificando se existe um id. Caso não exista, retornar para o listar2.php
if(empty($id)){
    $_SESSION['msg'] = "<p style='color:#f00;'>Erro: Usuário não encontrado</p>";
    header("Location: listar2.php");
}

//4- Pesquisar no Bando de Dados pelo id do usuário selecionado.
$query_usuario = "SELECT id FROM usuarios WHERE id=$id LIMIT 1";

//5- Preparar a query (consulta)
$result_usuario = $conn->prepare($query_usuario);

//6- Executar a consulta
$result_usuario->execute();

//7- Verificar se encontrou um usuário no Banco de Dados
if($result_usuario->rowCount() != 0){

    //Excluir o registro no Banco de Dados
    $query_del_usuario = "DELETE FROM usuarios WHERE id=$id";
    //Preparando a consulta de exclusão
    $result_del_usuario = $conn->prepare($query_del_usuario);

    //Realizar a execução da exclusão
    if($result_del_usuario->execute()){
        
        $_SESSION['msg'] = "<p style='color: green; text-align: center;'>Usuário excluido com sucesso!</p>";
        header("Location: listar2.php");
    }else{
        $_SESSION['msg'] = "<p style='color: #f00; text-align: center;'>Usuário não excluido!</p>";
        header("Location: listar2.php");

    }

}else{
    $_SESSION['msg'] = "<p style='color: #f00; text-align: center;'>Usuário não encontrado!</p>";
    header("Location: listar2.php");
}

?>