# language: pt

@login
@Ofertas_steps
Funcionalidade: Ofertas
    Sendo uma revendedora Boticário com uma dívida ativa
    Ao acessar o sistema devo ver os valores referentes a(s) minha(s) divida(s)
    Assim como as ofertas de acordo

@Contrato_disponivel
Cenario: Verificar contratos em aberto
    Dado que a revendedora esteja na tela principal do portal do NF boticario
    Entao deve ser exibido na tela o(s) contrato(s) disponivéis para re-negociação
    E os contratos devem ser recebidos via API
    

