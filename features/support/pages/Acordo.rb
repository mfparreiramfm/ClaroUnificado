class Acordo < SitePrism::Page
    include Capybara::DSL

    #elementos mapeados da tela de confirmação de acordo
    element :datavencimento , '.dueDate'
    element :email, '#email'
    element :telefone, '#cellphone'
    element :confirmarAcordoBtn, '.default_button'
    element :codigoBarra, '.barcode'
    element :errorList, '.messenger > .messenger__container > .messenger  >.error'
    element :acordoAndamento , '.deals-list'

    #Método para inserir uma data válida de vencimento
    def selecionarVencimento
      
    end

    #Método para inserir um e-mail válido 
    def inserirEmail
        email.click
        email.set "marcelo.parreira@mfmti.com.br"
    end

    #Método para inserir um telefone válido 
    def inserirTelefone
        telefone.click
        telefone.set "11969905694"
    end

    #Método para clicar no botão confirmar acordo
    def confirmarAcordo
        sleep 10
         confirmarAcordoBtn.click
    end

    def validaAcordoCodBar
        @codigoDeBarra = codigoBarra
    
    end

    def validaAcordoMsg
        @msgTela = acordoAndamento
    end

    def  validaErro
        @msgErroTela = errorList.text
    end
    

end