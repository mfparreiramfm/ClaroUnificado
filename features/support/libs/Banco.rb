
class Banco


    def consultarDevedorBDClaro
      #dados de conexão para o banco
      client = TinyTds::Client.new username: 'CLARO', password: 'e0f2c6c252',  
      host: '172.16.140.167', port: 1433,  
      database: 'CLARO_HMG', azure:false 


      # Select utilizado para capturar o CPF e o NOME do devedor na Base
      select = "SELECT top 1 DEV_CPF , DEV_ID
      from tab_devedor(nolock)
      inner join tab_titulo(nolock) on dev_id = tit_devedor
      inner join tab_titulo_parcela(nolock) on tit_id = tpa_titulo
      where tpa_status in ('A')"
        # executando o select na base
        @resultado = client.execute(select)
   
        #Obtendo o cpf do resultado obtidow
        @resultado.each do |row|
          @cpfObtido = row['DEV_CPF']
          @DEV_ID = row['DEV_ID']
  
        end
        @devedor_obtido = [@cpfObtido, @DEV_ID]
        
     end

     def consultarDevedorBDNet
      #dados de conexão para o banco
      client = TinyTds::Client.new username: 'sa', password: 'Dciyve$j@mfm58#!',  
      host: 'MFM05', port: 1433,  
      database: 'INTERSIC_NET_HOMOLOGACAO', azure:false  
   
     # Select utilizado para capturar o CPF e o NOME do devedor na Base
      select = "SELECT top 1 DEV_CPF , DEV_ID
      from tab_devedor(nolock)
      inner join tab_titulo(nolock) on dev_id = tit_devedor
      inner join tab_titulo_parcela(nolock) on tit_id = tpa_titulo"
        # executando o select na base
        @resultado = client.execute(select)
   
        #Obtendo o cpf do resultado obtido
        @resultado.each do |row|
          @cpfObtidoNet = row['DEV_CPF']
          @DEV_ID_NET = row['DEV_ID']
  
        end
        @devedor_obtido_net = [@cpfObtidoNet, @DEV_ID_NET]
  
     end

     def consultarTitulo(tit_dev)
       #dados de conexão para o banco
       client = TinyTds::Client.new username: 'CLARO', password: 'e0f2c6c252',  
        host: '172.16.140.167', port: 1433,  
        database: 'CLARO_HMG', azure:false   

       # Select utilizado para capturar o codigo titulo da divida na Base
      select = " SELECT top 1 TIT_SOURCEKEY from TAB_TITULO tt WHERE TIT_DEVEDOR =  #{tit_dev}"

       # executando o select na base
       @resultado2 = client.execute(select)
       @resultado2.each do |row|
           @cod_titulo = row ['TIT_SOURCEKEY']
       end
      
       @codTituloClaro = @cod_titulo

     end
     
    
  end