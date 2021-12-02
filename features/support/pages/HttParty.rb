class HttParty  

    # def initialize
    #     @Banco = Banco.new
        
    #     @dados_banco = @Banco.consultarDevedorBDClaro
    #     @cpf = @dados_banco[0]
    #     @codigoDevedorClaro = @dados_banco[1]
        
        
    #     @dados_banco_net = @Banco.consultarDevedorBDNet
    #     @dev_id_net  = @dados_banco_net[1].to_s
     
    #     @codTitulo =  @Banco.consultarTitulo(@codigoDevedorClaro)
    #     puts @codTituloClaro
        
    # end

   
    def getToken
        @tokenEnvioUnificado = 'yz8qTu%2F8kAS3BGSt1nrt3F%2B21Fi%2Fm%2Ftojm02lkyKKK0rmxNd618R3QAm%2FVV7UlEV'
        @tokenEnvioClaro = 'K33IqhJtvItFIZidMhY5ivjCaur7fhlv6Q9EhfcHk0Jn50i7rtDVcg=='
        @tokenEnvioNet = 'DVpAs+KdwJ8ejBh4GNcuWwZ+ONj6vxeuyiYljmCiUGcVqVHuYc2Zlg=='
        response = HTTParty.get("http://10.100.71.138/api/tokenV8/GetTokenV8?pTokenOperacaoPortal=#{@tokenEnvioUnificado}&pAplicacaoOrigem=Swagger")
        @acessTokenUnificado = response ['access_token']
    end

  
    def getDevedor

        
        #chamada para obter o devedor 
        response = HTTParty.get("http://10.100.71.138/api/divida/GetDadosDivida?codigoDevedor=18854-7899930&accessToken=yz8qTu%2F8kAS3BGSt1nrt3F%2B21Fi%2Fm%2Ftojm02lkyKKK0rmxNd618R3QAm%2FVV7UlEV&pTokenOperacaoPortal=yz8qTu%2F8kAS3BGSt1nrt3F%2B21Fi%2Fm%2Ftojm02lkyKKK0rmxNd618R3QAm%2FVV7UlEV&pAplicacaoOrigem=swagger&pCpf=#{@cpf_obtido}")

     
    end
 

    def getDividas
        
        #para a chamada do métoddo getDividas quando o usuario não tem divida na net o código enviado deve ser 0
        if @dev_id_net == nil
            @dev_id_net = "0"
        end

        

        # Código rersponsavel por trazer dados da divida do devedor
        response = HTTParty.get("http://10.100.71.138/api/divida/GetDadosDivida?codigoDevedor=#{@codigoDevedorClaro}-#{@dev_id_net}&accessToken=pklN8RiL97EEpuJ5rvyicUNuvMbIB5h8W0YMc1yj6vPgbLr9xOnIhiDszpoc5yvh&pCpf=#{@cpf}&pTokenOperacaoPortal=yz8qTu%2F8kAS3BGSt1nrt3F%2B21Fi%2Fm%2Ftojm02lkyKKK0rmxNd618R3QAm%2FVV7UlEV&pAplicacaoOrigem=FRONTEND_NEGOCIAFACIL_CLARO")
        

    end
    

    def getOpcoesPagamento
        
         # cod para obter as opções de pagamento
         response = HTTParty.get("http://10.100.71.138/api/opcoesPagamento/GetOpcoesPagamento?codigoTitulo=1918856&accessToken=ntZcPuoCGHZCdtIxIC2M1IupS4ZLoT4mK87KW36DqDK8tgRqmoebktCCbZmhNdkQ&pCpf=08492872000126&pTokenOperacaoPortal=K33IqhJtvItFIZidMhY5ivjCaur7fhlv6Q9EhfcHk0Jn50i7rtDVcg%3D%3D&pAplicacaoOrigem=FRONTEND_NEGOCIAFACIL_CLARO")
        
    end

    def getAcordos
        
        # cod para obter os acordos
        response = HTTParty.get("http://10.100.71.138/api/acordo/GetDadosListaAcordos?chavePesquisa=4482398&accessToken=9DSjEzYdbFFPR3Jx9kBA_K966qo9JCzrRle-uKLzjoSCMUbqYSWvy-vZTYK3-AfYoBu1lvLfb-LOg7R2J5efYwDI320gGizVAfkH87OuIfegqP1Mc-erQcETck9yYYjMxNgbeqDuDVzhxFqcEYfHNW34ML4Zrg4XnwwLnL_v7msvDWmzgLQranLUcysx8P7m2gl_yfbkVhpsCOaBCv8Vq1d9oePNZvGb5eipktPDjr4MZ0dM-fQlZoVnZizCLDtq&pTokenOperacaoPortal=Ia7HTYQYm2nUYXAE%2B83P7RNiwvHqeNmACwW8qZc%2BYj%2Bi%2FC%2FfbS30Al%2Fq%2FXwO0Xhx&pAplicacaoOrigem=Swagger&pCpf=14059094714%20%20%20%20%20%20%20")
       
    end
end
 