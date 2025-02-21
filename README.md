# Projeto CXPedidos - Cadastro de Pedidos e Clientes - Teste Técnico - Hélio Marques

Cadastro de Pedidos e Clientes

## Agrecimento pela Oportunidade

![## Atenção CX](https://github.com/HelioHub/cxpedidos/blob/main/Imagens/Atencao3.png)
![## Atenção CX](https://github.com/HelioHub/cxpedidos/blob/main/Imagens/Atencao.png)

## Requisitos 

-Criar um projeto VCL com um CRUD de clientes
-Realizar a integração da seguinte API para consulta de CEP: https://brasilapi.com.br/docs#tag/CEP
-Realizar a integração da seguinte API para consulta de CNPJ: https://brasilapi.com.br/docs#tag/CNPJ
-Realizar a integração da seguinte API para trazer o código do IBGE e informar no cadastro do cliente: https://brasilapi.com.br/docs#tag/IBGE
-Salvar os dados e exibir em uma grid e também ter a opção de editar ou excluir o registro da grid
-Realizar a impressão de todos os registros
-Realizar a impressão de registros selecionados
-Realizar a alteração na rotina de consulta CEP para trazer a latitude e longitude: https://brasilapi.com.br/docs#tag/CEP-V2 
-As informações podem ser salvar em um banco ou em memoria(Memtable) - (caso for usar banco de teste nos passe o banco para poder testar a aplicação)
-Enviar o fonte por email ou o link do github com o projeto publico

## Diagrama de Entidade e Relacionamento 

![## Diagrama de Entidade e Relacionamento CX](https://github.com/HelioHub/cxpedidos/blob/main/BD/EERDiagram.png)

## Arquitetura do Sistema 

	• Aplicação Client/Server;
	• Aplicação Clean Code;
	• Orientação a objetos;
	• Padrões de projeto;
	• Garantir integridade do dados;
	• Padrão MVC;
	• Camada de persistência Firedac.

## Tecnologia 

	Embarcadero® Delphi Community Edition Version 29.0.51961.7529 
	Copyright © 2024 Embarcadero Technologies, Inc. All Rights Reserved.

## PW DB MySQL

	MySQL Installer 5.7.44
	https://dev.mysql.com/downloads/installer/
	root/wk@123
	Service Name: MySQL57
	DataBase: WKPedidos
	
## GITHub

	git init
	git remote add origin git@github.com:HelioHub/cxpedidos.git
	git add .
	git commit -m "Firts commit"
	git push -u origin main
	
## Clean Code

	https://balta.io/artigos/clean-code	

## Criação do Banco de Dados e Objetos do Banco

	# ==== Projeto WKPedidos === #
	# ====   Hélio  Marques  === #

	# ==== Criação do Banco === #
	#---------------------------#
	#Create database WKPedidos;
	#use WKPedidos;

	# ==== Criação das tables e indexes === #
	#---------------------------------------#
	#DROP TABLE `WKPedidos`.`ItensPedido` cascade;
	#DROP TABLE `WKPedidos`.`Pedidos` cascade;
	#DROP TABLE `WKPedidos`.`Clientes` cascade;
	#DROP TABLE `WKPedidos`.`Produtos` cascade;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Clientes` (
	  `CodigoClientes` INT NOT NULL AUTO_INCREMENT,
	  `CNPJClientes` VARCHAR(14) NULL,
	  `NomeClientes` VARCHAR(80) NULL,
	  `CEPClientes` VARCHAR(8) NULL,
	  `RuaClientes` VARCHAR(100) NULL,
	  `BairroClientes` VARCHAR(50) NULL,
	  `CidadeClientes` VARCHAR(50) NULL,
	  `UFClientes` VARCHAR(2) NULL,
	  `LongitudeClientes` DECIMAL(17,7) NULL,
	  `LatitudeClientes` DECIMAL(17,7) NULL,
	  `CodIBGEClientes` VARCHAR(10) NULL,
	  `NomeFantasiaClientes` VARCHAR(100) NULL,
	  `SitCadastralClientes` VARCHAR(30) NULL,
	  PRIMARY KEY (`CodigoClientes`),
	  INDEX `INDEX_NOME` (`NomeClientes` ASC))
	ENGINE = InnoDB;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Produtos` (
	  `CodigoProdutos` INT NOT NULL AUTO_INCREMENT,
	  `DescricaoProdutos` VARCHAR(80) NULL,
	  `PrecoVendaProdutos` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`CodigoProdutos`),
	  INDEX `INDEX_DESCRICAO` (`DescricaoProdutos` ASC) )
	ENGINE = InnoDB;

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`Pedidos` (
	  `NumeroPedidos` INT NOT NULL AUTO_INCREMENT,
	  `DataEmissaoPedidos` DATETIME NULL,
	  `ClientePedidos` INT NULL,
	  `ValorTotalPedidos` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`NumeroPedidos`),
	  INDEX `FK_CLIENTE_idx` (`ClientePedidos` ASC),
	  INDEX `INDEX_DATAEMISSAO` (`DataEmissaoPedidos` ASC),
	  CONSTRAINT `FK_CLIENTE`
		FOREIGN KEY (`ClientePedidos`)
		REFERENCES `WKPedidos`.`Clientes` (`CodigoClientes`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;	

	CREATE TABLE IF NOT EXISTS `WKPedidos`.`ItensPedido` (
	  `idItensPedido` INT NOT NULL AUTO_INCREMENT,
	  `PedidoItensPedido` INT NULL,
	  `ProdutoItensPedido` INT NULL,
	  `QuantidadeItensPedido` DECIMAL(10,2) NULL,
	  `VlrUnitarioItensPedido` DECIMAL(17,3) NULL,
	  `VlrTotalItensPedido` DECIMAL(17,3) NULL,
	  PRIMARY KEY (`idItensPedido`),
	  INDEX `FK_PEDIDO_idx` (`PedidoItensPedido` ASC),
	  INDEX `FK_PRODUTO_idx` (`ProdutoItensPedido` ASC),
	  CONSTRAINT `FK_PEDIDO`
		FOREIGN KEY (`PedidoItensPedido`)
		REFERENCES `WKPedidos`.`Pedidos` (`NumeroPedidos`)
		ON DELETE CASCADE
		ON UPDATE NO ACTION,
	  CONSTRAINT `FK_PRODUTO`
		FOREIGN KEY (`ProdutoItensPedido`)
		REFERENCES `WKPedidos`.`Produtos` (`CodigoProdutos`)
		ON DELETE CASCADE
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;

	#PRODUTOS#
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Mouse', '15');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Monitor 14p', '200');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'CPU Intel i5', '2000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Teclado', '25');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Mãe X', '500');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Mãe Y', '600');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Mãe W', '700');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Vídeo X', '300');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Vídeo Y', '400');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Placa-Vídeo W', '500');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Processador i3', '600');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Processador i5', '800');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Processador i9', '1000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'CPU i3', '1000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'CPU i9', '2000');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Gabinete X', '90');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Gabinete Y', '100');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Gabinete W', '110');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Camera HD', '100');
	INSERT INTO `wkpedidos`.`produtos` ( `DescricaoProdutos`, `PrecoVendaProdutos`) VALUES ( 'Pad-Mouse', '5.5');

## Sugestões para otimizar o Banco de dados MySQL WKPedidos:

   Com Índices já Existentes, com Índices Adicionais e com Consultas SQL performáticas. 
   Considerando boas práticas e para melhorar o desempenho das consultas.

	1. Índices Sugeridos
	#-----------------------------------#
		Tabela Clientes
		Índice composto para consultas por cidade e estado:
			CREATE INDEX `INDEX_CIDADE_UF` ON `WKPedidos`.`Clientes` 
			  (`CidadeClientes` ASC, `UFClientes` ASC);

		Tabela Produtos
		Índice para consultas por preço:
			CREATE INDEX `INDEX_PRECO` ON `WKPedidos`.`Produtos` 
			  (`PrecoVendaProdutos` ASC);

		Tabela Pedidos
		Índice para consultas por data de emissão:
			CREATE INDEX `INDEX_DATA_EMISSAO` ON `WKPedidos`.`Pedidos` 
			  (`DataEmissaoPedidos` ASC);

		Tabela ItensPedido
		Índice composto para consultas por pedido e produto:
			CREATE INDEX `INDEX_PEDIDO_PRODUTO` ON `WKPedidos`.`ItensPedido` 
			  (`PedidoItensPedido` ASC, `ProdutoItensPedido` ASC);
		  
	2. Consultas SQL Performáticas
	#-----------------------------------#
		Aqui estão exemplos de consultas SQL otimizadas para acessar os dados:

		Consulta 1: Listar todos os pedidos de um cliente
			SELECT 
				p.NumeroPedidos, 
				p.DataEmissaoPedidos, 
				p.ValorTotalPedidos, 
				c.NomeClientes 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			WHERE 
				c.CodigoClientes = ?;
			Índices utilizados:
				FK_CLIENTE (já existe na tabela Pedidos).
				INDEX_NOME (já existe na tabela Clientes).

		Consulta 2: Listar todos os itens de um pedido
			SELECT 
				ip.idItensPedido, 
				ip.QuantidadeItensPedido, 
				ip.VlrUnitarioItensPedido, 
				ip.VlrTotalItensPedido, 
				pr.DescricaoProdutos 
			FROM 
				WKPedidos.ItensPedido ip
			JOIN 
				WKPedidos.Produtos pr ON ip.ProdutoItensPedido = pr.CodigoProdutos
			WHERE 
				ip.PedidoItensPedido = ?;
			Índices utilizados:
				FK_PEDIDO (já existe na tabela ItensPedido).
				INDEX_DESCRICAO (já existe na tabela Produtos).

		Consulta 3: Listar todos os pedidos emitidos em um período
			SELECT 
				p.NumeroPedidos, 
				p.DataEmissaoPedidos, 
				p.ValorTotalPedidos, 
				c.NomeClientes 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			WHERE 
				p.DataEmissaoPedidos BETWEEN ? AND ?;
			Índices utilizados:
				INDEX_DATA_EMISSAO (sugerido acima).
				FK_CLIENTE (já existe na tabela Pedidos).

		Consulta 4: Listar os produtos mais vendidos
			SELECT 
				pr.DescricaoProdutos, 
				SUM(ip.QuantidadeItensPedido) AS TotalVendido 
			FROM 
				WKPedidos.ItensPedido ip
			JOIN 
				WKPedidos.Produtos pr ON ip.ProdutoItensPedido = pr.CodigoProdutos
			GROUP BY 
				pr.DescricaoProdutos
			ORDER BY 
				TotalVendido DESC;
			Índices utilizados:
				FK_PRODUTO (já existe na tabela ItensPedido).
				INDEX_DESCRICAO (já existe na tabela Produtos).

		Consulta 5: Listar clientes de uma cidade e estado
			SELECT 
				CodigoClientes, 
				NomeClientes 
			FROM 
				WKPedidos.Clientes
			WHERE 
				CidadeClientes = ? AND UFClientes = ?;
			Índices utilizados:
				INDEX_CIDADE_UF (sugerido acima).	  
			
	3. Boas Práticas
	#-----------------------------------#
		Usar JOIN ao invés de subconsultas:
			Sempre que possível, prefirir JOIN para unir tabelas, pois é mais eficiente do que subconsultas.
			
		Evitar SELECT *:
			Liste apenas as colunas necessárias para reduzir a quantidade de dados processados.

		Use LIMIT em consultas grandes:
			Se a consulta retornar muitos registros, usar LIMIT para paginar os resultados.

		Mantenha os índices atualizados:
			Executar ANALYZE TABLE periodicamente para atualizar as estatísticas dos índices.

		Considere particionamento de tabelas:
			Para tabelas muito grandes (ex: Pedidos), considerar particionar por data ou outro critério relevante		
				Exemplo de particionamento por intervalo (RANGE):
				#-----------------------------------------------#
				Particionar a tabela Pedidos por ano de emissão (DataEmissaoPedidos):

				Passo 1: Criar a tabela particionada
					CREATE TABLE WKPedidos.Pedidos (
						NumeroPedidos INT NOT NULL AUTO_INCREMENT,
						DataEmissaoPedidos DATETIME NOT NULL,
						ClientePedidos INT NOT NULL,
						ValorTotalPedidos DECIMAL(17,3) NOT NULL,
						PRIMARY KEY (NumeroPedidos, DataEmissaoPedidos), -- Chave primária composta
						INDEX FK_CLIENTE_idx (ClientePedidos ASC),
						CONSTRAINT FK_CLIENTE
							FOREIGN KEY (ClientePedidos)
							REFERENCES WKPedidos.Clientes (CodigoClientes)
							ON DELETE NO ACTION
							ON UPDATE NO ACTION
					)
					PARTITION BY RANGE (YEAR(DataEmissaoPedidos)) (
						PARTITION p2020 VALUES LESS THAN (2021),
						PARTITION p2021 VALUES LESS THAN (2022),
						PARTITION p2022 VALUES LESS THAN (2023),
						PARTITION p2023 VALUES LESS THAN (2024),
						PARTITION pFuture VALUES LESS THAN MAXVALUE
					);
				Explicação:
					A tabela é particionada por ano (YEAR(DataEmissaoPedidos)).
					Cada partição contém os pedidos de um ano específico.
					A partição pFuture armazena pedidos com datas superiores a 2023.
				Quando usar particionamento?
					Tabelas muito grandes: Quando a tabela tem milhões de registros.
					Consultas com filtros específicos: Quando as consultas frequentemente filtram por uma coluna (ex: data, região).
					Necessidade de manutenção granular: Quando você precisa gerenciar partes específicas dos dados (ex: excluir dados antigos).
				Limitações:
					Chave primária: A coluna usada no particionamento deve fazer parte da chave primária.
					Índices globais: Índices que abrangem todas as partições podem ser menos eficientes.
					Complexidade: O particionamento aumenta a complexidade do banco de dados.

	4. Exemplo de Consulta com Paginação
	#-----------------------------------#
		Aqui está um exemplo de consulta paginada para listar pedidos:
			SELECT 
				p.NumeroPedidos, 
				p.DataEmissaoPedidos, 
				p.ValorTotalPedidos, 
				c.NomeClientes 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			ORDER BY 
				p.DataEmissaoPedidos DESC
			LIMIT 10 OFFSET 0; -- Página 1 (10 primeiros registros)
			Índices utilizados:
				INDEX_DATA_EMISSAO (sugerido acima).
				FK_CLIENTE (já existe na tabela Pedidos).
				
	5. Exemplo de Consulta com Filtro Composto
	#-----------------------------------#
		Aqui está um exemplo de consulta com filtro composto (cidade e estado):
			SELECT 
				CodigoClientes, 
				NomeClientes 
			FROM 
				WKPedidos.Clientes
			WHERE 
				CidadeClientes = 'São Paulo' AND UFClientes = 'SP';			
			Índices utilizados:
				INDEX_CIDADE_UF (sugerido acima).

	6. Exemplo de Consulta com Agregação
	#-----------------------------------#
		Aqui está um exemplo de consulta agregada para calcular o valor total de pedidos por cliente:
			SELECT 
				c.NomeClientes, 
				SUM(p.ValorTotalPedidos) AS TotalPedidos 
			FROM 
				WKPedidos.Pedidos p
			JOIN 
				WKPedidos.Clientes c ON p.ClientePedidos = c.CodigoClientes
			GROUP BY 
				c.NomeClientes
			ORDER BY 
				TotalPedidos DESC;
			Índices utilizados:
				FK_CLIENTE (já existe na tabela Pedidos).
				INDEX_NOME (já existe na tabela Clientes).

	7. Conceito de Páginação LIMIT e OFFSET no SELECT
	#-----------------------------------#
		A combinação de LIMIT e OFFSET é usada para dividir os resultados em "páginas". Por exemplo:

		Página 1:
			SELECT * FROM WKPedidos.Pedidos LIMIT 10 OFFSET 0;
			Retorna os registros 1 a 10.
		Página 2:
			SELECT * FROM WKPedidos.Pedidos LIMIT 10 OFFSET 10;
			Retorna os registros 11 a 20.
		Página 3:
			SELECT * FROM WKPedidos.Pedidos LIMIT 10 OFFSET 20;
			Retorna os registros 21 a 30.
			
		Quando usar LIMIT e OFFSET?
			Paginação de resultados: Para exibir resultados em páginas (ex: 10 registros por página).
			Consultas grandes: Para evitar retornar muitos registros de uma só vez, o que pode sobrecarregar a aplicação ou o banco de dados.
			Testes rápidos: Para verificar rapidamente um subconjunto de dados.

		Cuidados ao usar OFFSET:
			Desempenho: Em tabelas muito grandes, o OFFSET pode ser lento, pois o banco de dados precisa "pular" os registros anteriores antes de retornar os resultados.
			Alternativa: Para melhorar o desempenho em grandes conjuntos de dados, considere usar uma coluna de referência (ex: id ou data) para paginar os resultados, em vez de OFFSET.

## Connection FIREDAC com MySQL 
	
	O FireDac do Delphi 12 32bits só funciona com MySQL 5.7.44 32 bits, DLL específica:
	.\DLL\libmysql.dll
	
	================================
	definition parameters
	================================
	Port=3306
	Database=wkpedidos
	User_Name=root
	Password=*****
	Server=localhost
	DriverID=MySQL
	Name=WKConnection
	================================
	FireDAC info
	================================
	Tool = RAD Studio 12
	FireDAC = 29.0.51961.7529
	Platform = Windows 32 bit
	Defines = FireDAC_NOLOCALE_META;FireDAC_MONITOR;
	  FireDAC_SynEdit
	================================
	Client info
	================================
	Loading driver MySQL ...
	DLL = C:\program files (x86)\embarcadero\studio\23.0\bin\libmysql.dll
	Client version = 500270000
	================================
	Session info
	================================
	Checking session ...
	  Warning: The client [5.0.27.0.0] version or less does not support multiple result sets or output parameters of prepared statement.
	Current catalog = 
	Current schema = 
	Server info = 5.7.44-log
	Client info = 5.0.27
	Characterset name = latin1
	Host info = localhost via TCP/IP
	Name modes = CILCTD
	SSL Cipher = 

