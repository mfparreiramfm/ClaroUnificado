class HttParty  

    def initialize
        @Banco = Banco.new
        
        @dados_banco = @Banco.consultarDevedorBDClaro
        @cpf = @dados_banco[0]
        @codigoDevedorClaro = @dados_banco[1]
        @dataNasc = @dados_banco[2]
        @dataNascConve = @dataNasc.to_s
        @ano = @dataNascConve[0..3]
        @mes = @dataNascConve[5..6]
        @dia = @dataNascConve[8..9]
    
        @data_nasc = @dia + "-" + @mes + "-" + @ano.to_s
        
        @dados_banco_net = @Banco.consultarDevedorBDNet
        @dev_id_net  = @dados_banco_net[1].to_s
     
        @codTitulo =  @Banco.consultarTitulo(@codigoDevedorClaro)
 
        response = HTTParty.get("http://10.100.71.138/api/token" , :headers => {"Content-Type" => "application/json" } , :body => {"client_id":"UNIFICADO" , "username":@cpf , "password":@data_nasc ,"Scope":"JsUCfSE1xvyiEBTCh0pOKrDnLUKOuEnlNwHz/mGZrmi8VNl944vPa96EcH80exrf NEGOCIAFACIL_FRONTEND_UNIFICADO" , "grant_type":"password"})
        @acessTokenUnificado = response ['access_token']
        
    end

 

  
    def getDevedor
        #chamada para obter o devedor 
        
        response = HTTParty.get("http://10.100.71.138/api/devedor/GetDadosDevedor", :headers => {"Content-Type" => "application/json" , "Authorization" => "Bearer #{@acessTokenUnificado}"})
        puts response
     
    end
 

    def getDividas
        
        #para a chamada do métoddo getDividas quando o usuario não tem divida na net o código enviado deve ser 0
        if @dev_id_net == nil
            @dev_id_net = "0"
        end

        

        # Código rersponsavel por trazer dados da divida do devedor
        response = HTTParty.get("http://10.100.71.138/api/divida/GetDadosDivida", :headers => {"Content-Type" => "application/json" , "Authorization" => "Bearer #{@acessTokenUnificado}"})
        
    
        
    end
    

    def getOpcoesPagamento

        # Código rersponsavel por trazer dados da divida do devedor
        response = HTTParty.get("http://10.100.71.138/api/divida/GetDadosDivida", :headers => {"Content-Type" => "application/json" , "Authorization" => "Bearer #{@acessTokenUnificado}"})
        @teste = response[0]['Dividas']
        @cod_deve = @teste[0]['CodigoTitulo']
        
         # cod para obter as opções de pagamento
         response = HTTParty.post("http://10.100.71.138/api/opcoesPagamento/PostOpcoesPagamento?pChavePesquisa=#{@cod_deve}&pProduto=CLARO", :headers => {"Content-Type" => "application/json" , "Authorization" => "Bearer #{@acessTokenUnificado}"})
         puts response
    end

    def getAcordos
        
        # cod para obter os acordos
        response = HTTParty.get("http://10.100.71.138/api/acordo/GetDadosListaAcordos?chavePesquisa=4482398&accessToken=9DSjEzYdbFFPR3Jx9kBA_K966qo9JCzrRle-uKLzjoSCMUbqYSWvy-vZTYK3-AfYoBu1lvLfb-LOg7R2J5efYwDI320gGizVAfkH87OuIfegqP1Mc-erQcETck9yYYjMxNgbeqDuDVzhxFqcEYfHNW34ML4Zrg4XnwwLnL_v7msvDWmzgLQranLUcysx8P7m2gl_yfbkVhpsCOaBCv8Vq1d9oePNZvGb5eipktPDjr4MZ0dM-fQlZoVnZizCLDtq&pTokenOperacaoPortal=Ia7HTYQYm2nUYXAE%2B83P7RNiwvHqeNmACwW8qZc%2BYj%2Bi%2FC%2FfbS30Al%2Fq%2FXwO0Xhx&pAplicacaoOrigem=Swagger&pCpf=14059094714%20%20%20%20%20%20%20")
       
    end
end
 