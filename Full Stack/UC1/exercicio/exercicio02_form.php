<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>exercicio02_form.php</title>
    <style>
        .container{
            width: 700px;
            margin-left:auto;
            margin-right:auto;
            text-align:center;
            border: 10px solid greenyellow;
            background: yellowgreen;
            font-size: smaller;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
    </style>
</head>
<body>
    <header>    
    </header>
<main>
    <div class="container">
        <h2>Cadastrar Artigo</h2>
    <form action ="exercicio02_proc.php" method="POST">
        <br>
        Título do Artigo: <input type="text" name="Titulo" placeholder="Insira um Título" require>
        <br><br>
        Conteúdo do artigo: <input type="text" name="Conteudo" placeholder="Insira um Conteúdo" require>
        <br><br>
        <input type="submit" value="Cadastrar">
    </form>
    </div>
</main>
</body>
</html>