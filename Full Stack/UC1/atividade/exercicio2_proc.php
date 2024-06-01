<?php
    $codigo = $_POST['codigo'];
    $salario = $_POST['salario'];

    switch ($codigo){
        case 1:
        ($codigo == 1);
        $novoSalario = $salario * 1.50;
        $aumento = $novoSalario - $salario;
        echo "Cargo: Escrituário <br> O salario deste funcionario era de:R$ " . number_format($salario,2,',','.') .  "<br></br>",

        "Tera um aumento de:R$ " . number_format($aumento,2,',','.') . "<br>",

        "O novo Salário com o aumento será de: R$ " . number_format($novoSalario,2,',','.');
        break;
    
        case 2:
        ($codigo == 2);
        $novoSalario = $salario * 1.35;
        $aumento = $novoSalario - $salario;
        echo "Cargo: Secretario <br> O salario deste funcionario era de: R$ " . number_format($salario,2,',','.') . "<br></br>",
        
        "Tera um aumento de:R$ " . number_format($aumento,2,',','.') . "<br>",

        "O novo Salário com o aumento será de: R$ " . number_format($novoSalario,2,',','.');
        break;
    
        case 3:
        ($codigo == 3);
        $novoSalario = $salario * 1.20;
        echo "Cargo: Caixa <br> O salario deste funcionario era de: R$" . number_format($salario,2,',','.') . "<br></br>" ,
        
        "Tera um aumento de:R$ " . number_format($aumento,2,',','.' ) . "<br>",

        "O novo Salário com o aumento será de: R$ " . number_format($novoSalario,2,',','.');
        break;
    
        case 4:
        ($codigo == 4);
        $novoSalario = $salario * 1.10;
        echo "Cargo: Gerente <br> O salario deste funcionario era de:R$ " . number_format($salario,2,',','.') . "<br></br>" ,
        
        "Tera um aumento de:R$ " . number_format($aumento,2,',','.') . "<br>",

        "O novo Salário com o aumento será de: R$ " . number_format($novoSalario,2,',','.');
        break;;
    
        case 5:
        ($codigo == 5);
        $novoSalario = $salario * 1.05;
        echo "Cargo: Diretor <br> O salario deste funcionario era de:R$ " . number_format($salario,2,',','.') . "<br></br>" ,
        
        "Tera um aumento de:R$ " . number_format($aumento,2,',','.') . "<br>",

        "O novo Salário com o aumento será de: R$ " . number_format($novoSalario,2,',','.');
        break;
    
    default:
        echo "Digite um codigo valido. <br></br> Ex: 1,2,3,4 ou 5.";
        break;
    }

    
?>