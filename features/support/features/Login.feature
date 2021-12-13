#language: pt

@Login_steps
Funcionalidade: Login
Sendo uma revendedora Boticário com uma dívida ativa
Posso acessar  o sistema com meu CPF para visualizar meus débitos
Para assim poder efetuar acordos


            # @consultar_devedor_bd
            # Cenario: Consultar devedor no banco de dados
            # Dado que um teste vai ser iniciado
            # Entao consulto no banco um devedor


            @cpf_valido
            Cenario: Usuário faz login

            Dado que a devedor acesse o sistema
            E Preencha o cpf 
            E Preencha a data de nascimento
            E clique em aceitar termos
            E clique em consulte
            Então vejo o menu principal


            @cnpj_valido
            Cenario: Usuário faz login usando CNPJ
            Dado que a devedor acesse o sistema
            E clique na opção para incluir CNPJ
            E Preencha o CNPJ
            E clique em aceitar termos
            E clique em consulte
            Então vejo o menu principal


            @cpf_nao_encontrado
            Cenario: CPF Não Encontrado

            Dado que a devedor acesse o sistema
            E Preencha o cpf invalido "35967338802"
            E Preencha a data de nascimento
            E clique em aceitar termos
            E clique em consulte
            Então deve ver uma mensagem de erro informando "Dados de acesso inválidos."


            @data_nascimento_invalida
            Cenario: Data nascimento errada

            Dado que a devedor acesse o sistema
            E Preencha o cpf 
            E Preencha a data de nascimento errada "11/10/195"
            E clique em aceitar termos
            E clique em consulte
            Então deve ver uma mensagem de erro informando "Por favor, preencha sua data de nascimento."