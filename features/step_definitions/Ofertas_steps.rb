Dado('que a revendedora esteja na tela principal do portal do NF boticario') do
    aux = find ('#linkOfertas')
    if aux 
        log 'logado'
    else
        log 'não logado'
    end
  end
  
  Entao('deve ser exibido na tela o\(s) contrato\(s) disponivéis para re-negociação') do
    
    # Classe para pegar todos elementos referentes aos contratos do devedores
    class Contratos < SitePrism::Page
      elements :contrato, '.offer__contractnum'
      elements :valor , '.offerCard__value > .color3'
    end
    

     # Obter as dividas do cliente
    
     @dados =  @Httparty.getDividas
     @data = JSON.parse(@dados.body || "{Dividas}")
     
    
  end
  
  Entao('os contratos devem ser recebidos via API') do
       # Loop para fazer a comparação
       @contratos_list = Contratos.new
       @contratos_list.contrato.each { |contrato|@contratoAux =  contrato.text 
         if (expect(@data).to have_content(@contratoAux))
 
                   log "Contrato #{@contratoAux} encontrado"
                   
                 else
                   log "Contrato #{@contratoAux} não encontrato"
                 end
       
       }
 
     @valores_list = Contratos.new
     @valores_list.valor.each { |valor| @valoresAux =  valor.text 
       @valoresAux.sub! 'R$ ', ''
       @valoresAux.sub! '.', ''
       @valoresAux.sub! ',', '.'
       @valorFloat = @valoresAux.to_f
       
       if (expect(@data).to have_content(@valorFloat))
         log "valores #{@valorFloat} encontrados"
       else
         log "Valores #{@valorFloat} não encontratos"
       end
 
     }
    
  end