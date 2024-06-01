<?php 
    $Nota = $_POST["Nota"];

            if ($Nota >=8 ) 
            {
                echo "Conceito A";
            }
           elseif ( $Nota >=7 && $Nota <8)
           {
            echo "Conceito B";
            }
            elseif ($Nota >=6 && $Nota <7)
            {
                echo "Conceito C";
            }
            elseif ($Nota >=5 && $Nota <6)
            {
                echo "Conceito D";
            }
            else 
                {
                    echo "Conceito E";
                }

?>