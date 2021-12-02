class Login < SitePrism::Page
    include Capybara::DSL

    #Elementos do front mapeados
    element :cpf, '#cpf'
    element :dataNasc, '#birthdate'
    element :btnEntrar, '.rounded_button'
    element :link_cnpf, '.login__loginMode'
    element :termos, '.terms'

    #Método que realiza o login completo , criado para ser utilizado nas validações que utilizam login como premissa. 
    def fazLogin(cpf_recebido)
    
        visit 'http://clarohomologacao.negociafacil.com.br/'
        # visit 'http://localhost:3000/'
        cpf.set '01950774740'
        dataNasc.set '23/02/1959'
        btnEntrar.click
        btnEntrar.click
    end


    #Método para clicar na opção CNPJ
    def clicarCNPJ
        link_cnpf.click
    end
     
    #Método para visitar a pagina do portal
    def go
        visit 'http://clarohomologacao.negociafacil.com.br/'
    end

    #Método para inserir um devedor após consultar o cpf no banco de dados
    def PreencheCampoCpf(cpf_rec)
        cpf.set (cpf_rec)
    end

    #Método para inserir um devedor após consultar o cpf no banco de dados
    def PreencheCampoCNPJ
        cpf.set '04041965000183'
    end

    def ClicaTermos
        termos.click
    end


    def PreencheCampoDataNascimento(data_rec)
        dataNasc.set (data_rec)
    end
    
    #Método comm a função de clicar no botão entrar
    def ClicaBotaoEntrar
        btnEntrar.click
    end

    def PreencheCampoCpfInvalido(cpf_inválido)
        cpf.set cpf_inválido
    end
   
    
end