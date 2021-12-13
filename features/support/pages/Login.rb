class Login < SitePrism::Page
    include Capybara::DSL

    #Elementos do front mapeados
    element :cpf, '#cpf'
    element :dataNasc, '#birthdate'
    element :btnEntrar, '.rounded_button'
    element :link_cnpf, '.login__loginMode'
    element :termos, '.terms'
 
    #Método para clicar na opção CNPJ
    def clicarCNPJ
        link_cnpf.click
    end
     
    #Método para visitar a pagina do portal
    def go
        visit 'http://clarohomologacao.negociafacil.com.br/'
    end

    #Método para inserir um devedor após consultar o cpf no banco de dados
    def preencheCampoCpf(cpf_recebido)
        cpf.set cpf_recebido
        @cpf2 = cpf_recebido
    end

     #Método para inserir um devedor após consultar o cpf no banco de dados
     def preencheCampoCNPJ
        cpf.set '04041965000183'
    end

    

    def ClicaTermos
        termos.click
    end


    def preencheCampoDataNascimento(data_nasc)
        dataNasc.set data_nasc
        @dataNasc2 = data_nasc
        
    end
    
    #Método comm a função de clicar no botão entrar
    def clicaBotaoEntrar
        btnEntrar.click
    end

    def preencheCampoCpfInvalido(cpf_inválido)
        cpf.set cpf_inválido
    end
    
    def preencheCampoDataNascimetoInvalido(data_invalida)
        dataNasc.set(data_invalida)
    end

    #Método que realiza o login completo , criado para ser utilizado nas validações que utilizam login como premissa. 
    def fazLogin (cpf_recebido, data_nasc)
   
        visit 'http://clarohomologacao.negociafacil.com.br/'
        cpf.set cpf_recebido
        dataNasc.set data_nasc
        termos.click
        sleep 2
        btnEntrar.click
    end

    
end