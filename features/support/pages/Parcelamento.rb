class Parcelamento < SitePrism::Page
    include Capybara::DSL

    #Elementos do front mapeados
   
    elements :opcoesPgt, '.deals > .offers-card'
    element :continuarBtn, '.default_button'
    element :selecionarDuasVezes, '.offers-picker '
    elements :selecionarContratoANegociar, '.bgcolor4'
   

    def selecionarContrato
        sleep 2
        selecionarContratoANegociar[0].click   
    end

    
    def exibeOpcoesParcelamento
        @opções = opcoesPgt.to_s      
    end

    def continuarAcordo
        continuarBtn.click
    end
     
    def selecionarDuasVezes
        selecionarDuasVezes[1].click
    end
    
    
end