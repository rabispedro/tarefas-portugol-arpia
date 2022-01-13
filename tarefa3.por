programa {
    /*
        Problema: Calcular até o n-ésimo termo de Fibonacci
        Conehcimento:
            * Conhecer a Sequencia de Fibonacci
            * Sequencia de Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181...
            * Casos Base:
                * 0 quando (n = 0)
                * 1 quando (n = 1)
            * Fibonacci:
                * Soma de: Fibonacci(n - 1) com Fibonacci(n - 2)
                * EXEMPLO:
                    * Fibonacci(4) = Fibonacci(3) + Fibonacci(2)
                    * Fibonacci(3) = Fibonacci(2) + Fibonacci(1)
                    * Fibonacci(2) = Fibonacci(1) + Fibonacci(0)
                    * Fibonacci(1) = 1
                    * Fibonacci(0) = 0
                    * Fibonacci(1) = 1
                    * Fibonacci(2) = Fibonacci(1) + Fibonacci(0)
                    * Fibonacci(1) = 1
                    * Fibonacci(0) = 0
    */
    
    inteiro sequenciaFibonacci[200]
    
	funcao inicio() {
	    inteiro numeroTermos
        
        escreva("Digite a quantidade de números: ")
        leia(numeroTermos)
        
        fibonacciIterativo(numeroTermos)
        
        escreva("Número de termos: ", numeroTermos, "\n")
        
        escreva("Termos Calculados (Iterativo): ")
        para(inteiro i=0; i<numeroTermos; i++){
            escreva(sequenciaFibonacci[i], " ")
        }
        
        escreva("\n")
        
        escreva("Termos Calculados (Recursivo): ")
        para(inteiro i=0; i<numeroTermos; i++){
            escreva(fibonacciRecursivo(i), " ")
        }
	}
	
    funcao inteiro fibonacciRecursivo(inteiro n) {
        se(n == 0){
            retorne 0
        }
        
        se(n == 1) {
            retorne 1
        }
        
        retorne (fibonacciRecursivo(n-1) + fibonacciRecursivo(n-2))
    }
	
	funcao vazio fibonacciIterativo(inteiro qtd) {
        sequenciaFibonacci[0] = 0
        sequenciaFibonacci[1] = 1
        
        para(inteiro i=2; i<=qtd; i++){
            sequenciaFibonacci[i] = sequenciaFibonacci[i-1] + sequenciaFibonacci[i-2]
        }
	}
}
