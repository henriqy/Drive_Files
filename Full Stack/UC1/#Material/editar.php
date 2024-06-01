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
    <header>
        <h1>Edição de Registros</h1>
    </header>

    <!--Criando o formulário para edição de registros-->
    <div class="edicao">
        <form action="" method="POST">
            <label>Matrícula: </label>
            <input type="int" name="matricula" id="matricula" placeholder="Digite uma matrícula" value=""><br><br>

            <label>Nome: </label>
            <input type="text" name="nome" id="nome" placeholder="Nome completo" value=""><br><br>

            <label>E-mail: </label>
            <input type="email" name="email" id="email" placeholder="Digite o melhor e-mail" value=""><br><br>

            <label>Status: </label>
            <input type="text" name="estatus" id="estatus" value=""><br><br><br>

            <div class="atualizar">
                <input type="submit" value="Atualizar" name="EditUsuario">
            </div>
        </form>
    </div>
    <!--Fim do formulário-->
    
</body>
</html>