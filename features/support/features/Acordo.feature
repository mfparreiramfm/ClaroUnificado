# language: pt

@login

@Acordos_steps
Funcionalidade: Acordos
    Sendo uma revendedora Boticário com uma dívida ativa
    Ao acessar o sistema devo ver os valores referentes a(s) minha(s) divida(s)
    Assim como as ofertas de acordo
    Informando dados de e-mail e(ou) telefone
    Consigo gravar um acordo

@Acordo_À_Vista
Cenario: Gerar acordo à Vista
    Dado que a revendedora esteja na tela principal do portal do NF boticario
    E seleciona um contrato para ser negociado
    E seleciona uma opção de pagamento
    Quando o devedor seleciona a data de vencimento
    E informa E-mail e(ou) telefone
    E Clica em gerar acordo
    Entao deve ser gerado um acordo exibindo Código de barra
     

# @Acordo_Parcelado
# Cenario: Gerar acordo Parcelado
#     Dado que a revendedora esteja na tela principal do portal do NF boticario
#     E seleciona um contrato para ser negociado
#     E seleciona uma opção de pagamento duas vezes ou mais 
#     Quando o devedor seleciona a data de vencimento
#     E informa E-mail e(ou) telefone
#     E Clica em gerar acordo
#     Entao deve ser gerado um acordo exibindo Código de barra

@Dados_Nao_Preenchidos
Cenario: Validar erro ao não preenncher campos obrigatórios
    Dado que a revendedora esteja na tela principal do portal do NF boticario
    E seleciona um contrato para ser negociado
    E seleciona uma opção de pagamento  
    Quando o devedor seleciona a data de vencimento
    E Clica em gerar acordo
    Entao deve ser exibido o erro 