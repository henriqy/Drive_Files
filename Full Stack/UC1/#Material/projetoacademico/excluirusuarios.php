<?php
session_start();
ob_start();//Limpar o BUFFER de memória

//1- Conectar com Banco de Dados
include("conexao.php");
$conn = conectar();

//2- Receber o id dos usuários de uma única vez
$usuarios_id = filter_input_array(INPUT_POST, FILTER_DEFAULT);

//3- Verificar se o usuário clicou no botão "Excluir usuários selecionados" [delusuarios]
if(!empty($usuarios_id['delusuarios'])){

    //Verificando se algum registro foi selecionado
    if(isset($usuarios_id['id'])){

        //Com a possibilidade de ter mais de um usuário 
        //selecionado para exclusão, vamos precisar de uma
        // estrutura de repetição. Neste caso foreach.
        foreach($usuarios_id['id'] as $id => $usuario ){
            //Criando, Preparando e executando a Query de exclusão
            $query_del_usuario="DELETE FROM usuarios WHERE id=$id LIMIT 1";
            $result_del_usuario=$conn->prepare($query_del_usuario);
            $result_del_usuario->execute();  
        }
        //Mensagem de usuário excluido com sucesso!
        $_SESSION['msg'] = "<p style='color: green; text-align: center;'>Usuário(s) excluido(s) com sucesso!</p>";
        header("Location: listar2.php");
    }else{//Mensagem de erro
        $_SESSION['msg'] = "<p style='color: #f00; text-align: center;'>Usuário não excluido!</p>";
        header("Location: listar2.php");

    }
}else{//Messagem de erro
    $_SESSION['msg'] = "<p style='color: #f00; text-align: center;'>Usuário não encontrado!</p>";
    header("Location: listar2.php");
}

?>