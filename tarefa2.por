programa {
    /*
        Problema: Fazer o calculo de custo benefício entre etanol e gasolina
        
        Conhecimento:
            * O etanol deve ser até 70% do valor da gasolina para valer a pena
    */
    
    funcao inicio() {
        real precoGasolina, precoEtanol
        
        escreva("Digite o valor da gasolina: ")
        leia(precoGasolina)
        
        escreva("Digite o valor do etanol: ")
        leia(precoEtanol)
        
        cadeia resposta = ""
        
        se(precoEtanol <= (0.7 * precoGasolina)) {
            resposta = "etanol"
        }senao {
            resposta = "gasolina"
        }
        
        escreva("O melhor custo benefício é " + resposta + ".\n")
    }
}
