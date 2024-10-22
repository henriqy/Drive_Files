#!/bin/bash

output="saida.txt"
> $output # Limpa o arquivo de saída

for paginas in 1 10 100 1000 10000
do
    ./tlb $paginas 10000 >> $output
done
