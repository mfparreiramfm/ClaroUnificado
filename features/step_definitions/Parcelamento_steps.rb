Dado('seleciona um contrato para ser negociado') do                                                
    @Parcelamento.selecionarContrato      
                
  end                                                                                                
                                                                                                     
  Entao('deve ser exibido na tela a\(s) opçõe\(s) de pagamento\(s)') do                              
  
    #instanciando classe para obter elementos da tela
    @parcelamento_list = Parcelamento.new
  
    #obtendo dados do getOpcoesPagamento
    @premissa = @Httparty.getDividas
    @dados = @Httparty.getOpcoesPagamento
    log @dados
    #@data = JSON.parse(@dados&.body || "{OpcoesPagamento}")
    #log @data
   

  end                                                                                                
                                                                                                     
  Entao('essas opções exibidas devem ser as mesmas recebidas via o  método GetOPçõesPagamento') do   
    
    @parcelamento_list.exibeOpcoesParcelamento.each { |opcoesPgt|@opcoesPgtAux =  opcoesPgt.to_s
 
     @opcoesPgtAux.sub! 'R$ ', ''
     @opcoesPgtAux.sub! '.', ''
     @opcoesPgtAux.sub! ',', '.'
     @valorFloat = @opcoesPgtAux.to_f
     log @opcoesPgtAux.class
     log @opcoesPgtAux.to_s
     log @valorFloat
    }
  end   
  
  Dado('seleciona uma opção de pagamento duas vezes ou mais') do 
      @Parcelamento.selecionarDuasVezes
    end