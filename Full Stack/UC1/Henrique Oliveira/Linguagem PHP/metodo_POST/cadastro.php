<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>METODO POST</title>

    <style>

        .container{
            width:400px; 
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            border: 2px solid;
            background-color: #D3D3D3;
            box-shadow: 5px 5px grey'
            border-radius: 5px;

        }

        input{
            width: 70%;

        }

    </style>
</head>
<body>
    
    <h2 style="text-align: center;"> Metodo Post</h2>

    <main>
        <br><br>
        <div class ="container">
            <h2>Cadastro de Usuarios</h2>
            <form action="processor.php" method="POST">
                Nome*: <input type="text" name="usuario" placehoder="digite seu nome" required> <br><br>

                Email*: <input type="email" name="email" placeroder="digite seu melhor email" width="" required> <br><br>

                Senha*: <input type=""passowrd name="senha" placeholder="Cadastre uma senha de 6 digitos"
                required> <br><br><br>

                <input type="submit" value="Cadastrar">

                
            </form>
            <br>
        </div>
    </main>

    <footer>
        <h5 style="text-align: center;"> Todos os direitos reservados</h5>
    </footer>

</body>
</html>