Before do
    #Variaveis globais
    @Login = Login.new
    @Banco = Banco.new
    @Httparty = HttParty.new
    @Parcelamento = Parcelamento.new
    @Acordo = Acordo.new
end


#Befora para pegar dados da base para fazer as chamadas HTTP e para fazer login. 
Before("@consultaBanco") do
    log 'capturando dados do banco para teste'
    @dados_obtidos = @Banco.consultarDevedorBDClaro
    @cpf_obtido = [@dados_obtidos[0]]
    @dev_id_obtido = @dados_obtidos[1].to_s
    log 'CPF selecionado para o teste ' + @cpf_obtido.to_s
    log 'dev id selecionado para o teste ' + @dev_id_obtido
    log "finalizado consulta banco"
    # @dados_obtidos_net = @Banco.consultarDevedorBDNet
    # @cpf_obtido_net = [@dados_obtidos[0]]
    # @dev_id_obtido_net = @dados_obtidos[1].to_s
end

Before("@login") do
  cpf_recebido = @Banco.consultarDevedorBDClaro[0].to_s 
  @dataNasc = @Banco.consultarDevedorBDClaro[2]
    @dataNascConve = @dataNasc.to_s
    @ano = @dataNascConve[0..3]
    @mes = @dataNascConve[5..6]
    @dia = @dataNascConve[8..9]
    
  data_nasc = @dia + @mes + @ano.to_s
  
  @Login.fazLogin(cpf_recebido, data_nasc)
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
  nome_cenario = nome_cenario.gsub(' ','_').downcase!
  page.save_screenshot('log/screenshots/' + nome_cenario + '.png')
  screenshot = "log/screenshots/#{nome_cenario}.png"
  attach(screenshot, 'image/png')
end