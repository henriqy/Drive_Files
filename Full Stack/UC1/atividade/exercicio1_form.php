<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercicio01_form.php</title>
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
    <main>
        <div class="container">
            <h2>Validar Nota</h2>
            <form action="exercicio1_proc.php" method="POST">
                Nota: <input type="text" name="Nota" placeholder="Insira a Nota">
                <br>
                <input type="submit" value="Validar">
            </form>
        </div>
    </main>
</body>
</html>