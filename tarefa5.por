programa {
    /*
        Problema: Jogo da Velha
        Conhecimento:
            * Loop interativo
            * Matrizes
            * Alternar jogadores
            * Verificação do vencedor
            * Verificação da direção da vitória
            * Verificação das jogadas válidas
            * Limpar tela
    */
    
    funcao inicio() {
        cadeia matrizJogo[3][3] = {
            {" ", " ", " "},
            {" ", " ", " "},
            {" ", " ", " "}
        }
        
        cadeia direcaoVitoria = ""
        
        cadeia situacaoMatrizJogo = verificaMatrizJogo(matrizJogo, direcaoVitoria)
        
        logico estadoJogo = verdadeiro
        
        cabecalhoJogo()
        
        cadeia jogador1, jogador2, jogadorVencedor
        
        escreva("Digite o nome do jogador 1: ")
        leia(jogador1)
        escreva("Digite o nome do jogador 2: ")
        leia(jogador2)
        
        jogadorVencedor = jogador1
        exibeRegras(jogador1, jogador2)
        
        exibeMatrizJogo(matrizJogo)
        
        logico vezDoPrimeiroJogador = verdadeiro
        inteiro posicaoLinha, posicaoColuna
        logico jogadaValida = falso
        
        faca{
            faca {
                limpa()
                exibeMatrizJogo(matrizJogo)
                se(vezDoPrimeiroJogador){
                    escreva("É a vez do jogador: ", jogador1, "\n")
                }senao{
                    escreva("É a vez do jogador: ", jogador2, "\n")
                }
                
                escreva("Digite uma posição válida para a linha: ")
                leia(posicaoLinha)
                
                escreva("Digite uma posição válida para a coluna: ")
                leia(posicaoColuna)
                
                jogadaValida = preencheMatrizJogo(matrizJogo, posicaoLinha, posicaoColuna, vezDoPrimeiroJogador)
                
                //  Troca de jogadores, caso a jogada seja válida
                se(jogadaValida){
                    vezDoPrimeiroJogador = nao vezDoPrimeiroJogador
                }
                
            }enquanto(jogadaValida == falso)
            
            situacaoMatrizJogo = verificaMatrizJogo(matrizJogo, direcaoVitoria)
            
            se(situacaoMatrizJogo == "X"){
                jogadorVencedor = jogador1
            }senao se(situacaoMatrizJogo == "O"){
                jogadorVencedor = jogador2
            }
            
        }enquanto(situacaoMatrizJogo == "Continua")
        
        limpa()
        exibeMatrizJogo(matrizJogo)
        
        se(situacaoMatrizJogo != "Velha"){
            escreva("Jogador vencedor: ", jogadorVencedor, "!!!\n")
            escreva("Direção da vitória: ", direcaoVitoria)
        }senao {
            escreva("O jogo deu em Velha!")
        }
    }
    
    funcao vazio cabecalhoJogo(){
        escreva ("--------------------------\n")
        escreva ("       Jogo da Velha      \n")
        escreva ("--------------------------\n")
        escreva ("\n")
    }
    
    funcao vazio exibeRegras(cadeia jogador1,cadeia jogador2) {
    	escreva("***********************************************:\n")
    	escreva("Regras do jogo:\n")
    	escreva("Jogador ",jogador1," joga com o 'X'\n")
    	escreva("Jogador ",jogador2," joga com o 'O'\n")
    	escreva("***********************************************:\n\n")
    }
    
    funcao vazio exibeMatrizJogo(cadeia matrizJogo[][]){
        escreva("*********************\n")
        escreva("\t 0\t 1\t 2\n")
        para(inteiro linha = 0; linha < 3; linha++){
            escreva(linha, "\t")
            para(inteiro coluna = 0; coluna < 3; coluna++) {
                escreva("[", matrizJogo[linha][coluna], "]\t")
            }
            escreva("\n")
        }
        escreva("*********************\n")
    }
    
    funcao logico preencheMatrizJogo(cadeia matrizJogo[][], inteiro posicaoLinha, inteiro posicaoColuna, logico vezDoPrimeiroJogador){
        //  Linha ou Coluna invalidos: não foi possível preencher a matriz
        se(posicaoLinha < 0 ou posicaoLinha > 2 ou posicaoColuna > 2 ou posicaoColuna < 0){
            retorne falso
        }
        
        se(matrizJogo[posicaoLinha][posicaoColuna] == " "){
            se(vezDoPrimeiroJogador) {
                matrizJogo[posicaoLinha][posicaoColuna] = "X"
                retorne verdadeiro
            }senao {
                matrizJogo[posicaoLinha][posicaoColuna] = "O"
                retorne verdadeiro
            }
        }
        
        //  Posição da matriz já tem um elemento: não foi possível preencher a matriz
        retorne falso
    }
    
    funcao cadeia verificaMatrizJogo(cadeia matrizJogo[][], cadeia &direcaoJogo){
        //  Diagonal principal
        se(matrizJogo[0][0] == matrizJogo[1][1] e matrizJogo[0][0] == matrizJogo[2][2]){
            se(matrizJogo[0][0] != " "){
                direcaoJogo = "diagonal"
                retorne matrizJogo[0][0]
            }
        }
        
        //  Diagonal secundária
        se(matrizJogo[2][0] == matrizJogo[1][1] e matrizJogo[2][0] == matrizJogo[0][2]){
            se(matrizJogo[2][0] != " "){
                direcaoJogo = "diagonal"
                retorne matrizJogo[2][0]
            }
        }
        
        inteiro linha, coluna
        
        //  Verifica todas as linhas
        para(linha = 0; linha < 3; linha++){
            se(matrizJogo[linha][0] == matrizJogo[linha][1] e matrizJogo[linha][0] == matrizJogo[linha][2]){
                se(matrizJogo[linha][0] != " "){
                    direcaoJogo = "horizontal"
                    retorne matrizJogo[linha][0]
                }
            }
        }
        
        //  Verifica todas as colunas
        para(coluna = 0; coluna < 3; coluna++){
            se(matrizJogo[0][coluna] == matrizJogo[1][coluna] e matrizJogo[0][coluna] == matrizJogo[2][coluna]){
                se(matrizJogo[0][coluna] != " "){
                    direcaoJogo = "vertical"
                    retorne matrizJogo[0][coluna]
                }
            }
        }
        
        //  Verifica se há espaços vazios, ou seja, se ainda pode ser feita jogadas
        para(linha = 0; linha < 3; linha++){
            para(coluna = 0; coluna < 3; coluna++){
                se(matrizJogo[linha][coluna] == " "){
                    retorne "Continua"
                }
            }
        }
        
        //  Não há espaços vazios nem jogador vencedor: jogo deu velha
        retorne "Velha"
    }
}
