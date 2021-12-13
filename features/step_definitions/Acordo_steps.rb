Dado('seleciona uma opção de pagamento') do                                     
    @Parcelamento.selecionarContrato
    @Parcelamento.continuarAcordo
  end                                                                             
                                                                                  
  Quando('o devedor seleciona a data de vencimento') do                           
    @Acordo.selecionarVencimento
  end                                                                             
                                                                                  
  Quando('informa E-mail e\(ou) telefone') do                                    
    # @Acordo.inserirEmail
    @Acordo.inserirTelefone
  end                                                                             
                                                                                  
  Quando('Clica em gerar acordo') do                                              
    @Acordo.confirmarAcordo
  end                                                                             
                                                                                  
  Entao('deve ser gerado um acordo exibindo Código de barra') do        
    
    @codigoBarra = @Acordo.validaAcordoCodBar
    # @textoValidarAcordo = @Acordo.validaAcordoMsg
    # log @textoValidarAcordo.text
    if (@codigoBarra)
        log "Acordo gravado"
    else 
        log "Acordo não gravado"
      end
  end                
  
  Entao('deve ser exibido o erro') do
    @erro = @Acordo.validaErro
    expect(@erro).to eql('É necessário o preenchimento de um e-mail ou telefone válidos')
  end
 
 