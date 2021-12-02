Before do
    #Variaveis globais
    @Login = Login.new
    # @Banco = Banco.new
    @Httparty = HttParty.new
   
   
end


# #Befora para pegar dados da base para fazer as chamadas HTTP e para fazer login. 
# Before("@login") do
#     log 'capturando dados do banco para teste'
#     @dados_obtidos = @Banco.consultarDevedorBDClaro
#     @cpf_obtido = [@dados_obtidos[0]]
#     @dev_id_obtido = @dados_obtidos[1].to_s
#     # log 'CPF selecionado para o teste ' + @cpf_obtido.to_s
#     # log 'dev id selecionado para o teste ' + @dev_id_obtido
#     @dados_obtidos_net = @Banco.consultarDevedorBDNet
#     @cpf_obtido_net = [@dados_obtidos[0]]
#     @dev_id_obtido_net = @dados_obtidos[1].to_s
# end

Before("@login") do
    visit 'http://clarohomologacao.negociafacil.com.br/'
    @Login.PreencheCampoCpf
    @Login.ClicaBotaoEntrar
end


 After do |scenario|
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    page.save_screenshot('log/screenshots/' + nome_cenario + '.png')
    screenshot = "log/screenshots/#{nome_cenario}.png"
    attach(screenshot, 'image/png')
 end

#  def add_screenshot(scenario)
#     nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
#     nome_cenario = nome_cenario.gsub(' ','_').downcase!
#     screenshot = "log/screenshots/#{nome_cenario}.png"
#     page.save_screenshot(screenshot)
#     attach(screenshot, 'image/png')
#  end