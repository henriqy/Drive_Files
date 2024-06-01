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
            border: 10px solid lightgreen;
            background: lightcoral;
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
        <h2>Receber os Dados da Fazenda irrigada</h2>
    <form action ="exercicio01_proc.php" method="POST">
        <br>
        Hectares: <input type="text" name="Hectares" placeholder="Insira os Dados">
        <br><br>
        Quantidade de m³: <Input type="text" name="Quantidade" placeholder="Insira os Dados">
        <br><br>
        Preço do m³: <Input type="text" name="Preco" placeholder="Insira os Dados">
        <br><br>
        Valores Agregados: <Input type="text" name="Valores" placeholder="Insira os Dados">
        <br><br>
        <input type="submit" value="Cadastrar">
    </form>
    </div>
</main>
</body>
</html>