<?php
#1-conectando bando de dados com pdo

#1.1-criando uma funcao para utilizar script em outros arquivos
function conectar(){

    #2-Tratando excesoes com try/catch
    try{
        $conn = new PDO("mysql:host=localhost; dbname=academico", "root", ""); //SGBD : servidor, nomebancodeDados, usuario, senhaUsuario;
    
    } catch(PDOException $e){
        echo $e -> getMessage();
        echo $e -> getCode();
        
    }

    return $conn; //retorna a variavel de conexao

}



?>