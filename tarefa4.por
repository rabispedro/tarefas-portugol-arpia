programa {
    /*
        Problema: Escrever por extenso o número que o usuário digitar (entre 1 e 999)
        Conhecimento:
            * Condicional (escolha-caso)
            * Dividir um numero em Unidade, Dezena e Centena
    */
    
    funcao inicio() {
        inteiro numero
        
        faca{
            escreva("Digite um número (entre 1 e 999): ")
            leia(numero)
        }enquanto(numero < 1 ou numero > 999)
        
        escreva("Numero digitado foi ", escrevePorExtenso(numero))
    }
    
    funcao cadeia escrevePorExtenso(inteiro numero) {
        inteiro casaUnidade, casaDezena, casaCentena
        cadeia numeroExtenso = ""

        casaCentena = numero - numero % 100
        casaDezena = numero - casaCentena - numero % 10
        casaUnidade = numero - casaCentena - casaDezena
        
        casaCentena /= 100
        casaDezena /= 10
        
        escreva("Centena: ", casaCentena, "\tDezena: ", casaDezena, "\tUnidade: ", casaUnidade, "\n\n")
        
        escolha(casaCentena) {
            caso 1:
                se(casaDezena == 0 e casaUnidade == 0){
                    numeroExtenso += "cem"
                }senao {
                    numeroExtenso += "cento"
                }
            pare
            
            caso 2:
                numeroExtenso += "duzentos"
            pare
            
            caso 3:
                numeroExtenso += "trezentos"
            pare
            
            caso 4:
                numeroExtenso += "quatrocentos"
            pare
            
            caso 5:
                numeroExtenso += "quinhentos"
            pare
            
            caso 6:
                numeroExtenso += "seiscentos"
            pare
            
            caso 7:
                numeroExtenso += "setecentos"
            pare
            
            caso 8:
                numeroExtenso += "oitocentos"
            pare
            
            caso 9:
                numeroExtenso += "novecentos"
            pare
        }
        
        se(casaCentena > 0 e (casaDezena > 0 ou casaUnidade > 0)){
            numeroExtenso += " e "
        }
        
        escolha(casaDezena) {
            caso 1:
                escolha(casaUnidade) {
                    caso 0:
                        numeroExtenso += "dez"
                    pare
                    
                    caso 1:
                        numeroExtenso += "onze"
                    pare
                    
                    caso 2:
                        numeroExtenso += "doze"
                    pare
                    
                    caso 3:
                        numeroExtenso += "treza"
                    pare
                    
                    caso 4:
                        numeroExtenso += "quatorze"
                    pare
                    
                    caso 5:
                        numeroExtenso += "quinze"
                    pare
                    
                    caso 6:
                        numeroExtenso += "dezesseis"
                    pare
                    
                    caso 7:
                        numeroExtenso += "dezessete"
                    pare
                    
                    caso 8:
                        numeroExtenso += "dezoito"
                    pare
                    
                    caso 9:
                        numeroExtenso += "dezenove"
                    pare
                }
                casaUnidade = 0
            pare
            
            caso 2:
                numeroExtenso += "vinte"
            pare
            
            caso 3:
                numeroExtenso += "trinta"
            pare
            
            caso 4:
                numeroExtenso += "quarenta"
            pare
            
            caso 5:
                numeroExtenso += "cinquenta"
            pare
            
            caso 6:
                numeroExtenso += "sessenta"
            pare
            
            caso 7:
                numeroExtenso += "setenta"
            pare
            
            caso 8:
                numeroExtenso += "oitenta"
            pare
            
            caso 9:
                numeroExtenso += "noventa"
            pare
        }
        
        se(casaDezena > 1 e casaUnidade > 0) {
            numeroExtenso += " e "
        }
        
        escolha(casaUnidade) {
            caso 1:
                numeroExtenso += "um"
            pare
            
            caso 2:
                numeroExtenso += "dois"
            pare
            
            caso 3:
                numeroExtenso += "três"
            pare
            
            caso 4:
                numeroExtenso += "quatro"
            pare
            
            caso 5:
                numeroExtenso += "cinco"
            pare
            
            caso 6:
                numeroExtenso += "seis"
            pare
            
            caso 7:
                numeroExtenso += "sete"
            pare
            
            caso 8:
                numeroExtenso += "oito"
            pare
            
            caso 9:
                numeroExtenso += "nove"
            pare
        }
        
        numeroExtenso += "."
        
        retorne numeroExtenso
    }
}
