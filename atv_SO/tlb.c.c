#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sched.h>

#define PAGESIZE 4096

// Função para calcular a diferença de tempo
float time_diff(struct timeval *start, struct timeval *end) {
    return (float)((end->tv_sec - start->tv_sec) * 1000.0 + (end->tv_usec - start->tv_usec) / 1000.0);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <num_paginas> <num_iteracoes>\n", argv[0]);
        return 1;
    }

    int num_paginas = atoi(argv[1]);
    int num_iteracoes = atoi(argv[2]);

    // Definir afinidade para CPU 0
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(0, &mask);
    sched_setaffinity(0, sizeof(cpu_set_t), &mask);

    // Definir o salto e criar o vetor
    int salto = PAGESIZE / sizeof(int);
    int *v = (int *)malloc(num_paginas * salto * sizeof(int));

    struct timeval inicio, fim;
    gettimeofday(&inicio, NULL);

    // Acessar páginas várias vezes
    for (int j = 0; j < num_iteracoes; j++) {
        for (int i = 0; i < num_paginas * salto; i += salto) {
            v[i] += 1;
        }
    }

    gettimeofday(&fim, NULL);
    float tempo = time_diff(&inicio, &fim) / (num_paginas * num_iteracoes);
    printf("Tempo médio por acesso: %f ms\n", tempo);

    free(v);
    return 0;
}
