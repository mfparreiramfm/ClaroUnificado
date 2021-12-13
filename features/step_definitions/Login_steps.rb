
Dado('que a devedor acesse o sistema') do
    @Login.go
end
  
Dado('Preencha o cpf') do 
   cpf = @Banco.consultarDevedorBDClaro[0]
   @Login.preencheCampoCpf(cpf)
end
  
Dado('clique em consulte') do
    @Login.clicaBotaoEntrar
    # @premissa = @Httparty.getDividas
    # @dados = @Httparty.getOpcoesPagamento
    #log @dados
end
  
Então('vejo o menu principal') do
    
    aux = find ('#linkOfertas')
        if aux 
            log 'logado'

        else
            log 'não logado'
        end
end



Dado('clique em aceitar termos') do
    @Login.ClicaTermos
  end

Dado('clique na opção para incluir CNPJ') do
    @Login.clicarCNPJ
end
  
Dado('Preencha o CNPJ') do
    @Login.preencheCampoCNPJ
end


Dado('Preencha o cpf invalido {string}') do |cpf_inválido|
  @Login.preencheCampoCpfInvalido(cpf_inválido)
    
end
  
Dado('Preencha a data de nascimento') do
    @dataNasc = @Banco.consultarDevedorBDClaro[2]
    @dataNascConve = @dataNasc.to_s
    @ano = @dataNascConve[0..3]
    @mes = @dataNascConve[5..6]
    @dia = @dataNascConve[8..9]
    
    @dataNascFinal = @dia + @mes + @ano
    
    @Login.preencheCampoDataNascimento(@dataNascFinal)
  end
  
  Dado('Preencha a data de nascimento errada {string}') do |data_nasc_errada|
    @Login.preencheCampoDataNascimetoInvalido(data_nasc_errada)
  end
  
Então('deve ver uma mensagem de erro informando {string}') do |msg|
    msg_error = find('.errorList').text
    expect(msg_error).to eql msg
end

