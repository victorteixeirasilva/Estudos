REM   Script: CONCEITOS E MELHORES PRÁTICAS COM BANCO DE DADOS POSTGRESQL
REM   CUSO DIO SOBRE, CONCEITOS E MELHORES PRÁTICAS COM BANCO DE DADOS POSTGRESQL

CREATE TABLE BANCO ( 
    NUMERO  NUMBER(7)                               NOT NULL 
   ,NOME    VARCHAR(50)                             NOT NULL 
   ,ATIVO   NUMBER(1) DEFAULT 1                     NOT NULL 
   ,DATA_CRIACAO DATE DEFAULT CURRENT_TIMESTAMP     NOT NULL 
);

ALTER TABLE BANCO 
  ADD CONSTRAINT PK_BANCO PRIMARY KEY (NUMERO) ;

CREATE TABLE AGENCIA ( 
    BANCO_NUMERO    NUMBER(7)                       NOT NULL 
   ,NUMERO          NUMBER (7)                      NOT NULL 
   ,NOME            VARCHAR(80)                     NOT NULL 
   ,ATIVO           NUMBER(1) DEFAULT 1             NOT NULL 
   ,DATA_CRIACAO    DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL 
);

ALTER TABLE AGENCIA 
 ADD CONSTRAINT PK_AGENCIA PRIMARY KEY (BANCO_NUMERO, NUMERO) ;

ALTER TABLE AGENCIA 
 ADD CONSTRAINT FK_AGENCIA_BANCO FOREIGN KEY (BANCO_NUMERO) REFERENCES BANCO (NUMERO) ;

CREATE TABLE CLIENTE ( 
    NUMERO          NUMBER(7)                       NOT NULL 
   ,NOME            VARCHAR(120)                    NOT NULL 
   ,EMAIL           VARCHAR(250)                    NOT NULL 
   ,ATIVO           NUMBER(1) DEFAULT 1             NOT NULL 
   ,DATA_CRIACAO    DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL 
);

ALTER TABLE CLIENTE 
 ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (NUMERO) ;

CREATE TABLE CONTA_CORRENTE ( 
    BANCO_NUMERO    NUMBER(7)                       NOT NULL 
   ,AGENCIA_NUMERO  NUMBER(7)                       NOT NULL 
   ,NUMERO          NUMBER(10)                      NOT NULL 
   ,DIGITO          NUMBER(2)                       NOT NULL 
   ,CLIENTE_NUMERO  NUMBER(7)                       NOT NULL 
   ,ATIVO           NUMBER(1) DEFAULT 1             NOT NULL 
   ,DATA_CRIACAO    DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL 
);

ALTER TABLE CONTA_CORRENTE 
  ADD CONSTRAINT PK_CONTA_CORRENTE PRIMARY KEY (BANCO_NUMERO, AGENCIA_NUMERO, NUMERO, DIGITO, CLIENTE_NUMERO) ;

ALTER TABLE CONTA_CORRENTE 
  ADD CONSTRAINT FK_CONTA_CORRENTE_AGENCIA FOREIGN KEY (BANCO_NUMERO, AGENCIA_NUMERO) REFERENCES AGENCIA (BANCO_NUMERO, NUMERO) ;

ALTER TABLE CONTA_CORRENTE 
  ADD CONSTRAINT FK_CONTA_CORRENTE_CLIENTE FOREIGN KEY (CLIENTE_NUMERO) REFERENCES CLIENTE(NUMERO) ;

CREATE TABLE TIPO_TRANSACAO ( 
    ID              NUMBER(7)                       NOT NULL 
   ,NOME            VARCHAR(50)                     NOT NULL 
   ,ATIVO           NUMBER(1) DEFAULT 1             NOT NULL 
   ,DATA_CRIACAO    DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL 
);

ALTER TABLE TIPO_TRANSACAO 
  ADD CONSTRAINT PK_TIPO_TRANSACAO PRIMARY KEY (ID) ;

CREATE TABLE CLIENTE_TRANSACOES ( 
    ID                      NUMBER          NOT NULL 
   ,BANCO_NUMERO            NUMBER(7)       NOT NULL 
   ,AGENCIA_NUMERO          NUMBER(7)       NOT NULL 
   ,CONTA_CORRENTE_NUMERO   NUMBER(10)      NOT NULL 
   ,CONTA_CORRENTE_DIGITO   NUMBER(2)       NOT NULL 
   ,CLIENTE_NUMERO          NUMBER(7)       NOT NULL 
   ,TIPO_TRANSACAO_ID       NUMBER(7)       NOT NULL 
   ,VALOR                   NUMERIC(15,2)   NOT NULL 
   ,DATA_CRIACAO    DATE DEFAULT CURRENT_TIMESTAMP  NOT NULL 
);

ALTER TABLE CLIENTE_TRANSACOES 
  ADD CONSTRAINT PK_CLIENTE_TRANSACOES PRIMARY KEY (ID) ;

ALTER TABLE CLIENTE_TRANSACOES 
 ADD CONSTRAINT FK_CLIENTE_TRANSACOES_CONTA_CORRENTE 
   FOREIGN KEY (BANCO_NUMERO, AGENCIA_NUMERO, CONTA_CORRENTE_NUMERO, CONTA_CORRENTE_DIGITO, CLIENTE_NUMERO) 
     REFERENCES CONTA_CORRENTE(BANCO_NUMERO, AGENCIA_NUMERO, NUMERO, DIGITO, CLIENTE_NUMERO) ;

INSERT INTO banco (numero, nome) VALUES (246,'Banco ABC Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (654,'Banco A.J.Renner S.A.');
INSERT INTO banco (numero, nome) VALUES (25,'Banco Alfa S.A.');
INSERT INTO banco (numero, nome) VALUES (641,'Banco Alvorada S.A.');
INSERT INTO banco (numero, nome) VALUES (213,'Banco Arbi S.A.');
INSERT INTO banco (numero, nome) VALUES (19,'Banco Azteca do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (29,'Banco Banerj S.A.');
INSERT INTO banco (numero, nome) VALUES (0,'Banco Bankpar S.A.');
INSERT INTO banco (numero, nome) VALUES (740,'Banco Barclays S.A.');
INSERT INTO banco (numero, nome) VALUES (107,'Banco BBM S.A.');
INSERT INTO banco (numero, nome) VALUES (31,'Banco Beg S.A.');
INSERT INTO banco (numero, nome) VALUES (739,'Banco BGN S.A.');
INSERT INTO banco (numero, nome) VALUES (96,'Banco BM&F de Serviços de Liquidação e Custódia S.A');
INSERT INTO banco (numero, nome) VALUES (318,'Banco BMG S.A.');
INSERT INTO banco (numero, nome) VALUES (752,'Banco BNP Paribas Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (248,'Banco Boavista Interatlântico S.A.');
INSERT INTO banco (numero, nome) VALUES (218,'Banco Bonsucesso S.A.');
INSERT INTO banco (numero, nome) VALUES (65,'Banco Bracce S.A.');
INSERT INTO banco (numero, nome) VALUES (36,'Banco Bradesco BBI S.A.');
INSERT INTO banco (numero, nome) VALUES (204,'Banco Bradesco Cartões S.A.');
INSERT INTO banco (numero, nome) VALUES (394,'Banco Bradesco Financiamentos S.A.');
INSERT INTO banco (numero, nome) VALUES (237,'Banco Bradesco S.A.');
INSERT INTO banco (numero, nome) VALUES (225,'Banco Brascan S.A.');
INSERT INTO banco (numero, nome) VALUES (208,'Banco BTG Pactual S.A.');
INSERT INTO banco (numero, nome) VALUES (44,'Banco BVA S.A.');
INSERT INTO banco (numero, nome) VALUES (263,'Banco Cacique S.A.');
INSERT INTO banco (numero, nome) VALUES (473,'Banco Caixa Geral - Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (412,'Banco Capital S.A.');
INSERT INTO banco (numero, nome) VALUES (40,'Banco Cargill S.A.');
INSERT INTO banco (numero, nome) VALUES (745,'Banco Citibank S.A.');
INSERT INTO banco (numero, nome) VALUES (241,'Banco Clássico S.A.');
INSERT INTO banco (numero, nome) VALUES (215,'Banco Comercial e de Investimento Sudameris S.A.');
INSERT INTO banco (numero, nome) VALUES (756,'Banco Cooperativo do Brasil S.A. - BANCOOB');
INSERT INTO banco (numero, nome) VALUES (748,'Banco Cooperativo Sicredi S.A.');
INSERT INTO banco (numero, nome) VALUES (75,'Banco CR2 S.A.');
INSERT INTO banco (numero, nome) VALUES (721,'Banco Credibel S.A.');
INSERT INTO banco (numero, nome) VALUES (222,'Banco Credit Agricole Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (505,'Banco Credit Suisse (Brasil) S.A.');
INSERT INTO banco (numero, nome) VALUES (229,'Banco Cruzeiro do Sul S.A.');
INSERT INTO banco (numero, nome) VALUES (266,'Banco Cédula S.A.');
INSERT INTO banco (numero, nome) VALUES (3,'Banco da Amazônia S.A.');
INSERT INTO banco (numero, nome) VALUES (833,'Banco da China Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (707,'Banco Daycoval S.A.');
INSERT INTO banco (numero, nome) VALUES (300,'Banco de La Nacion Argentina');
INSERT INTO banco (numero, nome) VALUES (495,'Banco de La Provincia de Buenos Aires');
INSERT INTO banco (numero, nome) VALUES (494,'Banco de La Republica Oriental del Uruguay');
INSERT INTO banco (numero, nome) VALUES (24,'Banco de Pernambuco S.A. - BANDEPE');
INSERT INTO banco (numero, nome) VALUES (456,'Banco de Tokyo-Mitsubishi UFJ Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (214,'Banco Dibens S.A.');
INSERT INTO banco (numero, nome) VALUES (1,'Banco do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (47,'Banco do Estado de Sergipe S.A.');
INSERT INTO banco (numero, nome) VALUES (37,'Banco do Estado do Pará S.A.');
INSERT INTO banco (numero, nome) VALUES (39,'Banco do Estado do Piauí S.A. - BEP');
INSERT INTO banco (numero, nome) VALUES (41,'Banco do Estado do Rio Grande do Sul S.A.');
INSERT INTO banco (numero, nome) VALUES (4,'Banco do Nordeste do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (265,'Banco Fator S.A.');
INSERT INTO banco (numero, nome) VALUES (224,'Banco Fibra S.A.');
INSERT INTO banco (numero, nome) VALUES (626,'Banco Ficsa S.A.');
INSERT INTO banco (numero, nome) VALUES (233,'Banco GE Capital S.A.');
INSERT INTO banco (numero, nome) VALUES (734,'Banco Gerdau S.A.');
INSERT INTO banco (numero, nome) VALUES (612,'Banco Guanabara S.A.');
INSERT INTO banco (numero, nome) VALUES (63,'Banco Ibi S.A. Banco Múltiplo');
INSERT INTO banco (numero, nome) VALUES (604,'Banco Industrial do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (320,'Banco Industrial e Comercial S.A.');
INSERT INTO banco (numero, nome) VALUES (653,'Banco Indusval S.A.');
INSERT INTO banco (numero, nome) VALUES (630,'Banco Intercap S.A.');
INSERT INTO banco (numero, nome) VALUES (779,'Banco Intermedium S.A.');
INSERT INTO banco (numero, nome) VALUES (249,'Banco Investcred Unibanco S.A.');
INSERT INTO banco (numero, nome) VALUES (184,'Banco Itaú BBA S.A.');
INSERT INTO banco (numero, nome) VALUES (479,'Banco ItaúBank S.A');
INSERT INTO banco (numero, nome) VALUES (376,'Banco J. P. Morgan S.A.');
INSERT INTO banco (numero, nome) VALUES (74,'Banco J. Safra S.A.');
INSERT INTO banco (numero, nome) VALUES (217,'Banco John Deere S.A.');
INSERT INTO banco (numero, nome) VALUES (76,'Banco KDB S.A.');
INSERT INTO banco (numero, nome) VALUES (757,'Banco KEB do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (600,'Banco Luso Brasileiro S.A.');
INSERT INTO banco (numero, nome) VALUES (212,'Banco Matone S.A.');
INSERT INTO banco (numero, nome) VALUES (389,'Banco Mercantil do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (746,'Banco Modal S.A.');
INSERT INTO banco (numero, nome) VALUES (738,'Banco Morada S.A.');
INSERT INTO banco (numero, nome) VALUES (66,'Banco Morgan Stanley S.A.');
INSERT INTO banco (numero, nome) VALUES (243,'Banco Máxima S.A.');
INSERT INTO banco (numero, nome) VALUES (45,'Banco Opportunity S.A.');
INSERT INTO banco (numero, nome) VALUES (623,'Banco Panamericano S.A.');
INSERT INTO banco (numero, nome) VALUES (611,'Banco Paulista S.A.');
INSERT INTO banco (numero, nome) VALUES (613,'Banco Pecúnia S.A.');
INSERT INTO banco (numero, nome) VALUES (942,'Banco Petra S.A.');
INSERT INTO banco (numero, nome) VALUES (643,'Banco Pine S.A.');
INSERT INTO banco (numero, nome) VALUES (724,'Banco Porto Seguro S.A.');
INSERT INTO banco (numero, nome) VALUES (735,'Banco Pottencial S.A.');
INSERT INTO banco (numero, nome) VALUES (638,'Banco Prosper S.A.');
INSERT INTO banco (numero, nome) VALUES (747,'Banco Rabobank International Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (884,'Banco Randon S.A.');
INSERT INTO banco (numero, nome) VALUES (356,'Banco Real S.A.');
INSERT INTO banco (numero, nome) VALUES (633,'Banco Rendimento S.A.');
INSERT INTO banco (numero, nome) VALUES (741,'Banco Ribeirão Preto S.A.');
INSERT INTO banco (numero, nome) VALUES (72,'Banco Rural Mais S.A.');
INSERT INTO banco (numero, nome) VALUES (453,'Banco Rural S.A.');
INSERT INTO banco (numero, nome) VALUES (422,'Banco Safra S.A.');
INSERT INTO banco (numero, nome) VALUES (33,'Banco Santander (Brasil) S.A.');
INSERT INTO banco (numero, nome) VALUES (250,'Banco Schahin S.A.');
INSERT INTO banco (numero, nome) VALUES (743,'Banco Semear S.A.');
INSERT INTO banco (numero, nome) VALUES (749,'Banco Simples S.A.');
INSERT INTO banco (numero, nome) VALUES (366,'Banco Société Générale Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (637,'Banco Sofisa S.A.');
INSERT INTO banco (numero, nome) VALUES (12,'Banco Standard de Investimentos S.A.');
INSERT INTO banco (numero, nome) VALUES (464,'Banco Sumitomo Mitsui Brasileiro S.A.');
INSERT INTO banco (numero, nome) VALUES (825,'Banco Topázio S.A.');
INSERT INTO banco (numero, nome) VALUES (634,'Banco Triângulo S.A.');
INSERT INTO banco (numero, nome) VALUES (655,'Banco Votorantim S.A.');
INSERT INTO banco (numero, nome) VALUES (610,'Banco VR S.A.');
INSERT INTO banco (numero, nome) VALUES (370,'Banco WestLB do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (21,'BANESTES S.A. Banco do Estado do Espírito Santo');
INSERT INTO banco (numero, nome) VALUES (719,'Banif-Banco Internacional do Funchal (Brasil)S.A.');
INSERT INTO banco (numero, nome) VALUES (755,'Bank of America Merrill Lynch Banco Múltiplo S.A.');
INSERT INTO banco (numero, nome) VALUES (744,'BankBoston N.A.');
INSERT INTO banco (numero, nome) VALUES (73,'BB Banco Popular do Brasil S.A.');
INSERT INTO banco (numero, nome) VALUES (78,'BES Investimento do Brasil S.A.-Banco de Investimento');
INSERT INTO banco (numero, nome) VALUES (69,'BPN Brasil Banco Múltiplo S.A.');
INSERT INTO banco (numero, nome) VALUES (70,'BRB - Banco de Brasília S.A.');
INSERT INTO banco (numero, nome) VALUES (922,'Brickell S.A. Crédito, financiamento e Investimento':;
INSERT INTO banco (numero, nome) VALUES (104,'Caixa Econômica Federal');
INSERT INTO banco (numero, nome) VALUES (477,'Citibank N.A.');
INSERT INTO banco (numero, nome) VALUES (817,'Concórdia Banco S.A.');
INSERT INTO banco (numero, nome) VALUES (973,'Cooperativa Central de Crédito Noroeste Brasileiro Ltda.');
INSERT INTO banco (numero, nome) VALUES (85,'Cooperativa Central de Crédito Urbano-CECRED');
INSERT INTO banco (numero, nome) VALUES (99,'Cooperativa Central de Economia e Credito Mutuo das Unicreds');
INSERT INTO banco (numero, nome) VALUES (90,'Cooperativa Central de Economia e Crédito Mutuo das Unicreds');
INSERT INTO banco (numero, nome) VALUES (892,'Cooperativa de Crédito Rural da Região de Mogiana');
INSERT INTO banco (numero, nome) VALUES (876,'Cooperativa Unicred Central Santa Catarina');
INSERT INTO banco (numero, nome) VALUES (981,'Credicorol Cooperativa de Crédito Rural');
INSERT INTO banco (numero, nome) VALUES (487,'Deutsche Bank S.A. - Banco Alemão');
INSERT INTO banco (numero, nome) VALUES (751,'Dresdner Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO banco (numero, nome) VALUES (64,'Goldman Sachs do Brasil Banco Múltiplo S.A.');
INSERT INTO banco (numero, nome) VALUES (62,'Hipercard Banco Múltiplo S.A.');
INSERT INTO banco (numero, nome) VALUES (399,'HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO banco (numero, nome) VALUES (168,'HSBC Finance (Brasil) S.A. - Banco Múltiplo');
INSERT INTO banco (numero, nome) VALUES (492,'ING Bank N.V.');
INSERT INTO banco (numero, nome) VALUES (652,'Itaú Unibanco Holding S.A.');
INSERT INTO banco (numero, nome) VALUES (341,'Itaú Unibanco S.A.');
INSERT INTO banco (numero, nome) VALUES (79,'JBS Banco S.A.');
INSERT INTO banco (numero, nome) VALUES (488,'JPMorgan Chase Bank');
INSERT INTO banco (numero, nome) VALUES (14,'Natixis Brasil S.A. Banco Múltiplo');
INSERT INTO banco (numero, nome) VALUES (753,'NBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO banco (numero, nome) VALUES (0868,'OBOE Crédito Financiamento e Investimento S.A.');
INSERT INTO banco (numero, nome) VALUES (254,'Paraná Banco S.A.');
INSERT INTO banco (numero, nome) VALUES (409,'UNIBANCO - União de Bancos Brasileiros S.A.');
INSERT INTO banco (numero, nome) VALUES (230,'Unicard Banco Múltiplo S.A.');
INSERT INTO banco (numero, nome) VALUES (0914,'Unicred Central do Rio Grande do Sul');
INSERT INTO banco (numero, nome) VALUES (84,'Unicred Norte do Paraná');
INSERT INTO banco (numero, nome) VALUES (247,'Banco Itaú S.A.');


INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,1,'Agência número 1 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,2,'Agência número 2 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,3,'Agência número 3 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,4,'Agência número 4 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,5,'Agência número 5 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,6,'Agência número 6 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,7,'Agência número 7 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,8,'Agência número 8 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,9,'Agência número 9 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,10,'Agência número 10 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,11,'Agência número 11 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,12,'Agência número 12 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,13,'Agência número 13 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,14,'Agência número 14 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,15,'Agência número 15 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,16,'Agência número 16 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,17,'Agência número 17 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,18,'Agência número 18 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,19,'Agência número 19 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,20,'Agência número 20 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,21,'Agência número 21 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,22,'Agência número 22 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,23,'Agência número 23 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,24,'Agência número 24 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,25,'Agência número 25 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,26,'Agência número 26 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,27,'Agência número 27 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,28,'Agência número 28 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,29,'Agência número 29 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,30,'Agência número 30 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,31,'Agência número 31 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,32,'Agência número 32 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,33,'Agência número 33 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,34,'Agência número 34 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,35,'Agência número 35 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,36,'Agência número 36 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,37,'Agência número 37 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,38,'Agência número 38 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,39,'Agência número 39 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,40,'Agência número 40 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,41,'Agência número 41 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,42,'Agência número 42 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,43,'Agência número 43 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,44,'Agência número 44 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,45,'Agência número 45 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,46,'Agência número 46 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,47,'Agência número 47 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,48,'Agência número 48 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,49,'Agência número 49 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (1,50,'Agência número 50 do banco Banco do Brasil S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,1,'Agência número 1 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,2,'Agência número 2 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,3,'Agência número 3 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,4,'Agência número 4 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,5,'Agência número 5 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,6,'Agência número 6 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,7,'Agência número 7 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,8,'Agência número 8 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,9,'Agência número 9 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,10,'Agência número 10 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,11,'Agência número 11 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,12,'Agência número 12 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,13,'Agência número 13 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,14,'Agência número 14 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,15,'Agência número 15 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,16,'Agência número 16 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,17,'Agência número 17 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,18,'Agência número 18 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,19,'Agência número 19 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,20,'Agência número 20 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,21,'Agência número 21 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,22,'Agência número 22 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,23,'Agência número 23 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,24,'Agência número 24 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,25,'Agência número 25 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,26,'Agência número 26 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,27,'Agência número 27 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,28,'Agência número 28 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,29,'Agência número 29 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,30,'Agência número 30 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,31,'Agência número 31 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,32,'Agência número 32 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,33,'Agência número 33 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,34,'Agência número 34 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (247,35,'Agência número 35 do banco Banco Itaú S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,1,'Agência número 1 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,2,'Agência número 2 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,3,'Agência número 3 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,4,'Agência número 4 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,5,'Agência número 5 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,6,'Agência número 6 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,7,'Agência número 7 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,8,'Agência número 8 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,9,'Agência número 9 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,10,'Agência número 10 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,11,'Agência número 11 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,12,'Agência número 12 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,13,'Agência número 13 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,14,'Agência número 14 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,15,'Agência número 15 do banco Banco Bradesco S.A.');


INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,16,'Agência número 16 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,17,'Agência número 17 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,18,'Agência número 18 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,19,'Agência número 19 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,20,'Agência número 20 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,21,'Agência número 21 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,22,'Agência número 22 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,23,'Agência número 23 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,24,'Agência número 24 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,25,'Agência número 25 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,26,'Agência número 26 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,27,'Agência número 27 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,28,'Agência número 28 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,29,'Agência número 29 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (237,30,'Agência número 30 do banco Banco Bradesco S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,1,'Agência número 1 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,2,'Agência número 2 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,3,'Agência número 3 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,4,'Agência número 4 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,5,'Agência número 5 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,6,'Agência número 6 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,7,'Agência número 7 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,8,'Agência número 8 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,9,'Agência número 9 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,10,'Agência número 10 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,11,'Agência número 11 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,12,'Agência número 12 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,13,'Agência número 13 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,14,'Agência número 14 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,15,'Agência número 15 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,16,'Agência número 16 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,17,'Agência número 17 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,18,'Agência número 18 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,19,'Agência número 19 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,20,'Agência número 20 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,21,'Agência número 21 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,22,'Agência número 22 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,23,'Agência número 23 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,24,'Agência número 24 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,25,'Agência número 25 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,26,'Agência número 26 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,27,'Agência número 27 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,28,'Agência número 28 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (33,29,'Agência número 29 do banco Banco Santander (Brasil) S.A.');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,1,'Agência número 1 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,2,'Agência número 2 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,3,'Agência número 3 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,4,'Agência número 4 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,5,'Agência número 5 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,6,'Agência número 6 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,7,'Agência número 7 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,8,'Agência número 8 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,9,'Agência número 9 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,10,'Agência número 10 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,11,'Agência número 11 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,12,'Agência número 12 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,13,'Agência número 13 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,14,'Agência número 14 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,15,'Agência número 15 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,16,'Agência número 16 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,17,'Agência número 17 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,18,'Agência número 18 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,19,'Agência número 19 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,20,'Agência número 20 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,21,'Agência número 21 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,22,'Agência número 22 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,23,'Agência número 23 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,24,'Agência número 24 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,25,'Agência número 25 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,26,'Agência número 26 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,27,'Agência número 27 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,28,'Agência número 28 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,29,'Agência número 29 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,30,'Agência número 30 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,31,'Agência número 31 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,32,'Agência número 32 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,33,'Agência número 33 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,34,'Agência número 34 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,35,'Agência número 35 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,36,'Agência número 36 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,37,'Agência número 37 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,38,'Agência número 38 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,39,'Agência número 39 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,40,'Agência número 40 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,41,'Agência número 41 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,42,'Agência número 42 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,43,'Agência número 43 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,44,'Agência número 44 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,45,'Agência número 45 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,46,'Agência número 46 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,47,'Agência número 47 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,48,'Agência número 48 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,49,'Agência número 49 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,50,'Agência número 50 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,51,'Agência número 51 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,52,'Agência número 52 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,53,'Agência número 53 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,54,'Agência número 54 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,55,'Agência número 55 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,56,'Agência número 56 do banco Caixa Econômica Federal');


INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,57,'Agência número 57 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,58,'Agência número 58 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,59,'Agência número 59 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,60,'Agência número 60 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,61,'Agência número 61 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,62,'Agência número 62 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,63,'Agência número 63 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,64,'Agência número 64 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,65,'Agência número 65 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,66,'Agência número 66 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,67,'Agência número 67 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,68,'Agência número 68 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,69,'Agência número 69 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,70,'Agência número 70 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,71,'Agência número 71 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,72,'Agência número 72 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,73,'Agência número 73 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,74,'Agência número 74 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,75,'Agência número 75 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,76,'Agência número 76 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,77,'Agência número 77 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,78,'Agência número 78 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,79,'Agência número 79 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,80,'Agência número 80 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,81,'Agência número 81 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,82,'Agência número 82 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,83,'Agência número 83 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,84,'Agência número 84 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,85,'Agência número 85 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,86,'Agência número 86 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,87,'Agência número 87 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,88,'Agência número 88 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,89,'Agência número 89 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,90,'Agência número 90 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,91,'Agência número 91 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,92,'Agência número 92 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,93,'Agência número 93 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,94,'Agência número 94 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,95,'Agência número 95 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,96,'Agência número 96 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,97,'Agência número 97 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,98,'Agência número 98 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,99,'Agência número 99 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,100,'Agência número 100 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,101,'Agência número 101 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (104,102,'Agência número 102 do banco Caixa Econômica Federal');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,1,'Agência número 1 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,2,'Agência número 2 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,3,'Agência número 3 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,4,'Agência número 4 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,5,'Agência número 5 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,6,'Agência número 6 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,7,'Agência número 7 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,8,'Agência número 8 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,9,'Agência número 9 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,10,'Agência número 10 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,11,'Agência número 11 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,12,'Agência número 12 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,13,'Agência número 13 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,14,'Agência número 14 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,15,'Agência número 15 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,16,'Agência número 16 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,17,'Agência número 17 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,18,'Agência número 18 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,19,'Agência número 19 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,20,'Agência número 20 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,21,'Agência número 21 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (399,22,'Agência número 22 do banco HSBC Bank Brasil S.A. - Banco Múltiplo');
INSERT INTO agencia (banco_numero, numero, nome) VALUES (623,1,'Agência número 1 do banco Banco Panamericano S.A.');


CREATE SEQUENCE SQ_CLIENTE START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;


INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Godinho ou Godim Felgueiras','godinho_ou_godim_felgueiras@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Umbelina Neves','umbelina_neves@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Godinho ou Godim Felgueiras','godinho_ou_godim_felgueiras@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ricardo Garcés','ricardo_garces@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adélia Sobral','adelia_sobral@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zenaide Peçanha','zenaide_pecanha@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sabrina SantAnna','sabrina_santanna@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eduardo Rua','eduardo_rua@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cesário Brião','cesario_briao@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alexandra Ramírez','alexandra_ramirez@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Luzia Rivas','luzia_rivas@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cristiano Quinteiro','cristiano_quinteiro@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ofélia Cerveira','ofelia_cerveira@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Elvira Guimarães','elvira_guimaraes@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hélia Fortunato','helia_fortunato@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eloi Casqueira','eloi_casqueira@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alberta Araripe','alberta_araripe@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adosindo Suaçuna','adosindo_suacuna@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rebeca Pérez','rebeca_perez@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Fiona Nóbrega','fiona_nobrega@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Veríssimo Sobreira','verissimo_sobreira@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Natália Bezerra','natalia_bezerra@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alexandre Carneiro','alexandre_carneiro@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ismael Uchoa','ismael_uchoa@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Diamantino Becerril','diamantino_becerril@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alexandre Lancastre','alexandre_lancastre@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alberta Amaro','alberta_amaro@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Donata Fagundes','donata_fagundes@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alberto Caneira','alberto_caneira@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Blasco Amorim','blasco_amorim@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adérito Pedrozo','aderito_pedrozo@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gonçalo Jesus','goncalo_jesus@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Caím Quintão','caim_quintao@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sancho Cardin','sancho_cardin@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Melinda Carvalhal','melinda_carvalhal@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Angélico Aragón','angelico_aragon@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rômulo   Piñero','romulo___pinero@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Esperança Quinterno','esperanca_quinterno@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gerusa Zarco','gerusa_zarco@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Julieta Negromonte','julieta_negromonte@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Morgana Ipiranga','morgana_ipiranga@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Luís Rivas','luis_rivas@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zacarias Domínguez','zacarias_dominguez@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Moisés Jardim','moises_jardim@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ítalo Caires','italo_caires@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eládio Ferrão','eladio_ferrao@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zubaida Barreto','zubaida_barreto@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Beatriz Oleiro','beatriz_oleiro@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Artur Olaio','artur_olaio@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Nídia Valerio','nidia_valerio@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Donato Lacerda','donato_lacerda@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Brígida Portella','brigida_portella@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ximeno Holanda','ximeno_holanda@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Poliana Flores','poliana_flores@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bernardo Guterres','bernardo_guterres@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Beatriz Pari','beatriz_pari@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zulmira Toledo','zulmira_toledo@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Leonor Garcia','leonor_garcia@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hipólito Velasco','hipolito_velasco@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sara Ferrón','sara_ferron@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'João Rebello','joao_rebello@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Elias Cunha','elias_cunha@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Anacleto Vilarim','anacleto_vilarim@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ilduara Bulhão','ilduara_bulhao@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mário Malta','mario_malta@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alzira Semedo','alzira_semedo@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aires Falcão','aires_falcao@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Carlos Cairu','carlos_cairu@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Félix Castelo','felix_castelo@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Clarindo Mendonça','clarindo_mendonca@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Romão Collares','romao_collares@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Floripes Gouveia','floripes_gouveia@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eduarda Corvelo','eduarda_corvelo@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Teodorico Nazário','teodorico_nazario@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Emílio Barboza','emilio_barboza@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mileide Marroquim','mileide_marroquim@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Patrícia Meira','patricia_meira@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Renan Grande','renan_grande@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gerson Portela','gerson_portela@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Verónica Anlicoara','veronica_anlicoara@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Siquenique Teves','siquenique_teves@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Raquel Guzmán','raquel_guzman@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eduardo Aguiar','eduardo_aguiar@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Armanda Malheiro','armanda_malheiro@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alcides Borba','alcides_borba@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Dirceu Peláez','dirceu_pelaez@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Xisto Dornelles','xisto_dornelles@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Valério Cordeiro','valerio_cordeiro@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Selma Rúa','selma_rua@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Fábio Villaverde','fabio_villaverde@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Débora Palhares','debora_palhares@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cosperranho Carreiro','cosperranho_carreiro@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Amália Vilaça','amalia_vilaca@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quintilien Robalo','quintilien_robalo@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Solange Negromonte','solange_negromonte@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Marcos Lemes','marcos_lemes@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jerónimo, Jerônimo Cantanhede','jeronimo__jeronimo_cantanhede@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Natividade Maior','natividade_maior@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ildefonso Castellano','ildefonso_castellano@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quintiliano Peláez','quintiliano_pelaez@selecao.br');


INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Domingas Canejo','domingas_canejo@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hélia Espírito Santo','helia_espirito_santo@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Magali Nolasco','magali_nolasco@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Enia   Valente','enia___valente@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Célia Alancastre','celia_alancastre@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Marli Gusmão','marli_gusmao@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Carolina Torres','carolina_torres@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Borrás Monsanto','borras_monsanto@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Davide Carneiro','davide_carneiro@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Anita Alcaide','anita_alcaide@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quintiliano Vieyra','quintiliano_vieyra@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Minervina Blanco','minervina_blanco@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vicente Quintela','vicente_quintela@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Abraão Faro','abraao_faro@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Norberto Canadas','norberto_canadas@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Liana Espartero','liana_espartero@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Flor Leite','flor_leite@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gilda Franca','gilda_franca@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ubirajara Siqueira','ubirajara_siqueira@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Talita Grillo','talita_grillo@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Leonir Cyrne','leonir_cyrne@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Edgar Gallindo','edgar_gallindo@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Solano Alvim','solano_alvim@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Augusto Ramires','augusto_ramires@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Óscar Antúnez','oscar_antunez@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Armando Valle','armando_valle@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Olívia Goes','olivia_goes@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sebastião Jaguaribe','sebastiao_jaguaribe@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jacinto Galvão','jacinto_galvao@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Roseli Bento','roseli_bento@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eliseu Rabello','eliseu_rabello@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zuleica Valentim','zuleica_valentim@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Neusa Castella','neusa_castella@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adriano Cambezes','adriano_cambezes@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Nicolau Barcellos','nicolau_barcellos@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Célia Rufino','celia_rufino@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Guiomar Vale','guiomar_vale@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Maura Capanema','maura_capanema@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zoe Valentín','zoe_valentin@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Leopoldina Varanda','leopoldina_varanda@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cláudio Amorín','claudio_amorin@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ifigénia Figueiredo','ifigenia_figueiredo@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Guálter, Walter Cerqueira','gualter__walter_cerqueira@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aarão Valentín','aarao_valentin@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Viriato Barata','viriato_barata@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lavínia Portella','lavinia_portella@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Emílio Morais','emilio_morais@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Salvador Dias','salvador_dias@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quitéria Vilarim','quiteria_vilarim@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Floripes Vargas','floripes_vargas@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Silvério Bento','silverio_bento@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ítala Collares','itala_collares@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bernardete Pequeno','bernardete_pequeno@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Judá Villar','juda_villar@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Henrique Pinhal','henrique_pinhal@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Danilo Caminha','danilo_caminha@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jaime Souto Maior','jaime_souto_maior@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Esmeralda Froes','esmeralda_froes@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Denise Castello Branco','denise_castello_branco@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Siquenique Taborda','siquenique_taborda@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Filipe Quinzeiro','filipe_quinzeiro@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alda Benavides','alda_benavides@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Pedro Castelo Branco','pedro_castelo_branco@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adalberto Cerqueira','adalberto_cerqueira@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gláucia Salguero','glaucia_salguero@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Manuela Carvalhosa','manuela_carvalhosa@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Romano Mirandela','romano_mirandela@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Romano Festas','romano_festas@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Estefânia Macieira','estefania_macieira@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Catarino Boaventura','catarino_boaventura@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Amália Soeiro','amalia_soeiro@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mécia Soto','mecia_soto@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Noel Cipriano','noel_cipriano@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gregório Pimienta','gregorio_pimienta@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Honorina Lousado','honorina_lousado@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ximena Calheiros','ximena_calheiros@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Joaquina Aragão','joaquina_aragao@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'António Cysneiros','antonio_cysneiros@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Verónica Guedes','veronica_guedes@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rufus Fróis','rufus_frois@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sandra Silveira','sandra_silveira@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eurico Santos','eurico_santos@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Boaventura Ataí','boaventura_atai@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Valentina Bivar','valentina_bivar@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lázaro Veiga','lazaro_veiga@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Florêncio Palmeira','florencio_palmeira@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Clementina Alvim','clementina_alvim@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ricardina Fuentes','ricardina_fuentes@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ginéculo Pinho','gineculo_pinho@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mateus Gómez','mateus_gomez@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ubaldo Cordero','ubaldo_cordero@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Xisto Castro','xisto_castro@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hermenegildo Saraiva','hermenegildo_saraiva@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quitério Galvão','quiterio_galvao@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Virgílio Alencar','virgilio_alencar@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lídia Assumpção','lidia_assumpcao@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hugo Arouca','hugo_arouca@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Geraldo Meneses','geraldo_meneses@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Greice Rico','greice_rico@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Heriberto Murtinho','heriberto_murtinho@record.com.br');


INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Edite Guaraná','edite_guarana@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Márcia Caneira','marcia_caneira@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lucílio Chagas','lucilio_chagas@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Camila Paranaguá','camila_paranagua@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gonçalo García','goncalo_garcia@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ivete Pardo','ivete_pardo@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vanda Moita','vanda_moita@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Brígida Aveiro','brigida_aveiro@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Susana Fragoso','susana_fragoso@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Palmira Foquiço','palmira_foquico@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Simeão Simões','simeao_simões@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aldonça Osório','aldonca_osorio@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Filena Blanco','filena_blanco@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gaudêncio Diniz','gaudencio_diniz@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Paraguaçu Louzada','paraguacu_louzada@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bernardina Moita','bernardina_moita@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Solano Castelão','solano_castelao@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Francisco Henriques','francisco_henriques@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Deise Graça','deise_graca@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quirino Sousa do Prado','quirino_sousa_do_prado@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hugo Godói','hugo_godoi@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Roberta Assumpção','roberta_assumpcao@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jamari Naves','jamari_naves@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Heloísa Pinhal','heloisa_pinhal@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Piedade Cordeiro','piedade_cordeiro@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Manuela Morais','manuela_morais@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mónica Fialho','monica_fialho@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Angélico Santana','angelico_santana@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Salomão Carijó','salomao_carijo@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Remo Avelar','remo_avelar@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Palmiro Freitas','palmiro_freitas@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Dália Villégas','dalia_villegas@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ítalo Cysneiros','italo_cysneiros@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Girão Grillo','girao_grillo@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adelaide Ruela','adelaide_ruela@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Laís Holanda','lais_holanda@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quirina Colares','quirina_colares@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Marcos Simas','marcos_simas@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Minervina Leal','minervina_leal@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Deolindo Azeredo','deolindo_azeredo@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vanda Barbosa','vanda_barbosa@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Paulina Quiroga','paulina_quiroga@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adélia Cezar','adelia_cezar@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Juçara Cabeça de Vaca','jucara_cabeca_de_vaca@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Minervina Castelão','minervina_castelao@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aniano Núñez','aniano_nunez@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Roseli Salomão','roseli_salomao@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Laurinda Ferraço','laurinda_ferraco@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Américo Reis','americo_reis@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Damião Robalo','damiao_robalo@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Brás Beserra','bras_beserra@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Emílio Vega','emilio_vega@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Guida Teodoro','guida_teodoro@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Arnaldo Estrela','arnaldo_estrela@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Flor Castilhos','flor_castilhos@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aniana Faia','aniana_faia@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Timóteo Álvarez','timoteo_alvarez@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Astolfo Guedes','astolfo_guedes@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eudes Matos','eudes_matos@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Diogo Ramírez','diogo_ramirez@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aurélia Foquiço','aurelia_foquico@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Irene Mortágua','irene_mortagua@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Casimiro Granjeia','casimiro_granjeia@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Albino Seixas','albino_seixas@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Almor Camello','almor_camello@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Emílio Macena','emilio_macena@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Delfim Fiestas','delfim_fiestas@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vanda Viegas','vanda_viegas@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bartolomeu Mendoza','bartolomeu_mendoza@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sabino Tévez','sabino_tevez@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Flávio Teles','flavio_teles@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Nazaré Quintanilha','nazare_quintanilha@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Deolindo Motta','deolindo_motta@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Valdeci Figueiró','valdeci_figueiro@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Teodorico Castelão','teodorico_castelao@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Iberê Siqueira','ibere_siqueira@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bruna Soeiro','bruna_soeiro@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Henriqueta Estévez','henriqueta_estevez@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zacarias Varela','zacarias_varela@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rogério Carmona','rogerio_carmona@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Carine Beserril','carine_beserril@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Simone Nobre','simone_nobre@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Juliano Rodrigues','juliano_rodrigues@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tibúrcio Soeiro','tiburcio_soeiro@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vasco Fuentes','vasco_fuentes@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Collin Capucho','collin_capucho@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zita Caneira','zita_caneira@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zidane Faro','zidane_faro@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rudá Blanco','ruda_blanco@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mariana Albuquerque','mariana_albuquerque@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gabriela Anjos','gabriela_anjos@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Virgílio Igrejas','virgilio_igrejas@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Políbio Campelo','polibio_campelo@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Polibe Rios','polibe_rios@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Godo Clementino','godo_clementino@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Belchior Tomé','belchior_tome@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Godofredo Noite','godofredo_noite@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ludovico Carrasco','ludovico_carrasco@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Odete Carvajal','odete_carvajal@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Palmiro Neres','palmiro_neres@yahoo.com');



INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Glauco Vilas-Boas','glauco_vilas-boas@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Balduíno Grilo','balduino_grilo@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rudi Coelho','rudi_coelho@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ubiratã Marmou','ubirata_marmou@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adélia Viana','adelia_viana@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rúben Alvarenga','ruben_alvarenga@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Benedita Portugal','benedita_portugal@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Luísa Gonçalves','luisa_goncalves@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Augusto Curado','augusto_curado@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Carlos Cambezes','carlos_cambezes@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ximeno Valentín','ximeno_valentin@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Valdeci Pirajá','valdeci_piraja@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lavínia Peçanha','lavinia_pecanha@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Frederica Azevedo','frederica_azevedo@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Agostinho Estévez','agostinho_estevez@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Elias Ipanema','elias_ipanema@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Roque Rios','roque_rios@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Márcia Carreiro','marcia_carreiro@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alarico Pino','alarico_pino@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Milu Loureiro','milu_loureiro@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vítor ou Victor Malheiros','vitor_ou_victor_malheiros@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gláuber Azenha','glauber_azenha@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Delfim Varanda','delfim_varanda@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Laís Belchiorinho','lais_belchiorinho@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cauê Caetano','caue_caetano@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tália Guedelha','talia_guedelha@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Xavier Ornellas','xavier_ornellas@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eva Cunha','eva_cunha@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Afonso Bahía','afonso_bahia@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Diógenes Pimienta','diogenes_pimienta@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Roberta Guerrero','roberta_guerrero@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Miriam Tévez','miriam_tevez@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Virgínia Baptista','virginia_baptista@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Isidro Caminha','isidro_caminha@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Amandio Castillo','amandio_castillo@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Potira Macena','potira_macena@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ofélia Fróis','ofelia_frois@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Célia Guerreiro','celia_guerreiro@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Andreia Villas Bôas','andreia_villas_boas@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Natacha Vásquez','natacha_vasquez@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Camila Orriça','camila_orrica@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Vitória Picanço','vitoria_picanco@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rosaura Caldas','rosaura_caldas@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bernardete Casquero','bernardete_casquero@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sílvia Estrella','silvia_estrella@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Teresina Cervera','teresina_cervera@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tércio Quirós','tercio_quiros@sbt.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Astolfo Telles','astolfo_telles@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alexandra Rebimbas','alexandra_rebimbas@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Caetano Gentil','caetano_gentil@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Abigail Belém','abigail_belem@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Luciana Câmara','luciana_camara@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Corina Uchoa','corina_uchoa@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aurélia Noronha','aurelia_noronha@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Xênia   Damazio','xenia___damazio@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Félix Thomé','felix_thome@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Frutuoso Neres','frutuoso_neres@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Fausto Losada','fausto_losada@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ilídio Carmona','ilidio_carmona@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lídia Meneses','lidia_meneses@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Romano Mena','romano_mena@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lúcio Rebouças','lucio_reboucas@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Flamínia Valentín','flaminia_valentin@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Guadalupe Macedo','guadalupe_macedo@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Manuel Souto','manuel_souto@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Deolindo Pinho','deolindo_pinho@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Teodoro Almeyda','teodoro_almeyda@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Isadora Blanco','isadora_blanco@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gabriel Raminhos','gabriel_raminhos@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Doroteia Souza','doroteia_souza@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Daniela Rijo','daniela_rijo@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Astolfo Viera','astolfo_viera@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alexandre Azenha','alexandre_azenha@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Clementina Gabeira','clementina_gabeira@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Milu Carvalheira','milu_carvalheira@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gaudêncio Valim','gaudencio_valim@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mafalda Tristão','mafalda_tristao@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Constantino Guimaraes','constantino_guimaraes@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Guilherme Sacadura','guilherme_sacadura@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Elba Simão','elba_simao@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Inês Carvalhais','ines_carvalhais@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ruca Boaventura','ruca_boaventura@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ramiro Viégas','ramiro_viegas@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Elvira Vidal','elvira_vidal@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ubiratã Camello','ubirata_camello@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hermesinda Lisboa','hermesinda_lisboa@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Nicolas Távora','nicolas_tavora@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Luís Amaral','luis_amaral@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Frederica Freitas','frederica_freitas@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Filipe Quental','filipe_quental@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Denise Bogalho','denise_bogalho@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cora Cavadas','cora_cavadas@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mariano Albuquerque','mariano_albuquerque@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Crispim Quiroga','crispim_quiroga@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Antónia Cidreira','antonia_cidreira@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Timóteo Doutel','timoteo_doutel@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Judas Gorjão','judas_gorjao@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alceste Felgueiras','alceste_felgueiras@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Adriana Mantas','adriana_mantas@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Liedson Dias','liedson_dias@telecine.com');



INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Fabíola Belchior','fabiola_belchior@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jandira Castaño','jandira_castano@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Guadalupe Albernaz','guadalupe_albernaz@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Olga Blanco','olga_blanco@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Maíra Canário','maira_canario@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Levindo Duarte','levindo_duarte@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Inês Granjeiro','ines_granjeiro@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ovídio Azenha','ovidio_azenha@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Rosalinda Damazio','rosalinda_damazio@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alarico Tibiriçá','alarico_tibirica@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lineu Abasto','lineu_abasto@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Flávio Villas Boas','flavio_villas_boas@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gisela Caiado','gisela_caiado@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Josias Viégas','josias_viegas@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Augusta Prada','augusta_prada@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gil Estrada','gil_estrada@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alzira Mesquita','alzira_mesquita@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Aline Braga','aline_braga@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Nestor Castelbranco','nestor_castelbranco@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tobias Bacelar','tobias_bacelar@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Clarisse Paula','clarisse_paula@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Raoni Thamily','raoni_thamily@gmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Nivaldo Ramírez','nivaldo_ramirez@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Suniário Souto','suniario_souto@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Artur Portella','artur_portella@record.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sidônio   Mena','sidonio___mena@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alípio Canela','alipio_canela@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Marli Morales','marli_morales@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Teresa Fiestas','teresa_fiestas@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Burtira Franca','burtira_franca@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tarrataca Thomé','tarrataca_thome@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Viridiana Thamily','viridiana_thamily@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tibúrcio Montero','tiburcio_montero@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mileide Semedo','mileide_semedo@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Dorindo Faustino','dorindo_faustino@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Bernardete Frota','bernardete_frota@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Simeão Quirino','simeao_quirino@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ema Butantã','ema_butanta@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ismael Valverde','ismael_valverde@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Clara Lameira','clara_lameira@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Júlia Quintela','julia_quintela@mtv.tv');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gabriela Sabala','gabriela_sabala@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Flora Murtinho','flora_murtinho@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eugénio Góis','eugenio_gois@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Apoena Javier','apoena_javier@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Quintino Tavares','quintino_tavares@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cleusa Rabello','cleusa_rabello@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Estêvão Mattos','estevao_mattos@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ulrico Cysneiros','ulrico_cysneiros@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Glauco Queirós','glauco_queiros@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Susana Noguera','susana_noguera@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Alice Corte-Real','alice_corte-real@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Marlene Pirajá','marlene_piraja@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Odete Taborda','odete_taborda@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Diógenes Novaes','diogenes_novaes@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Daniel Alcántara','daniel_alcantara@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Benedita Pacheco','benedita_pacheco@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Henriqueta Ignacio','henriqueta_ignacio@windows.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Itiberê Márquez','itibere_marquez@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Oscar   Fontoura','oscar___fontoura@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lavínia Higuera','lavinia_higuera@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Débora Quaresma','debora_quaresma@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Belchior Gracia','belchior_gracia@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hermenegildo Sosa','hermenegildo_sosa@temp.tmp');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jaci Pirassununga','jaci_pirassununga@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gil Magalhães','gil_magalhaes@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Délia Valladares','delia_valladares@usa.net');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Jacir Félix','jacir_felix@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Fernanda Cantanhede','fernanda_cantanhede@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sebastião Guimaraes','sebastiao_guimaraes@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Orestes Pegado','orestes_pegado@hbo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hernâni Bethancout','hernani_bethancout@discovery.channel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Lúcio Villégas','lucio_villegas@sertanejo.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Honório Sobreira','honorio_sobreira@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mara Vilar','mara_vilar@marvel.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Cristiana Téllez','cristiana_tellez@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Janaína Collares','janaina_collares@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Florbela Ferraz','florbela_ferraz@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Evandro Lobo','evandro_lobo@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Tomé Cezimbra','tome_cezimbra@friends.com.us');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Palmira Neiva','palmira_neiva@telecine.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Belmifer Ferrón','belmifer_ferron@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Pascoal Teles','pascoal_teles@heavy.metal.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Luana Junqueira','luana_junqueira@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Zuleica Larangeira','zuleica_larangeira@terra.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Milu Velásquez','milu_velasquez@vaildochaves.com.mx');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Ágata Carvalhaes','agata_carvalhaes@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Mécia Damásio','mecia_damasio@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gaudêncio Tavares','gaudencio_tavares@cultura.com.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Hugo Silveira dos Açores','hugo_silveira_dos_acores@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Maíra Mourinho','maira_mourinho@linux.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Leonel Rúa','leonel_rua@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Sonás Ríos','sonas_rios@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Leônidas   Brandán','leonidas___brandan@globo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Gisela Azenha','gisela_azenha@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Emídio Veríssimo','emidio_verissimo@yahoo.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Eva Collares','eva_collares@selecao.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Marcos Travassos','marcos_travassos@hermanos.com.ar');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Crispim Querino','crispim_querino@samba.br');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Paraguaçu Carijó','paraguacu_carijo@hotmail.com');
INSERT INTO cliente (numero, nome, email) VALUES (SQ_CLIENTE.NEXTVAL, 'Otávio Regueira','otavio_regueira@sertanejo.com.br');


INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,2,187511463,1,300);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,2,400962468,2,348);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,2,409112000,2,289);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,3,198474553,7,376);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,4,414448303,0,328);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,4,11857381,6,240);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,5,371047745,5,379);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,5,225616342,3,119);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,5,15140549,8,331);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,6,193291495,2,282);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,7,89940236,1,340);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,7,168215886,1,156);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,8,295739455,5,444);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,9,402464325,6,88);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,9,59256727,5,339);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,10,11718435,5,182);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,12,343925259,8,56);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,13,363352649,6,58);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,14,94265006,2,74);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,15,261507272,1,68);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,15,141758207,5,335);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,16,400575456,1,483);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,17,127918587,3,9);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,18,257406629,2,126);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,18,146124300,0,287);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,18,281590938,4,441);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,19,78358192,0,491);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,19,319089332,7,494);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,19,288218636,5,205);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,20,271352669,7,429);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,20,133151725,5,330);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,20,158562267,0,136);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,21,260070721,1,135);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,21,358751672,7,181);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,22,212379546,3,427);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,22,427367751,7,492);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,23,22261025,8,412);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,23,431262421,3,143);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,24,147091146,5,349);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,25,293238749,6,274);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,26,268004601,2,373);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,26,93598696,7,399);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,27,153273940,8,365);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,28,284779153,0,215);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,29,262879112,2,78);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,29,353286653,8,360);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,30,403521640,1,108);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,31,1745250,4,200);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,31,162401264,7,147);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,32,146565516,7,225);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,32,109393292,2,149);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,32,293237279,2,357);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,34,94832614,5,244);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,35,281833930,4,251);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,35,106124891,2,150);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,35,99457920,7,47);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,35,278539794,3,416);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,35,284810999,8,144);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,36,170063359,2,70);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,36,1943738,8,79);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,36,254359402,7,326);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,36,393292023,4,456);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,37,431398026,8,451);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,38,14429544,3,22);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,39,319852908,3,336);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,39,97217528,8,436);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,39,299247041,8,299);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,40,125219232,8,85);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,40,243591934,8,257);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,40,200322129,7,408);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,41,110763269,6,55);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,41,288165031,8,166);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,42,57155380,2,377);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,42,385435512,4,378);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,42,271203609,8,394);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,42,224479925,1,216);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,42,306928356,3,317);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,43,312081481,6,400);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,43,141446647,6,447);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,43,25081812,0,373);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,43,51824800,2,364);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,43,19183183,7,83);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,44,77072861,2,184);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,44,309470210,6,10);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,44,115774292,1,294);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,44,234700334,4,320);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,45,373891103,1,351);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,45,180159338,8,437);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,45,224478822,2,148);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,45,222583938,1,220);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,45,81611528,0,385);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,46,149882870,8,33);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,46,193473237,0,324);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,46,255503693,6,60);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,47,352794091,5,430);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,47,360538154,8,204);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,47,402884846,7,286);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,48,320009446,0,452);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,48,88442466,4,92);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,49,364941217,4,139);



INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (1,50,267909423,3,382);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,1,430754320,4,44);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,1,251144344,3,131);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,2,201484438,0,32);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,2,305145937,8,369);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,2,99943025,7,88);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,3,435450952,5,90);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,3,339616064,3,243);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,4,276108961,3,137);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,4,92481500,3,91);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,5,4342689,0,498);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,6,162159371,8,64);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,7,397059706,0,11);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,7,15822670,1,104);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,8,240285900,7,310);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,9,254037645,1,158);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,9,109042865,5,122);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,12,278633277,7,177);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,12,424343051,0,280);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,13,400129089,6,54);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,13,32823517,1,313);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,14,244883880,0,266);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,14,314216724,3,17);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,14,225836084,3,474);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,16,308257129,6,120);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,16,347866165,6,380);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,16,335655953,1,357);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,17,284146067,6,36);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,17,120831779,6,230);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,20,346855259,7,31);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,20,245051338,3,6);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,20,433631717,7,457);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,21,414322296,5,346);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,22,278600126,8,386);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,22,321020135,5,326);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,22,261110475,7,62);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,22,307438756,1,66);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,24,386436835,3,239);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,25,219131727,3,453);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,25,340618593,1,247);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,25,59227932,5,387);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,25,404307387,8,145);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,26,327147720,5,67);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,26,256236972,0,173);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,27,117059620,3,438);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,27,373415894,7,186);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,27,332622562,7,388);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,28,280523875,6,390);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,28,212268745,2,141);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,28,278566345,2,29);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,29,366490642,2,500);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,29,15769960,4,118);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,29,174308602,8,360);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,30,424222306,8,208);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,31,143117142,6,245);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,31,49466611,4,367);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,31,146281797,0,489);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,32,161547674,0,342);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,34,270864881,8,282);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,34,50046444,8,198);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,34,149514305,8,86);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,35,314354173,0,160);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,35,359147377,3,34);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (247,35,357719152,2,45);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,1,282639475,4,171);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,1,233342431,4,295);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,2,304599744,5,25);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,2,16015656,0,307);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,3,215637901,0,262);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,5,986103,7,460);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,5,333716289,1,426);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,6,125418832,0,112);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,6,68545428,5,20);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,7,82065030,7,406);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,7,269069867,2,218);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,8,291653525,8,13);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,8,119892528,3,449);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,8,29358466,0,180);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,8,329523173,7,153);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,8,179093455,3,249);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,11,152000542,8,89);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,12,389930193,0,210);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,13,225866991,8,470);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,13,64146061,0,63);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,14,410502527,1,132);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,14,364578650,6,138);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,14,115584880,1,161);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,14,352854329,3,73);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,15,341282703,8,484);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,16,87859333,3,337);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,16,131349549,7,165);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,17,157574169,5,127);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,17,114157983,3,338);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,19,294600697,0,268);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,19,138328967,0,489);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,19,184481231,5,392);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,19,14767465,2,284);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,20,311248511,4,321);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,20,108994701,7,391);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,21,246458063,1,213);



INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,22,4845451,3,304);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,22,392353471,2,297);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,22,229671622,6,271);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,24,304560641,2,24);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,24,308764588,8,446);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,24,309944323,0,174);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,25,336251546,0,491);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,25,255674929,0,237);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,26,218769841,2,80);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,26,22728113,7,151);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,27,152607205,4,419);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,28,211747031,3,123);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,28,345939483,1,184);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (237,29,408009128,0,184);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,1,27027541,4,221);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,1,103068840,0,14);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,1,394141331,1,164);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,2,152303325,3,433);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,2,369267539,0,46);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,4,323404707,5,155);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,4,413602655,4,272);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,5,246783691,6,199);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,5,229504949,1,133);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,5,328901157,0,23);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,6,181371673,7,187);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,6,369692311,6,303);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,8,123157329,3,424);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,8,65672262,0,122);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,9,233072312,0,93);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,9,52668425,5,98);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,10,256786009,3,43);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,11,291972848,4,226);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,11,215478290,0,334);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,12,403377721,3,368);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,13,29777566,6,109);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,13,391415384,0,352);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,13,53087598,4,238);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,14,321871849,5,312);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,15,269295123,4,405);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,15,295186051,0,77);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,15,131039705,4,214);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,16,348964389,5,70);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,16,374955132,8,121);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,16,287612561,3,192);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,18,16955469,7,259);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,18,432446013,5,263);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,19,60336965,5,116);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,19,53306245,5,371);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,19,297332461,0,409);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,20,424879800,6,167);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,20,312103822,7,375);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,20,334808963,7,343);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,20,147450401,4,189);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,21,212102682,8,414);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,21,409960,1,258);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,22,431731035,2,84);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,22,300804522,7,420);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,23,385646699,4,128);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,24,323969502,4,479);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,24,412424527,7,87);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,24,142177674,8,308);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,25,178985163,4,466);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,25,262245541,4,111);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,25,42648609,2,169);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,26,253294089,0,129);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,26,15325457,2,435);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,26,412461021,7,481);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,27,59226760,2,8);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,29,135452660,5,159);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,29,105294373,2,350);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,29,342936889,2,499);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (33,29,267312285,4,205);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,2,10676972,4,302);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,2,12457207,6,464);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,2,19174386,8,395);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,3,239890161,3,194);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,3,398389701,8,106);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,4,363866700,4,87);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,4,215485447,8,218);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,4,348850672,0,48);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,5,2681146,7,19);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,5,162814876,8,322);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,7,278629263,4,176);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,7,103691016,8,290);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,7,57689792,4,396);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,8,114263257,8,275);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,8,310329511,7,94);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,8,173005519,6,442);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,9,163171955,3,103);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,9,219971673,3,64);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,10,174663174,0,168);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,10,343698402,2,450);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,11,7374585,5,358);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,11,362325544,4,135);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,11,242717839,5,37);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,12,255958283,5,485);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,12,203989772,8,65);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,12,224859865,0,122);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,14,205133509,6,271);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,15,25338387,5,497);



INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,15,101854984,2,402);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,15,227768696,8,341);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,16,85495902,8,471);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,17,297509693,5,18);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,18,150555655,1,152);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,18,431014199,6,193);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,18,105980628,7,496);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,18,26909131,2,5);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,19,175233843,8,286);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,20,336215247,8,51);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,21,229048319,3,333);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,23,227669380,8,473);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,23,139584117,0,31);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,24,44294555,7,495);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,25,345398841,1,393);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,26,171859642,0,305);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,26,209234587,8,455);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,27,423757034,6,2);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,28,364721267,5,56);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,28,107717060,1,40);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,28,367385521,2,267);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,28,404814467,0,408);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,29,6399999,8,477);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,29,151040077,3,211);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,30,385276988,1,355);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,30,163904238,3,361);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,31,208066282,8,314);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,31,176000826,7,109);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,32,408421578,4,482);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,32,256686740,6,188);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,32,289928323,8,223);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,33,329711671,1,339);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,33,392493434,6,117);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,34,358212114,6,264);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,34,167691573,0,253);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,34,401129052,2,440);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,37,133297860,7,232);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,38,137080671,2,299);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,38,366304544,5,222);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,39,321331703,6,163);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,39,339694786,1,384);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,39,58862980,2,114);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,39,5446986,4,102);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,40,24048895,8,76);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,40,19477901,5,467);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,40,296326411,6,170);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,40,273600731,3,50);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,41,372887850,4,463);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,42,72462928,6,486);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,42,116265008,4,381);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,42,325666566,1,71);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,43,339550311,0,280);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,44,16293719,0,401);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,44,162980999,7,197);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,44,329070445,1,62);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,45,262817224,4,255);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,45,98186070,6,356);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,45,345163727,2,142);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,46,120862725,7,28);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,46,81820336,2,107);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,46,214266971,7,209);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,47,14065564,1,269);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,47,132822257,7,458);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,49,282599295,4,325);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,49,246690806,8,359);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,50,9758400,2,162);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,50,44895790,7,383);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,51,159959225,1,446);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,51,390258408,6,32);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,51,8106488,5,396);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,52,371571641,5,273);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,52,81050224,0,105);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,52,156922631,8,179);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,53,137709482,5,207);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,53,359745287,4,448);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,54,418125983,2,362);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,55,161995280,8,472);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,57,190517389,6,33);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,57,383463676,0,59);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,57,64421435,4,311);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,57,618414,1,325);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,57,331149281,0,95);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,57,423488548,1,443);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,58,106703716,7,295);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,58,378367445,2,309);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,58,226031949,6,261);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,59,385733919,6,134);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,59,348334224,2,234);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,59,297614839,1,26);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,59,384760621,4,347);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,60,269892240,7,206);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,60,360009812,8,292);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,60,363715579,2,332);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,61,291023771,6,433);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,61,152281312,7,404);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,61,70289877,3,415);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,62,429625044,8,202);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,63,198413933,8,217);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,63,21185091,6,301);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,63,359816688,8,417);



INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,63,419927856,3,432);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,64,278129049,7,319);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,64,21568237,3,39);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,64,41274465,6,291);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,65,241144408,8,252);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,105180630,1,372);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,357559117,0,100);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,71561595,5,439);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,144355070,7,38);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,161410091,6,256);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,282349288,4,125);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,66,13854824,5,229);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,67,197457840,4,254);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,67,258044064,4,212);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,68,81705121,3,81);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,70,182514182,1,243);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,71,332346818,0,3);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,71,250891,7,196);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,71,215743932,0,450);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,72,237416846,0,285);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,72,31879157,7,213);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,72,96562416,8,484);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,73,372106632,3,422);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,73,239350397,1,469);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,74,95028093,8,219);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,74,377416799,7,172);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,74,196779169,8,81);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,75,217989140,8,4);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,75,167859094,0,67);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,76,177198655,5,228);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,77,222531385,7,53);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,77,315515906,2,312);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,77,384674782,6,344);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,78,37430685,3,41);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,79,357292155,5,281);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,79,185944483,8,154);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,80,181763720,5,241);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,80,342928300,2,97);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,81,14949625,3,493);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,82,198969482,2,488);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,82,111676611,2,389);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,83,51673812,6,395);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,83,96295332,5,115);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,83,267011504,5,235);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,83,310014871,0,398);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,83,78037356,2,278);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,85,368241711,8,140);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,85,216061885,6,52);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,86,273638774,5,404);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,88,46291348,4,296);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,88,92658814,4,315);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,89,148739669,5,185);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,89,79061444,1,329);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,89,392611601,1,407);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,89,202584093,3,363);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,90,203988788,6,130);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,90,296604792,5,465);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,90,187035200,8,472);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,92,89644267,0,7);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,92,221373266,8,30);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,93,26894291,6,410);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,93,60842821,8,210);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,93,257282600,5,134);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,93,276689922,1,127);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,94,94715990,6,411);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,94,290489730,3,293);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,94,119535816,0,319);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,94,26116054,4,461);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,95,59534795,8,51);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,95,292608330,5,476);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,96,138946166,1,423);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,96,140698307,8,107);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,96,316578434,6,490);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,96,392769798,8,72);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,96,346098925,3,157);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,97,370200553,7,475);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,98,42191114,8,258);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,98,332447931,6,246);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,99,272266794,3,227);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,102,394713802,7,254);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,102,60756551,5,195);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (104,102,118676303,3,270);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,1,253070359,2,77);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,1,378889628,6,366);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,1,127838726,4,323);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,1,139042757,5,242);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,2,296732505,5,61);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,2,266654565,3,199);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,3,171793285,4,434);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,3,148171067,1,260);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,3,402204855,1,203);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,3,19522853,0,473);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,3,78052423,7,428);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,3,308188397,7,21);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,4,89746065,5,12);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,4,281620715,3,146);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,4,81061872,8,318);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,5,330794984,6,421);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,5,109408088,5,231);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,6,211056099,4,487);



INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,6,74138712,7,175);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,7,68350421,7,403);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,7,194158634,6,113);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,8,112819583,7,124);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,8,123066776,5,183);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,8,12481557,1,41);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,8,343680986,0,101);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,10,98305027,8,288);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,11,383975196,8,345);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,11,336371340,0,298);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,12,238033050,3,370);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,12,188542592,6,425);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,15,146926500,1,191);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,16,217545867,5,196);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,16,357659616,8,2);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,18,57900118,8,190);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,19,343019537,2,42);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,19,366988259,2,57);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,19,25574239,0,480);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,20,31767518,3,277);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,20,305117207,0,117);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,21,238231361,4,279);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,22,76253486,6,390);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,22,199169029,0,201);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,22,307348526,2,374);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (399,22,62587370,2,27);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (623,2,282169851,5,283);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (623,3,428795214,8,323);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (623,3,334786253,4,1);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (623,3,249749655,5,35);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (623,4,203580474,6,306);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (623,5,252881626,2,233);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,1,433900313,3,176);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,1,212415609,0,291);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,1,228315155,5,251);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,1,172434281,2,82);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,2,288432203,8,304);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,3,310867983,7,110);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,4,311520744,1,409);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,4,389233085,3,276);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,4,174214808,0,224);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,4,292888275,0,49);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,4,267269132,5,327);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,4,14118439,3,454);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,5,60980709,5,468);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,6,423138683,5,96);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,6,135836582,4,316);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (655,7,375479909,2,418);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,1,424527622,3,16);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,1,157848874,4,462);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,2,396397360,6,69);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,2,314912566,5,178);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,4,305267511,3,478);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,5,178152679,3,459);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,6,264454988,2,241);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,7,364294952,0,248);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,7,147843646,4,413);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,7,23691884,8,445);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,8,71822855,0,15);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,8,145805591,2,397);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,10,301678419,2,75);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,10,397364750,0,265);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,11,373602010,6,236);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,12,135889323,7,354);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,12,53696318,6,161);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,12,143928549,0,431);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,12,188340066,0,283);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,13,263560669,1,250);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,13,213259093,0,116);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,13,239033258,0,329);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,13,137736540,3,99);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,13,45021305,5,353);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,14,389148864,1,244);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,16,265011678,0,15);
INSERT INTO conta_corrente (banco_numero,agencia_numero,numero,digito,cliente_numero) VALUES (477,16,106523513,8,463);


INSERT INTO tipo_transacao (id, nome) VALUES (1, 'Débito');
INSERT INTO tipo_transacao (id, nome) VALUES (2, 'Crédito');
INSERT INTO tipo_transacao (id, nome) VALUES (3, 'Transferência');
INSERT INTO tipo_transacao (id, nome) VALUES (4, 'Empréstimo');


CREATE SEQUENCE SQ_CLIENTE_TRANSACOES START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;


INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,30,424222306,8,208,3, 0.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,203989772,8,65,3, 1.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,14118439,3,454,3, 1.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,12,278633277,7,177,3, 1.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,282599295,4,325,3, 2.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,312103822,7,375,3, 2.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,4,203580474,6,306,3, 2.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,295186051,0,77,3, 3.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,3,215637901,0,262,3, 3.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,10,256786009,3,43,3, 3.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,362325544,4,135,3, 3.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,246690806,8,359,3, 4.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,25574239,0,480,3, 5.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,311520744,1,409,3, 5.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,64421435,4,311,3, 5.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,258044064,4,212,3, 6.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,143117142,6,245,3, 7.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,17,127918587,3,9,3, 7.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,217545867,5,196,3, 7.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,137736540,3,99,3, 8.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,358751672,7,181,3, 8.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,24,386436835,3,239,3, 9.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,287612561,3,192,3, 9.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,24,147091146,5,349,3, 10.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,329711671,1,339,3, 10.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,267011504,5,235,3, 10.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,267312285,4,205,3, 12.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,76,177198655,5,228,3, 12.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,392769798,8,72,3, 12.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,15140549,8,331,3, 12.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,224478822,2,148,3, 13.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,29777566,6,109,3, 13.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,332447931,6,246,3, 14.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,15769960,4,118,3, 14.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,392493434,6,117,3, 14.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,321020135,5,326,3, 14.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,289928323,8,223,3, 15.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,6,162159371,8,64,3, 15.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,2,16015656,0,307,3, 15.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,308257129,6,120,3, 16.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,116265008,4,381,3, 16.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,146124300,0,287,3, 18.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,331149281,0,95,3, 18.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,323404707,5,155,3, 18.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,309470210,6,10,3, 19.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,238033050,3,370,3, 19.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,402204855,1,203,3, 19.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,19183183,7,83,3, 19.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,10,174663174,0,168,3, 20.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,103691016,8,290,3, 20.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,311248511,4,321,3, 20.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,9758400,2,162,3, 21.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,219131727,3,453,3, 21.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,19174386,8,395,3, 21.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,14,94265006,2,74,3, 21.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,413602655,4,272,3, 21.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,99943025,7,88,3, 21.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,162980999,7,197,3, 22.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,402464325,6,88,3, 22.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,384760621,4,347,3, 23.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,14767465,2,284,3, 23.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,149514305,8,86,3, 23.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,352794091,5,430,3, 23.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,243591934,8,257,3, 23.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,224479925,1,216,3, 24.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,428795214,8,323,3, 24.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,21,238231361,4,279,3, 24.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,292888275,0,49,3, 24.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,171793285,4,434,3, 24.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,412424527,7,87,3, 25.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,55,161995280,8,472,3, 25.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,227768696,8,341,3, 26.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,18,57900118,8,190,3, 26.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,21,246458063,1,213,3, 26.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,26116054,4,461,3, 26.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,81,14949625,3,493,3, 26.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,254359402,7,326,3, 27.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,135836582,4,316,3, 28.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,294600697,0,268,3, 28.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,321331703,6,163,3, 29.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,27,152607205,4,419,3, 30.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,339694786,1,384,3, 31.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,249749655,5,35,3, 31.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,6,264454988,2,241,3, 31.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,14,205133509,6,271,3, 31.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,26909131,2,5,3, 31.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,5,60980709,5,468,3, 32.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,222531385,7,53,3, 32.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,41274465,6,291,3, 32.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,2,304599744,5,25,3, 32.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,393292023,4,456,3, 32.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,412461021,7,481,3, 32.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,336251546,0,491,3, 33.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,1,157848874,4,462,3, 33.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,15,341282703,8,484,3, 33.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,148739669,5,185,3, 33.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,6,74138712,7,175,3, 33.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,366490642,2,500,3, 34.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,8,240285900,7,310,3, 34.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,3, 35.82);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,242717839,5,37,3, 36.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,278629263,4,176,3, 37.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,1,430754320,4,44,3, 37.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,81061872,8,318,3, 38.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,96295332,5,115,3, 38.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,41,372887850,4,463,3, 38.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,348334224,2,234,3, 39.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,8,123157329,3,424,3, 39.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,188340066,0,283,3, 39.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,255958283,5,485,3, 40.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,221373266,8,30,3, 40.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,149882870,8,33,3, 40.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,378367445,2,309,3, 41.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,319852908,3,336,3, 41.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,234700334,4,320,3, 41.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,27,153273940,8,365,3, 41.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,345939483,1,184,3, 41.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,65,241144408,8,252,3, 41.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,81820336,2,107,3, 43.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,329070445,1,62,3, 43.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,364294952,0,248,3, 43.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,334786253,4,1,3, 44.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,433631717,7,457,3, 44.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,107717060,1,40,3, 44.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,26,209234587,8,455,3, 44.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,135452660,5,159,3, 44.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,2681146,7,19,3, 44.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,3, 45.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,239033258,0,329,3, 45.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,308764588,8,446,3, 45.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,215478290,0,334,3, 45.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,96562416,8,484,3, 46.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,7,194158634,6,113,3, 46.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,25338387,5,497,3, 46.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,281590938,4,441,3, 46.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,14,321871849,5,312,3, 47.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,16,131349549,7,165,3, 48.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,212415609,0,291,3, 48.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,58862980,2,114,3, 49.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,3,198474553,7,376,3, 49.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,424879800,6,167,3, 50.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,86,273638774,5,404,3, 51.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,92658814,4,315,3, 51.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,392353471,2,297,3, 51.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,245051338,3,6,3, 52.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,188542592,6,425,3, 52.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,330794984,6,421,3, 52.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,68,81705121,3,81,3, 52.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,8106488,5,396,3, 52.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,57689792,4,396,3, 53.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,986103,7,460,3, 53.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,132822257,7,458,3, 54.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,271352669,7,429,3, 55.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,148171067,1,260,3, 55.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,304560641,2,24,3, 55.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,21568237,3,39,3, 56.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,2,282169851,5,283,3, 56.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,157574169,5,127,3, 56.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,9,219971673,3,64,3, 57.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,378889628,6,366,3, 57.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,23,431262421,3,143,3, 57.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,4,305267511,3,478,3, 57.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,16,85495902,8,471,3, 58.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,179093455,3,249,3, 59.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,162401264,7,147,3, 59.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,278566345,2,29,3, 59.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,225616342,3,119,3, 59.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,1,282639475,4,171,3, 60.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,9,254037645,1,158,3, 60.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,409960,1,258,3, 61.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,8,295739455,5,444,3, 62.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,369692311,6,303,3, 63.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,269295123,4,405,3, 63.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,342928300,2,97,3, 63.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,161410091,6,256,3, 64.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,10,98305027,8,288,3, 64.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,187035200,8,472,3, 65.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,26,256236972,0,173,3, 67.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,71561595,5,439,3, 67.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,140698307,8,107,3, 68.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,71822855,0,15,3, 68.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,18,432446013,5,263,3, 68.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,12457207,6,464,3, 68.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,224859865,0,122,3, 69.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,6,193291495,2,282,3, 69.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,3, 69.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,296604792,5,465,3, 69.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,14,389148864,1,244,3, 69.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,346855259,7,31,3, 70.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,15822670,1,104,3, 70.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,152303325,3,433,3, 70.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,397364750,0,265,3, 70.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,180159338,8,437,3, 70.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,211747031,3,123,3, 71.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,57155380,2,377,3, 71.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,253294089,0,129,3, 72.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,282349288,4,125,3, 73.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,13,225866991,8,470,3, 73.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,273600731,3,50,3, 73.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,1943738,8,79,3, 73.75);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,358212114,6,264,3, 73.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,374955132,8,121,3, 74.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,4845451,3,304,3, 74.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,19,175233843,8,286,3, 74.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,270864881,8,282,3, 75.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,229504949,1,133,3, 75.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,147843646,4,413,3, 75.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,115584880,1,161,3, 76.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,348850672,0,48,3, 76.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,423138683,5,96,3, 76.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,244883880,0,266,3, 76.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,290489730,3,293,3, 76.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,369267539,0,46,3, 76.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,106124891,2,150,3, 77.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,26894291,6,410,3, 77.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,212102682,8,414,3, 77.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,5,252881626,2,233,3, 77.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,198413933,8,217,3, 78.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,114157983,3,338,3, 78.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,222583938,1,220,3, 79.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,346098925,3,157,3, 79.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,99,272266794,3,227,3, 80.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,431014199,6,193,3, 80.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,364578650,6,138,3, 80.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,13,32823517,1,313,3, 80.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,1,251144344,3,131,3, 81.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,340618593,1,247,3, 81.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,316578434,6,490,3, 81.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,269892240,7,206,3, 82.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,197457840,4,254,3, 83.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,325666566,1,71,3, 83.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,233072312,0,93,3, 83.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,5,178152679,3,459,3, 84.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,26,218769841,2,80,3, 84.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,174214808,0,224,3, 84.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,371047745,5,379,3, 86.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,329523173,7,153,3, 86.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,409112000,2,289,3, 87.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,23691884,8,445,3, 87.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,13,363352649,6,58,3, 88.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,78,37430685,3,41,3, 88.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,296326411,6,170,3, 89.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,51824800,2,364,3, 89.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,53,359745287,4,448,3, 90.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,27,423757034,6,2,3, 90.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,213259093,0,116,3, 90.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,216061885,6,52,3, 91.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,78037356,2,278,3, 91.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,359816688,8,417,3, 91.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,391415384,0,352,3, 91.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,13854824,5,229,3, 91.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,377416799,7,172,3, 92.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,76253486,6,390,3, 93.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,263560669,1,250,3, 94.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,348964389,5,70,3, 94.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,23,139584117,0,31,3, 94.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,150555655,1,152,3, 94.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,78358192,0,491,3, 94.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,196779169,8,81,3, 95.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,109393292,2,149,3, 95.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,10,343698402,2,450,3, 95.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,142177674,8,308,3, 95.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,366988259,2,57,3, 95.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,105294373,2,350,3, 96.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,54,418125983,2,362,3, 96.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,26,327147720,5,67,3, 97.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,333716289,1,426,3, 97.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,89746065,5,12,3, 97.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,257406629,2,126,3, 98.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,50,267909423,3,382,3, 98.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,46291348,4,296,3, 98.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,114263257,8,275,3, 98.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,3,310867983,7,110,3, 99.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,7,168215886,1,156,3, 99.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,135889323,7,354,3, 99.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,400962468,2,348,3, 100.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,51673812,6,395,3, 100.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,328901157,0,23,3, 100.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,137080671,2,299,4, 0.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,229671622,6,271,4, 0.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,221373266,8,30,4, 0.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,49,364941217,4,139,4, 0.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,304560641,2,24,4, 0.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,15,341282703,8,484,4, 0.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,133151725,5,330,4, 0.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,103691016,8,290,4, 0.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,332447931,6,246,4, 0.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,291023771,6,433,4, 0.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,21,229048319,3,333,4, 0.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,4, 0.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,409112000,2,289,4, 0.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,15325457,2,435,4, 0.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,282599295,4,325,4, 0.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,137736540,3,99,4, 0.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,358751672,7,181,4, 0.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,12481557,1,41,4, 0.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,16293719,0,401,4, 0.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,143117142,6,245,4, 0.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,200322129,7,408,4, 0.82);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,59256727,5,339,4, 0.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,311520744,1,409,4, 0.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,4, 0.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,125418832,0,112,4, 0.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,357292155,5,281,4, 0.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,109393292,2,149,4, 0.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,108994701,7,391,4, 0.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,409960,1,258,4, 0.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,294600697,0,268,4, 1.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,119892528,3,449,4, 1.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,347866165,6,380,4, 1.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,383975196,8,345,4, 1.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,24048895,8,76,4, 1.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,196779169,8,81,4, 1.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,14,205133509,6,271,4, 1.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,309470210,6,10,4, 1.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,82,198969482,2,488,4, 1.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,162980999,7,197,4, 1.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,27,152607205,4,419,4, 1.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,385435512,4,378,4, 1.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,7,82065030,7,406,4, 1.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,239350397,1,469,4, 1.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,335655953,1,357,4, 1.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,314354173,0,160,4, 1.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,8,123157329,3,424,4, 1.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,71822855,0,15,4, 1.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,308257129,6,120,4, 1.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,19477901,5,467,4, 1.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,428795214,8,323,4, 1.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,42648609,2,169,4, 1.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,255503693,6,60,4, 1.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,296326411,6,170,4, 1.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,30,385276988,1,355,4, 1.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,330794984,6,421,4, 1.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,197457840,4,254,4, 1.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,331149281,0,95,4, 1.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,332622562,7,388,4, 1.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,986103,7,460,4, 1.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,4, 1.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,385733919,6,134,4, 1.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,41274465,6,291,4, 2.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,224479925,1,216,4, 2.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,29,6399999,8,477,4, 2.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,307438756,1,66,4, 2.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,314912566,5,178,4, 2.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,32,161547674,0,342,4, 2.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,357659616,8,2,4, 2.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,219131727,3,453,4, 2.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,53,137709482,5,207,4, 2.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,359816688,8,417,1, 0.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,139042757,5,242,1, 0.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,412461021,7,481,1, 0.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,396397360,6,69,1, 0.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,14118439,3,454,1, 0.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,397059706,0,11,1, 0.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,46291348,4,296,1, 1.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,70289877,3,415,1, 1.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,143117142,6,245,1, 1.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,29777566,6,109,1, 1.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,114157983,3,338,1, 1.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,11,152000542,8,89,1, 1.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,48,320009446,0,452,1, 2.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,363715579,2,332,1, 2.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,346855259,7,31,1, 2.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,149882870,8,33,1, 2.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,340618593,1,247,1, 2.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,25081812,0,373,1, 2.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,6,264454988,2,241,1, 2.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,345163727,2,142,1, 2.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,1, 2.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,371571641,5,273,1, 3.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,173005519,6,442,1, 3.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,221373266,8,30,1, 3.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,360538154,8,204,1, 3.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,125418832,0,112,1, 3.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,127838726,4,323,1, 3.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,330794984,6,421,1, 3.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,267011504,5,235,1, 3.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,190517389,6,33,1, 3.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,226031949,6,261,1, 3.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,256686740,6,188,1, 3.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,117059620,3,438,1, 3.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,162980999,7,197,1, 4.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,15,146926500,1,191,1, 4.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,13,400129089,6,54,1, 4.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,409960,1,258,1, 4.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,19477901,5,467,1, 4.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,156922631,8,179,1, 4.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,19522853,0,473,1, 4.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,161410091,6,256,1, 4.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,216061885,6,52,1, 4.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,329070445,1,62,1, 4.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,394713802,7,254,1, 4.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,21,229048319,3,333,1, 5.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,244883880,0,266,1, 5.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,392353471,2,297,1, 5.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,125219232,8,85,1, 5.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,150555655,1,152,1, 5.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,30,163904238,3,361,1, 5.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,14,205133509,6,271,1, 5.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,27,59226760,2,8,1, 5.92);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,29358466,0,180,1, 18.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,334808963,7,343,1, 18.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,99,272266794,3,227,1, 18.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,374955132,8,121,1, 18.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,291972848,4,226,1, 18.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,307348526,2,374,1, 19.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,133151725,5,330,1, 19.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,25338387,5,497,1, 19.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,284146067,6,36,1, 19.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,9,109042865,5,122,1, 19.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,339694786,1,384,1, 19.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,146124300,0,287,1, 19.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,333716289,1,426,1, 19.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,295186051,0,77,1, 19.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,383975196,8,345,1, 19.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,384760621,4,347,1, 19.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,82,111676611,2,389,1, 19.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,138946166,1,423,1, 20.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,3,215637901,0,262,1, 20.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,8,240285900,7,310,1, 20.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,26116054,4,461,1, 20.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,4,11857381,6,240,1, 21.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,5,60980709,5,468,1, 21.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,12,424343051,0,280,1, 21.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,402464325,6,88,1, 22.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,170063359,2,70,1, 22.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,53087598,4,238,1, 22.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,4,276108961,3,137,1, 22.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,51673812,6,395,1, 22.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,280523875,6,390,1, 23.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,181371673,7,187,1, 23.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,31,176000826,7,109,1, 23.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,3,239890161,3,194,1, 23.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,26,93598696,7,399,1, 23.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,258044064,4,212,1, 24.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,383463676,0,59,1, 24.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,53696318,6,161,1, 24.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,106703716,7,295,1, 24.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,148739669,5,185,1, 24.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,271352669,7,429,1, 24.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,267312285,4,205,1, 24.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,357719152,2,45,1, 24.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,188340066,0,283,1, 24.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,325666566,1,71,1, 24.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,1,430754320,4,44,1, 24.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,2,296732505,5,61,1, 24.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,371047745,5,379,1, 24.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,8,123157329,3,424,1, 24.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,193473237,0,324,1, 25.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,282349288,4,125,1, 25.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,152303325,3,433,1, 25.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,72462928,6,486,1, 25.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,342936889,2,499,1, 25.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,137080671,2,299,1, 25.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,101854984,2,402,1, 25.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,242717839,5,37,1, 26.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,76,177198655,5,228,1, 26.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,3,339616064,3,243,1, 26.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,38,14429544,3,22,1, 26.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,224859865,0,122,1, 26.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,75,167859094,0,67,1, 26.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,21,414322296,5,346,1, 26.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,15822670,1,104,1, 27.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,23,22261025,8,412,1, 27.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,212102682,8,414,1, 27.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,366490642,2,500,1, 27.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,292888275,0,49,1, 27.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,332346818,0,3,1, 27.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,203989772,8,65,1, 28.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,357659616,8,2,1, 28.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,53,359745287,4,448,1, 28.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,352794091,5,430,1, 28.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,5,4342689,0,498,1, 28.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,281590938,4,441,1, 28.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,397364750,0,265,1, 28.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,323969502,4,479,1, 28.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,366304544,5,222,1, 28.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,1,233342431,4,295,1, 28.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,16,87859333,3,337,1, 29.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,352854329,3,73,1, 29.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,428795214,8,323,1, 29.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,253070359,2,77,1, 29.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,410502527,1,132,1, 29.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,345939483,1,184,1, 29.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,23,385646699,4,128,1, 29.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,13,363352649,6,58,1, 29.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,49,364941217,4,139,1, 29.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,167691573,0,253,1, 29.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,404814467,0,408,1, 29.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,132822257,7,458,1, 29.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,96295332,5,115,1, 29.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,10,98305027,8,288,1, 30.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,116265008,4,381,1, 30.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,215743932,0,450,1, 30.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,13854824,5,229,1, 30.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,57155380,2,377,1, 30.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,290489730,3,293,1, 30.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,377416799,7,172,1, 30.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,373891103,1,351,1, 31.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,227768696,8,341,1, 31.33);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,34,94832614,5,244,1, 31.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,332622562,7,388,1, 31.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,12,343925259,8,56,1, 31.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,1, 32.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,172434281,2,82,1, 32.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,1, 32.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,179093455,3,249,1, 32.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,131039705,4,214,1, 33.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,24,147091146,5,349,1, 33.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,71561595,5,439,1, 33.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,986103,7,460,1, 33.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,402884846,7,286,1, 33.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,618414,1,325,1, 34.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,58862980,2,114,1, 34.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,297332461,0,409,1, 34.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,185944483,8,154,1, 34.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,237416846,0,285,1, 34.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,109408088,5,231,1, 34.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,30,424222306,8,208,1, 34.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,357292155,5,281,1, 34.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,26,22728113,7,151,1, 34.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,81050224,0,105,1, 34.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,21568237,3,39,1, 34.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,305145937,8,369,1, 34.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,123066776,5,183,1, 34.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,392493434,6,117,1, 35.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,238033050,3,370,1, 35.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,269892240,7,206,1, 35.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,115584880,1,161,1, 35.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,13,32823517,1,313,1, 35.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,278629263,4,176,1, 35.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,347866165,6,380,1, 35.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,147843646,4,413,1, 35.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,199169029,0,201,1, 35.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,362325544,4,135,1, 35.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,4,305267511,3,478,1, 35.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,55,161995280,8,472,1, 36.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,419927856,3,432,1, 36.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,394141331,1,164,1, 36.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,22,431731035,2,84,1, 36.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,316578434,6,490,1, 36.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,312081481,6,400,1, 36.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,314912566,5,178,1, 36.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,1,282639475,4,171,1, 37.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,384674782,6,344,1, 37.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,50046444,8,198,1, 37.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,70,182514182,1,243,1, 37.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,281833930,4,251,1, 37.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,329523173,7,153,1, 37.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,120831779,6,230,1, 37.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,378889628,6,366,1, 37.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,369692311,6,303,1, 37.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,157574169,5,127,1, 38.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,14767465,2,284,1, 38.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,184481231,5,392,1, 38.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,92658814,4,315,1, 38.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,201484438,0,32,1, 39.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,45021305,5,353,1, 39.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,10,343698402,2,450,1, 39.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,332447931,6,246,1, 39.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,114263257,8,275,1, 39.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,21,238231361,4,279,1, 40.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,142177674,8,308,1, 40.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,16,106523513,8,463,1, 40.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,20,305117207,0,117,1, 40.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,271203609,8,394,1, 40.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,401129052,2,440,1, 40.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,24,44294555,7,495,1, 40.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,15,341282703,8,484,1, 40.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,372106632,3,422,2, 0.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,25081812,0,373,2, 0.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,14118439,3,454,2, 0.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,51673812,6,395,2, 1.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,65,241144408,8,252,2, 1.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,27,153273940,8,365,2, 1.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,397059706,0,11,2, 1.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,22,300804522,7,420,2, 1.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,13854824,5,229,2, 2.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,202584093,3,363,2, 2.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,308257129,6,120,2, 2.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,315515906,2,312,2, 2.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,12,403377721,3,368,2, 2.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,117059620,3,438,2, 3.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,336371340,0,298,2, 3.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,1,282639475,4,171,2, 3.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,319089332,7,494,2, 3.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,294600697,0,268,2, 3.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,366988259,2,57,2, 4.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,135452660,5,159,2, 4.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,50,267909423,3,382,2, 4.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,4,276108961,3,137,2, 4.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,357659616,8,2,2, 4.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,249749655,5,35,2, 4.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,332346818,0,3,2, 4.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,6,193291495,2,282,2, 4.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,234700334,4,320,2, 4.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,2681146,7,19,2, 4.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,26,209234587,8,455,2, 5.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,273600731,3,50,2, 5.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,49,364941217,4,139,2, 5.80);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,384674782,6,344,2, 5.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,12,278633277,7,177,2, 6.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,196779169,8,81,2, 6.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,290489730,3,293,2, 6.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,27027541,4,221,2, 6.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,70,182514182,1,243,2, 6.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,58862980,2,114,2, 6.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,328901157,0,23,2, 6.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,2,304599744,5,25,2, 6.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,16,131349549,7,165,2, 7.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,185944483,8,154,2, 7.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,99943025,7,88,2, 7.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,271203609,8,394,2, 7.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,125219232,8,85,2, 7.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,7,269069867,2,218,2, 7.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,1,430754320,4,44,2, 7.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,12,343925259,8,56,2, 7.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,76253486,6,390,2, 7.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,53696318,6,161,2, 7.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,25,293238749,6,274,2, 8.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,145805591,2,397,2, 8.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,345939483,1,184,2, 8.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,23691884,8,445,2, 8.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,310329511,7,94,2, 8.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,187035200,8,472,2, 8.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,343019537,2,42,2, 8.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,123066776,5,183,2, 9.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,25574239,0,480,2, 9.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,262817224,4,255,2, 9.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,78052423,7,428,2, 9.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,24,386436835,3,239,2, 9.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,3,398389701,8,106,2, 9.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,308188397,7,21,2, 9.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,197457840,4,254,2, 9.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,4,305267511,3,478,2, 9.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,53306245,5,371,2, 10.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,262245541,4,111,2, 10.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,239033258,0,329,2, 10.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,26,93598696,7,399,2, 10.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,149882870,8,33,2, 11.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,78037356,2,278,2, 11.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,24048895,8,76,2, 11.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,255958283,5,485,2, 11.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,12481557,1,41,2, 11.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,50046444,8,198,2, 11.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,378889628,6,366,2, 12.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,384760621,4,347,2, 12.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,373415894,7,186,2, 12.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,109408088,5,231,2, 12.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,226031949,6,261,2, 12.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,28,284779153,0,215,2, 13.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,301678419,2,75,2, 13.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,15,341282703,8,484,2, 13.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,319852908,3,336,2, 13.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,59256727,5,339,2, 13.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,374955132,8,121,2, 13.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,71822855,0,15,2, 13.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,367385521,2,267,2, 13.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,339694786,1,384,2, 13.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,127838726,4,323,2, 13.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,45021305,5,353,2, 13.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,15769960,4,118,2, 14.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,15140549,8,331,2, 14.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,16,106523513,8,463,2, 14.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,158562267,0,136,2, 14.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,15822670,1,104,2, 14.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,29,353286653,8,360,2, 14.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,267269132,5,327,2, 14.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,13,64146061,0,63,2, 15.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,423488548,1,443,2, 15.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,41,110763269,6,55,2, 15.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,125418832,0,112,2, 15.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,1,233342431,4,295,2, 15.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,402464325,6,88,2, 15.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,81061872,8,318,2, 15.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,394141331,1,164,2, 16.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,55,161995280,8,472,2, 16.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,363866700,4,87,2, 16.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,6,264454988,2,241,2, 16.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,278539794,3,416,2, 16.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,385435512,4,378,2, 16.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,99457920,7,47,2, 17.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,244883880,0,266,2, 17.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,71561595,5,439,2, 17.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,412461021,7,481,2, 17.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,5446986,4,102,2, 17.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,329711671,1,339,2, 17.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,82,111676611,2,389,2, 18.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,297332461,0,409,2, 18.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,212268745,2,141,2, 18.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,269295123,4,405,2, 18.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,3,198474553,7,376,2, 18.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,41274465,6,291,2, 18.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,256686740,6,188,2, 18.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,321020135,5,326,2, 19.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,423138683,5,96,2, 19.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,288218636,5,205,2, 19.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,9,109042865,5,122,2, 19.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,200322129,7,408,2, 19.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,14767465,2,284,2, 19.55);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,18,432446013,5,263,2, 19.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,371047745,5,379,2, 19.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,229504949,1,133,2, 20.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,19183183,7,83,2, 20.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,143928549,0,431,2, 20.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,343680986,0,101,2, 20.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,170063359,2,70,2, 20.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,138328967,0,489,2, 21.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,60336965,5,116,2, 21.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,394713802,7,254,2, 21.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,357292155,5,281,2, 21.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,295186051,0,77,2, 21.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,38,14429544,3,22,2, 22.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,389233085,3,276,2, 22.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,371571641,5,273,2, 22.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,280523875,6,390,2, 22.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,96562416,8,484,2, 22.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,346098925,3,157,2, 23.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,60756551,5,195,2, 23.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,1,424527622,3,16,2, 23.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,106703716,7,295,2, 23.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,228315155,5,251,2, 23.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,305145937,8,369,2, 24.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,81,14949625,3,493,2, 24.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,203989772,8,65,2, 24.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,402204855,1,203,2, 25.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,348334224,2,234,2, 25.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,44895790,7,383,2, 25.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,3,215637901,0,262,2, 25.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,242717839,5,37,2, 25.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,68,81705121,3,81,2, 25.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,292888275,0,49,2, 25.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,19522853,0,473,2, 26.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,29,262879112,2,78,2, 26.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,314354173,0,160,2, 26.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,21568237,3,39,2, 26.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,336251546,0,491,2, 26.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,284810999,8,144,2, 27.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,12,389930193,0,210,2, 27.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,321331703,6,163,2, 27.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,7374585,5,358,2, 27.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,348850672,0,48,2, 27.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,267011504,5,235,2, 27.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,68545428,5,20,2, 28.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,311248511,4,321,2, 28.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,98186070,6,356,2, 28.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,25338387,5,497,2, 28.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,22,427367751,7,492,2, 29.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,323404707,5,155,2, 29.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,296604792,5,465,2, 29.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,57155380,2,377,2, 29.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,390258408,6,32,2, 30.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,357719152,2,45,2, 30.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,109393292,2,149,2, 30.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,54,418125983,2,362,2, 30.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,358751672,7,181,2, 30.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,282599295,4,325,2, 30.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,94715990,6,411,2, 31.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,17,127918587,3,9,2, 31.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,291653525,8,13,2, 31.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,306928356,3,317,2, 31.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,215743932,0,450,2, 31.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,146281797,0,489,2, 31.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,224478822,2,148,2, 31.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,219131727,3,453,2, 32.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,360009812,8,292,2, 32.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,150555655,1,152,2, 32.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,385733919,6,134,2, 32.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,222531385,7,53,2, 33.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,22,212379546,3,427,2, 33.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,352794091,5,430,2, 33.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,29777566,6,109,2, 33.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,32,161547674,0,342,2, 33.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,162980999,7,197,2, 33.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,1745250,4,200,2, 34.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,21,238231361,4,279,2, 34.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,201484438,0,32,2, 34.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,368241711,8,140,2, 34.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,81611528,0,385,2, 34.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,112819583,7,124,2, 35.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,30,424222306,8,208,2, 35.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,1943738,8,79,2, 36.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,14,389148864,1,244,2, 36.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,366304544,5,222,2, 36.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,29,408009128,0,184,2, 36.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,105294373,2,350,2, 36.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,243591934,8,257,2, 36.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,392353471,2,297,2, 37.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,162814876,8,322,2, 37.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,52668425,5,98,2, 37.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,8,240285900,7,310,2, 37.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,291972848,4,226,2, 37.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,148171067,1,260,2, 37.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,2, 37.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,2, 38.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,323969502,4,479,2, 38.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,27,152607205,4,419,2, 38.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,21185091,6,301,2, 38.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,225616342,3,119,2, 38.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,312103822,7,375,2, 39.30);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,18,432446013,5,263,2, 19.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,371047745,5,379,2, 19.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,229504949,1,133,2, 20.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,19183183,7,83,2, 20.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,143928549,0,431,2, 20.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,343680986,0,101,2, 20.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,170063359,2,70,2, 20.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,138328967,0,489,2, 21.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,60336965,5,116,2, 21.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,394713802,7,254,2, 21.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,357292155,5,281,2, 21.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,295186051,0,77,2, 21.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,38,14429544,3,22,2, 22.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,389233085,3,276,2, 22.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,371571641,5,273,2, 22.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,280523875,6,390,2, 22.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,96562416,8,484,2, 22.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,346098925,3,157,2, 23.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,60756551,5,195,2, 23.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,1,424527622,3,16,2, 23.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,106703716,7,295,2, 23.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,228315155,5,251,2, 23.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,305145937,8,369,2, 24.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,81,14949625,3,493,2, 24.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,203989772,8,65,2, 24.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,402204855,1,203,2, 25.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,348334224,2,234,2, 25.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,44895790,7,383,2, 25.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,3,215637901,0,262,2, 25.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,242717839,5,37,2, 25.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,68,81705121,3,81,2, 25.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,292888275,0,49,2, 25.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,19522853,0,473,2, 26.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,29,262879112,2,78,2, 26.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,314354173,0,160,2, 26.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,21568237,3,39,2, 26.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,336251546,0,491,2, 26.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,284810999,8,144,2, 27.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,12,389930193,0,210,2, 27.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,321331703,6,163,2, 27.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,7374585,5,358,2, 27.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,348850672,0,48,2, 27.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,267011504,5,235,2, 27.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,68545428,5,20,2, 28.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,311248511,4,321,2, 28.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,98186070,6,356,2, 28.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,25338387,5,497,2, 28.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,22,427367751,7,492,2, 29.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,323404707,5,155,2, 29.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,296604792,5,465,2, 29.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,57155380,2,377,2, 29.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,390258408,6,32,2, 30.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,357719152,2,45,2, 30.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,109393292,2,149,2, 30.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,54,418125983,2,362,2, 30.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,358751672,7,181,2, 30.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,282599295,4,325,2, 30.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,94715990,6,411,2, 31.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,17,127918587,3,9,2, 31.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,291653525,8,13,2, 31.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,306928356,3,317,2, 31.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,215743932,0,450,2, 31.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,146281797,0,489,2, 31.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,224478822,2,148,2, 31.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,219131727,3,453,2, 32.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,360009812,8,292,2, 32.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,150555655,1,152,2, 32.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,385733919,6,134,2, 32.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,222531385,7,53,2, 33.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,22,212379546,3,427,2, 33.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,352794091,5,430,2, 33.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,29777566,6,109,2, 33.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,32,161547674,0,342,2, 33.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,162980999,7,197,2, 33.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,1745250,4,200,2, 34.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,21,238231361,4,279,2, 34.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,201484438,0,32,2, 34.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,368241711,8,140,2, 34.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,81611528,0,385,2, 34.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,112819583,7,124,2, 35.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,30,424222306,8,208,2, 35.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,1943738,8,79,2, 36.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,14,389148864,1,244,2, 36.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,366304544,5,222,2, 36.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,29,408009128,0,184,2, 36.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,105294373,2,350,2, 36.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,243591934,8,257,2, 36.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,392353471,2,297,2, 37.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,162814876,8,322,2, 37.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,52668425,5,98,2, 37.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,8,240285900,7,310,2, 37.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,291972848,4,226,2, 37.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,148171067,1,260,2, 37.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,2, 37.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,2, 38.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,323969502,4,479,2, 38.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,27,152607205,4,419,2, 38.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,21185091,6,301,2, 38.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,225616342,3,119,2, 38.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,312103822,7,375,2, 39.30);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,986103,7,460,2, 39.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,413602655,4,272,2, 39.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,148739669,5,185,2, 40.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,53,137709482,5,207,2, 40.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,11,152000542,8,89,2, 40.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,281620715,3,146,2, 40.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,22,431731035,2,84,2, 40.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,16,87859333,3,337,2, 40.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,2, 41.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,392769798,8,72,2, 41.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,131039705,4,214,2, 41.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,29,151040077,3,211,2, 41.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,212415609,0,291,2, 41.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,20,305117207,0,117,2, 41.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,369692311,6,303,2, 42.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,23,385646699,4,128,2, 42.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,26909131,2,5,2, 42.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,37,133297860,7,232,2, 42.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,144355070,7,38,2, 42.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,10,256786009,3,43,2, 42.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,7,89940236,1,340,2, 42.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,72462928,6,486,2, 42.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,227768696,8,341,2, 42.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,311520744,1,409,2, 43.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,6,74138712,7,175,2, 43.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,260070721,1,135,2, 43.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,2,266654565,3,199,2, 43.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,224859865,0,122,2, 43.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,15325457,2,435,2, 43.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,307348526,2,374,2, 43.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,70289877,3,415,2, 43.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,81050224,0,105,2, 44.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,346855259,7,31,2, 44.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,3,310867983,7,110,2, 44.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,217545867,5,196,2, 44.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,21,246458063,1,213,2, 44.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,76,177198655,5,228,2, 44.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,267312285,4,205,2, 45.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,334786253,4,1,2, 45.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,30,385276988,1,355,2, 45.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,106124891,2,150,2, 46.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,9,219971673,3,64,2, 46.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,161410091,6,256,2, 47.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,146124300,0,287,2, 47.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,118676303,3,270,2, 48.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,174214808,0,224,2, 48.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,270864881,8,282,2, 48.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,357559117,0,100,2, 49.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,287612561,3,192,2, 49.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,114263257,8,275,2, 49.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,345163727,2,142,2, 50.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,419927856,3,432,2, 50.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,37,431398026,8,451,2, 50.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,75,217989140,8,4,2, 50.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,26,218769841,2,80,2, 50.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,13,400129089,6,54,2, 51.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,199169029,0,201,2, 51.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,299247041,8,299,2, 51.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,309470210,6,10,2, 51.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,330794984,6,421,2, 51.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,15,146926500,1,191,2, 52.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,21,414322296,5,346,2, 52.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,62,429625044,8,202,2, 52.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,271352669,7,429,2, 52.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,42191114,8,258,2, 52.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,335655953,1,357,2, 52.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,75,167859094,0,67,2, 52.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,246690806,8,359,2, 52.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,7,82065030,7,406,2, 52.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,31,208066282,8,314,2, 52.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,23,431262421,3,143,2, 52.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,4,203580474,6,306,2, 52.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,2,288432203,8,304,2, 53.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,26894291,6,410,2, 53.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,364294952,0,248,2, 53.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,329523173,7,153,2, 53.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,137080671,2,299,2, 53.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,42648609,2,169,2, 53.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,13,363352649,6,58,2, 54.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,27,59226760,2,8,2, 54.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,255674929,0,237,2, 54.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,53,359745287,4,448,2, 55.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,8,295739455,5,444,2, 55.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,281590938,4,441,2, 55.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,138946166,1,423,2, 55.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,24,44294555,7,495,2, 55.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,3,339616064,3,243,2, 55.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,5,4342689,0,498,2, 56.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,43,339550311,0,280,2, 56.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,224479925,1,216,2, 56.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,348964389,5,70,2, 57.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,332447931,6,246,2, 57.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,278566345,2,29,2, 57.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,26,268004601,2,373,2, 57.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,334808963,7,343,2, 57.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,293237279,2,357,2, 57.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,25,345398841,1,393,2, 58.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,250891,7,196,2, 58.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,77072861,2,184,2, 58.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,64421435,4,311,2, 58.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,276689922,1,127,2, 59.28);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,78,37430685,3,41,2, 59.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,108994701,7,391,2, 59.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,428795214,8,323,2, 59.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,212102682,8,414,2, 59.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,618414,1,325,2, 59.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,20,336215247,8,51,2, 59.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,14,321871849,5,312,2, 60.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,229671622,6,271,2, 60.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,190517389,6,33,2, 60.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,278129049,7,319,2, 61.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,263560669,1,250,2, 61.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,10,98305027,8,288,2, 61.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,281833930,4,251,2, 61.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,133151725,5,330,2, 61.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,396397360,6,69,2, 61.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,392493434,6,117,2, 61.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,8106488,5,396,2, 61.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,253070359,2,77,2, 61.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,105980628,7,496,2, 61.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,19477901,5,467,2, 62.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,314216724,3,17,2, 62.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,239350397,1,469,2, 62.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,331149281,0,95,2, 62.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,147450401,4,189,2, 62.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,147843646,4,413,2, 62.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,4,11857381,6,240,2, 63.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,297614839,1,26,2, 63.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,152281312,7,404,2, 63.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,410502527,1,132,2, 63.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,16293719,0,401,2, 63.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,377416799,7,172,2, 63.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,391415384,0,352,2, 63.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,139042757,5,242,2, 64.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,409960,1,258,2, 64.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,404814467,0,408,2, 64.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,325666566,1,71,2, 64.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,119892528,3,449,2, 65.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,314912566,5,178,2, 65.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,92658814,4,315,2, 65.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,213259093,0,116,2, 65.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,392611601,1,407,2, 65.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,46291348,4,296,2, 65.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,18,57900118,8,190,2, 65.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,14,205133509,6,271,2, 66.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,119535816,0,319,2, 66.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,81820336,2,107,2, 66.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,135836582,4,316,2, 66.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,397364750,0,265,2, 66.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,27,423757034,6,2,2, 66.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,369267539,0,46,2, 67.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,114157983,3,338,2, 67.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,225836084,3,474,2, 67.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,188340066,0,283,2, 67.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,41,372887850,4,463,2, 67.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,4845451,3,304,2, 67.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,103691016,8,290,2, 67.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,237416846,0,285,2, 67.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,24,147091146,5,349,2, 68.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,7,68350421,7,403,2, 68.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,309944323,0,174,2, 68.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,156922631,8,179,2, 68.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,373891103,1,351,2, 68.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,431014199,6,193,2, 68.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,162401264,7,147,2, 68.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,29,6399999,8,477,2, 69.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,402884846,7,286,2, 69.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,383975196,8,345,2, 69.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,214266971,7,209,2, 69.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,5,178152679,3,459,2, 69.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,86,273638774,5,404,2, 69.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,409112000,2,289,2, 69.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,34,94832614,5,244,2, 69.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,21,229048319,3,333,2, 70.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,233072312,0,93,2, 70.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,31,176000826,7,109,2, 70.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,5,60980709,5,468,2, 70.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,31879157,7,213,2, 70.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,342928300,2,97,2, 70.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,53087598,4,238,2, 70.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,184481231,5,392,2, 71.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,10,174663174,0,168,2, 71.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,60842821,8,210,2, 71.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,10,343698402,2,450,2, 71.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,284146067,6,36,2, 71.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,193473237,0,324,2, 71.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,103068840,0,14,2, 71.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,26116054,4,461,2, 72.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,412424527,7,87,2, 72.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,433900313,3,176,2, 72.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,171793285,4,434,2, 72.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,358212114,6,264,2, 73.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,366490642,2,500,2, 73.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,17,297509693,5,18,2, 73.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,16,85495902,8,471,2, 74.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,246783691,6,199,2, 74.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,215478290,0,334,2, 74.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,174308602,8,360,2, 74.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,26,327147720,5,67,2, 75.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,332622562,7,388,2, 75.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,1,157848874,4,462,2, 75.63);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,291023771,6,433,2, 75.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,296326411,6,170,2, 76.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,9758400,2,162,2, 76.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,282349288,4,125,2, 76.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,261110475,7,62,2, 76.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,342936889,2,499,2, 76.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,10,11718435,5,182,2, 77.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,49466611,4,367,2, 77.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,95,59534795,8,51,2, 77.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,278600126,8,386,2, 77.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,245051338,3,6,2, 77.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,333716289,1,426,2, 77.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,8,123157329,3,424,2, 77.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,181371673,7,187,2, 78.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,149514305,8,86,2, 78.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,14065564,1,269,2, 79.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,254359402,7,326,2, 79.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,364578650,6,138,2, 79.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,142177674,8,308,2, 79.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,7,375479909,2,418,2, 79.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,120862725,7,28,2, 79.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,101854984,2,402,2, 80.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,120831779,6,230,2, 80.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,78358192,0,491,2, 80.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,26,22728113,7,151,2, 80.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,178985163,4,466,2, 80.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,4,92481500,3,91,2, 80.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,362325544,4,135,2, 81.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,143117142,6,245,2, 81.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,105180630,1,372,2, 81.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,51824800,2,364,2, 81.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,172434281,2,82,2, 81.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,20,31767518,3,277,2, 81.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,221373266,8,30,2, 81.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,115774292,1,294,2, 81.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,12,424343051,0,280,2, 82.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,359816688,8,417,2, 82.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,393292023,4,456,2, 82.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,29358466,0,180,2, 82.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,99,272266794,3,227,2, 82.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,238033050,3,370,2, 82.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,82,198969482,2,488,2, 83.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,9,254037645,1,158,2, 83.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,137736540,3,99,2, 83.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,253294089,0,129,2, 83.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,97217528,8,436,2, 83.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,179093455,3,249,2, 83.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,132822257,7,458,2, 84.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,26,22728113,7,151,4, 0.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,13,363352649,6,58,4, 1.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,133151725,5,330,4, 1.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,423138683,5,96,4, 8.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,3,398389701,8,106,4, 9.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,179093455,3,249,4, 9.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,12481557,1,41,4, 13.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,143928549,0,431,4, 13.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,4,276108961,3,137,4, 14.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,329711671,1,339,4, 16.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,3,239890161,3,194,4, 16.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,296604792,5,465,4, 16.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,4, 17.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,401129052,2,440,4, 18.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,71822855,0,15,4, 18.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,16293719,0,401,4, 22.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,26,268004601,2,373,4, 23.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,357659616,8,2,4, 24.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,148171067,1,260,4, 24.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,157574169,5,127,4, 25.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,16,131349549,7,165,4, 27.31);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,618414,1,325,4, 27.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,319852908,3,336,4, 27.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,278600126,8,386,4, 28.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,25,293238749,6,274,4, 29.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,202584093,3,363,4, 29.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,321331703,6,163,4, 29.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,68545428,5,20,4, 30.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,309944323,0,174,4, 31.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,329070445,1,62,4, 34.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,363715579,2,332,4, 35.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,103691016,8,290,4, 35.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,23,385646699,4,128,4, 39.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,10676972,4,302,4, 43.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,222583938,1,220,4, 44.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,225616342,3,119,4, 44.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,402204855,1,203,4, 45.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,30,385276988,1,355,4, 46.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,159959225,1,446,4, 46.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,16,400575456,1,483,4, 48.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,2,282169851,5,283,4, 48.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,106703716,7,295,4, 49.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,30,163904238,3,361,4, 49.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,314912566,5,178,4, 49.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,27027541,4,221,4, 50.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,315515906,2,312,4, 51.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,392611601,1,407,4, 51.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,187511463,1,300,4, 52.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,42648609,2,169,4, 53.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,6,74138712,7,175,4, 54.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,413602655,4,272,4, 54.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,29,151040077,3,211,4, 54.68);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,281590938,4,441,4, 55.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,38,14429544,3,22,4, 56.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,71561595,5,439,4, 56.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,14065564,1,269,4, 56.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,148739669,5,185,4, 56.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,103068840,0,14,4, 60.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,334786253,4,1,4, 61.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,15,141758207,5,335,4, 61.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,152281312,7,404,4, 63.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,172434281,2,82,4, 63.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,227768696,8,341,4, 64.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,262817224,4,255,4, 68.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,22,427367751,7,492,4, 68.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,297332461,0,409,4, 72.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,7374585,5,358,4, 73.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,13,400129089,6,54,4, 73.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,392769798,8,72,4, 73.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,371571641,5,273,4, 76.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,188340066,0,283,1, 0.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,363715579,2,332,1, 1.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,19174386,8,395,1, 3.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,291653525,8,13,1, 3.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,5,178152679,3,459,1, 4.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,364294952,0,248,1, 4.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,226031949,6,261,1, 6.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,402464325,6,88,1, 7.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,17,127918587,3,9,1, 8.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,299247041,8,299,1, 8.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,158562267,0,136,1, 10.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,197457840,4,254,1, 11.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,352794091,5,430,1, 14.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,19183183,7,83,1, 14.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,291972848,4,226,1, 14.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,253070359,2,77,1, 14.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,31,208066282,8,314,1, 14.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,162814876,8,322,1, 15.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,95,59534795,8,51,1, 16.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,325666566,1,71,1, 17.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,372106632,3,422,1, 17.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,109408088,5,231,1, 18.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,23691884,8,445,1, 18.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,5446986,4,102,1, 19.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,284146067,6,36,1, 20.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,323404707,5,155,1, 21.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,75,167859094,0,67,1, 21.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,1745250,4,200,1, 21.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,7374585,5,358,1, 22.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,48,320009446,0,452,1, 23.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,7,89940236,1,340,1, 23.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,25338387,5,497,1, 28.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,1,157848874,4,462,1, 28.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,404307387,8,145,1, 29.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,161410091,6,256,1, 29.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,146281797,0,489,1, 31.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,1, 33.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,187035200,8,472,1, 33.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,433631717,7,457,1, 33.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,339694786,1,384,1, 37.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,99943025,7,88,1, 37.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,280523875,6,390,1, 38.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,314354173,0,160,1, 38.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,4,414448303,0,328,1, 39.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,329523173,7,153,1, 41.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,428795214,8,323,1, 41.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,116265008,4,381,1, 41.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,281620715,3,146,1, 42.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,6,74138712,7,175,1, 42.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,18,57900118,8,190,1, 44.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,257282600,5,134,1, 44.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,135452660,5,159,1, 45.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,71822855,0,15,1, 46.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,348850672,0,48,1, 46.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,42648609,2,169,1, 47.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,263560669,1,250,1, 48.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,53,359745287,4,448,1, 49.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,394713802,7,254,1, 51.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,305145937,8,369,1, 52.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,7,82065030,7,406,1, 52.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,343680986,0,101,1, 52.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,21,238231361,4,279,1, 52.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,15,341282703,8,484,1, 53.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,4,92481500,3,91,1, 53.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,26,327147720,5,67,1, 54.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,323969502,4,479,1, 55.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,49466611,4,367,1, 58.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,10,256786009,3,43,1, 58.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,392769798,8,72,1, 58.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,1, 60.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,173005519,6,442,1, 60.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,127838726,4,323,1, 61.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,22,431731035,2,84,1, 61.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,21,246458063,1,213,1, 63.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,357559117,0,100,1, 65.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,24,386436835,3,239,1, 66.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,180159338,8,437,1, 66.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,15822670,1,104,1, 66.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,371047745,5,379,1, 66.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,278566345,2,29,1, 67.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,397059706,0,11,1, 67.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,219131727,3,453,1, 69.33);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,146565516,7,225,1, 69.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,224859865,0,122,1, 70.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,89746065,5,12,1, 70.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,188542592,6,425,1, 71.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,99457920,7,47,1, 72.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,332447931,6,246,1, 72.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,225616342,3,119,1, 73.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,202584093,3,363,1, 73.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,314912566,5,178,1, 73.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,12481557,1,41,1, 73.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,334808963,7,343,1, 76.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,8106488,5,396,1, 76.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,423488548,1,443,1, 77.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,133151725,5,330,1, 77.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,270864881,8,282,1, 78.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,172434281,2,82,1, 79.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,213259093,0,116,1, 80.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,4,305267511,3,478,1, 81.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,1943738,8,79,1, 83.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,23,227669380,8,473,1, 84.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,8,295739455,5,444,1, 86.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,152303325,3,433,1, 87.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,139042757,5,242,1, 87.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,23,385646699,4,128,1, 88.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,14767465,2,284,1, 89.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,359816688,8,417,1, 93.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,314216724,3,17,1, 93.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,37,431398026,8,451,1, 94.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,125418832,0,112,1, 94.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,332622562,7,388,1, 94.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,193473237,0,324,1, 95.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,384674782,6,344,1, 95.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,117059620,3,438,1, 96.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,78052423,7,428,1, 99.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,5,60980709,5,468,1, 99.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,78,37430685,3,41,1, 101.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,44895790,7,383,1, 101.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,20,305117207,0,117,1, 102.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,146124300,0,287,1, 105.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,77072861,2,184,1, 106.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,119535816,0,319,1, 107.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,347866165,6,380,1, 107.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,31879157,7,213,1, 108.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,138328967,0,489,1, 108.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,14065564,1,269,1, 109.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,239350397,1,469,1, 110.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,26,171859642,0,305,1, 110.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,23,22261025,8,412,1, 111.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,16,106523513,8,463,1, 111.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,178985163,4,466,1, 113.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,14,389148864,1,244,1, 114.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,120862725,7,28,1, 115.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,162401264,7,147,1, 116.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,216061885,6,52,1, 117.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,345939483,1,184,1, 117.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,81061872,8,318,1, 118.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,149514305,8,86,1, 118.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,12,343925259,8,56,1, 119.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,59227932,5,387,1, 120.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,171793285,4,434,1, 120.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,296604792,5,465,1, 121.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,1, 122.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,244883880,0,266,1, 123.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,15325457,2,435,1, 123.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,278629263,4,176,1, 123.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,1,430754320,4,44,1, 123.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,404814467,0,408,1, 124.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,346098925,3,157,1, 124.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,75,217989140,8,4,1, 125.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,212415609,0,291,1, 125.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,423138683,5,96,1, 126.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,72462928,6,486,1, 127.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,106703716,7,295,1, 127.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,378367445,2,309,1, 127.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,29,6399999,8,477,1, 128.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,364578650,6,138,1, 129.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,120831779,6,230,1, 130.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,18,432446013,5,263,1, 131.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,143928549,0,431,1, 132.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,13,64146061,0,63,1, 134.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,10,98305027,8,288,1, 134.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,6,211056099,4,487,1, 134.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,41,110763269,6,55,1, 134.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,2,296732505,5,61,1, 135.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,105294373,2,350,1, 135.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,98186070,6,356,1, 135.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,2681146,7,19,1, 135.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,12,278633277,7,177,1, 137.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,78037356,2,278,1, 137.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,378889628,6,366,1, 138.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,70,182514182,1,243,1, 139.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,367385521,2,267,1, 139.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,433900313,3,176,1, 141.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,319852908,3,336,1, 141.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,221373266,8,30,1, 143.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,76,177198655,5,228,1, 143.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,26,268004601,2,373,1, 145.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,306928356,3,317,1, 145.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,162980999,7,197,1, 146.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,383975196,8,345,1, 146.70);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,262817224,4,255,1, 149.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,401129052,2,440,1, 150.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,81611528,0,385,1, 150.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,402884846,7,286,1, 152.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,392493434,6,117,1, 153.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,187511463,1,300,1, 155.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,97,370200553,7,475,1, 155.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,147450401,4,189,1, 156.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,53087598,4,238,1, 156.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,118676303,3,270,1, 158.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,229671622,6,271,1, 158.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,53306245,5,371,1, 158.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,50046444,8,198,1, 161.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,29,151040077,3,211,1, 162.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,391415384,0,352,1, 162.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,179093455,3,249,1, 163.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,271203609,8,394,1, 164.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,16293719,0,401,1, 165.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,328901157,0,23,1, 166.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,131039705,4,214,1, 169.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,364721267,5,56,1, 171.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,17,157574169,5,127,1, 171.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,22,300804522,7,420,1, 173.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,4,203580474,6,306,1, 176.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,26894291,6,410,1, 176.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,224479925,1,216,1, 177.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,3,239890161,3,194,1, 177.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,201484438,0,32,1, 177.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,330794984,6,421,1, 178.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,312103822,7,375,1, 179.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,184481231,5,392,1, 179.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,30,403521640,1,108,1, 181.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,8,240285900,7,310,1, 182.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,294600697,0,268,1, 182.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,2,266654565,3,199,1, 182.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,55,161995280,8,472,1, 183.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,21185091,6,301,1, 183.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,238033050,3,370,1, 185.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,26,256236972,0,173,1, 188.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,215478290,0,334,1, 189.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,174308602,8,360,1, 190.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,18,16955469,7,259,1, 190.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,115584880,1,161,1, 192.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,229504949,1,133,1, 192.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,17,297509693,5,18,1, 193.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,346855259,7,31,1, 194.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,81820336,2,107,1, 195.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,359147377,3,34,1, 195.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,12457207,6,464,1, 196.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,42191114,8,258,1, 196.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,96295332,5,115,1, 197.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,3,339616064,3,243,1, 198.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,60336965,5,116,1, 198.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,141446647,6,447,1, 198.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,2,288432203,8,304,1, 199.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,217545867,5,196,1, 200.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,152281312,7,404,1, 201.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,41,372887850,4,463,1, 201.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,199169029,0,201,1, 201.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,363866700,4,87,1, 201.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,304560641,2,24,1, 202.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,357292155,5,281,1, 203.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,409112000,2,289,1, 204.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,336251546,0,491,1, 205.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,335655953,1,357,1, 205.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,101854984,2,402,1, 206.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,78358192,0,491,1, 206.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,76253486,6,390,1, 207.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,20,336215247,8,51,1, 207.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,319089332,7,494,1, 209.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,357659616,8,2,1, 209.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,412461021,7,481,1, 210.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,38,14429544,3,22,1, 211.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,321020135,5,326,1, 211.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,311520744,1,409,1, 213.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,79061444,1,329,1, 213.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,239033258,0,329,1, 214.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,267312285,4,205,1, 215.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,12,403377721,3,368,1, 216.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,250891,7,196,1, 216.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,29777566,6,109,1, 216.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,29,353286653,8,360,1, 217.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,143117142,6,245,1, 217.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,377416799,7,172,1, 218.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,233072312,0,93,1, 218.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,297332461,0,409,1, 218.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,222531385,7,53,1, 218.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,246783691,6,199,1, 222.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,23,139584117,0,31,1, 222.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,397364750,0,265,1, 222.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,25574239,0,480,1, 227.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,278539794,3,416,1, 228.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,15,141758207,5,335,1, 229.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,27,423757034,6,2,1, 230.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,28,284779153,0,215,1, 231.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,282349288,4,125,1, 232.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,369267539,0,46,1, 235.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,374955132,8,121,1, 235.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,11,373602010,6,236,1, 235.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,222583938,1,220,1, 236.54);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,360538154,8,204,1, 236.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,373415894,7,186,1, 236.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,145805591,2,397,1, 237.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,358212114,6,264,1, 238.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,65,241144408,8,252,1, 239.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,2,16015656,0,307,1, 242.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,409960,1,258,1, 242.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,2,282169851,5,283,1, 243.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,16,85495902,8,471,1, 244.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,255503693,6,60,1, 244.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,431014199,6,193,1, 247.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,26,22728113,7,151,1, 247.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,290489730,3,293,1, 247.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,15769960,4,118,1, 248.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,360009812,8,292,1, 249.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,51,390258408,6,32,1, 251.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,125219232,8,85,1, 252.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,340618593,1,247,1, 255.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,14118439,3,454,1, 257.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,81,14949625,3,493,1, 257.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,148171067,1,260,1, 257.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,260070721,1,135,1, 257.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,24048895,8,76,1, 260.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,211747031,3,123,1, 261.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,25081812,0,373,1, 261.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,249749655,5,35,1, 261.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,255674929,0,237,1, 262.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,54,418125983,2,362,1, 263.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,348334224,2,234,1, 263.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,6,193291495,2,282,1, 264.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,329711671,1,339,1, 265.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,43,339550311,0,280,1, 266.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,106124891,2,150,1, 268.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,371571641,5,273,1, 268.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,237416846,0,285,1, 268.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,342928300,2,97,1, 268.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,52668425,5,98,1, 268.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,16,87859333,3,337,1, 270.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,394141331,1,164,2, 0.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,4,203580474,6,306,2, 0.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,28,211747031,3,123,2, 1.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,30,163904238,3,361,2, 2.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,229504949,1,133,2, 7.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,107717060,1,40,2, 12.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,315515906,2,312,2, 13.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,362325544,4,135,2, 13.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,60756551,5,195,2, 16.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,11,242717839,5,37,2, 16.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,5,986103,7,460,2, 17.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,14,389148864,1,244,2, 21.87);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,392611601,1,407,2, 26.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,9,109042865,5,122,2, 30.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,187035200,8,472,2, 31.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,15,341282703,8,484,2, 33.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,76,177198655,5,228,2, 34.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,227768696,8,341,2, 34.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,323404707,5,155,2, 34.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,156922631,8,179,2, 36.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,105294373,2,350,2, 36.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,8,240285900,7,310,2, 38.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,7,15822670,1,104,2, 40.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,42648609,2,169,2, 43.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,271203609,8,394,2, 44.47);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,4,276108961,3,137,2, 45.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,138328967,0,489,2, 45.56);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,229671622,6,271,2, 46.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,364294952,0,248,2, 47.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,65,241144408,8,252,2, 47.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,15140549,8,331,2, 47.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,95,292608330,5,476,2, 47.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,68,81705121,3,81,2, 47.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,158562267,0,136,2, 49.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,237416846,0,285,2, 50.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,23,431262421,3,143,2, 51.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,5446986,4,102,2, 52.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,369692311,6,303,2, 53.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,7,168215886,1,156,2, 57.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,167691573,0,253,2, 64.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,2,288432203,8,304,2, 64.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,58862980,2,114,2, 64.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,363715579,2,332,2, 65.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,301678419,2,75,2, 65.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,26894291,6,410,2, 65.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,273600731,3,50,2, 66.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,49,364941217,4,139,2, 66.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,304560641,2,24,2, 68.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,44,77072861,2,184,2, 70.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,292888275,0,49,2, 70.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,7,82065030,7,406,2, 71.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,35,357719152,2,45,2, 72.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,30,403521640,1,108,2, 74.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,20,336215247,8,51,2, 74.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,21568237,3,39,2, 76.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,44895790,7,383,2, 77.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,4,89746065,5,12,2, 78.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,6,423138683,5,96,2, 78.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,15769960,4,118,2, 80.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,27,59226760,2,8,2, 80.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,428795214,8,323,2, 81.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,3,334786253,4,1,2, 81.68);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,299247041,8,299,2, 82.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,16,106523513,8,463,2, 83.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,224479925,1,216,2, 85.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,196779169,8,81,2, 86.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,105980628,7,496,2, 86.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,224478822,2,148,2, 87.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,311520744,1,409,2, 91.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,226031949,6,261,2, 91.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,332447931,6,246,2, 97.24);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,284810999,8,144,2, 97.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,256686740,6,188,2, 97.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,24,386436835,3,239,2, 99.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,329523173,7,153,2, 99.92);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,307348526,2,374,2, 104.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,16,265011678,0,15,2, 104.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,184481231,5,392,2, 104.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,314216724,3,17,2, 104.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,11,152000542,8,89,2, 105.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,47,402884846,7,286,2, 108.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,142177674,8,308,2, 111.63);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,13,400129089,6,54,2, 117.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,78052423,7,428,2, 118.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,12,343925259,8,56,2, 118.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,312081481,6,400,2, 118.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,216061885,6,52,2, 119.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,9,219971673,3,64,2, 120.32);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,119535816,0,319,2, 124.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,305145937,8,369,2, 125.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,71822855,0,15,2, 128.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,10,397364750,0,265,2, 128.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,33,392493434,6,117,2, 131.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,21,414322296,5,346,2, 132.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,23,227669380,8,473,2, 138.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,385733919,6,134,2, 148.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,9,59256727,5,339,2, 149.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,26,209234587,8,455,2, 150.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,7,269069867,2,218,2, 151.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,38,137080671,2,299,2, 151.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,81820336,2,107,2, 152.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,348964389,5,70,2, 158.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,52,81050224,0,105,2, 161.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,34,270864881,8,282,2, 161.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,138946166,1,423,2, 163.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,215743932,0,450,2, 167.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,170063359,2,70,2, 168.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,41,110763269,6,55,2, 169.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,88,92658814,4,315,2, 170.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,21,229048319,3,333,2, 170.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,3,310867983,7,110,2, 175.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,23691884,8,445,2, 177.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,78358192,0,491,2, 178.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,148171067,1,260,2, 180.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,336371340,0,298,2, 182.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,19174386,8,395,2, 194.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,291023771,6,433,2, 194.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,10676972,4,302,2, 194.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,250891,7,196,2, 196.50);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,89,148739669,5,185,2, 197.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,309944323,0,174,2, 198.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,373891103,1,351,2, 198.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,357559117,0,100,2, 199.52);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,377416799,7,172,2, 199.79);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,26,327147720,5,67,2, 200.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,392353471,2,297,2, 201.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,330794984,6,421,2, 202.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,255503693,6,60,2, 202.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,50,267909423,3,382,2, 202.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,3,198474553,7,376,2, 204.07);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,391415384,0,352,2, 204.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,112819583,7,124,2, 207.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,89644267,0,7,2, 209.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,46,193473237,0,324,2, 211.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,39,339694786,1,384,2, 225.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,296604792,5,465,2, 225.83);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,2,16015656,0,307,2, 225.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,255958283,5,485,2, 227.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,28,284779153,0,215,2, 228.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,12,278633277,7,177,2, 237.19);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,162401264,7,147,2, 237.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,29,408009128,0,184,2, 237.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,373415894,7,186,2, 238.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,289928323,8,223,2, 241.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,412461021,7,481,2, 248.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,6,74138712,7,175,2, 250.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,22,212379546,3,427,2, 253.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,14118439,3,454,2, 257.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,261110475,7,62,2, 258.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,224859865,0,122,2, 264.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,394713802,7,254,2, 266.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,32,408421578,4,482,2, 267.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,10,174663174,0,168,2, 269.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,96295332,5,115,2, 270.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,321020135,5,326,2, 270.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,32,161547674,0,342,2, 270.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,24,323969502,4,479,2, 271.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,49,246690806,8,359,2, 272.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,24,308764588,8,446,2, 272.97);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,22,431731035,2,84,2, 291.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,2,152303325,3,433,2, 292.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,72462928,6,486,2, 292.10);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,15,141758207,5,335,2, 292.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,143928549,0,431,2, 293.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,20,31767518,3,277,2, 293.61);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,48,88442466,4,92,2, 294.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,328901157,0,23,2, 296.08);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,6,181371673,7,187,2, 298.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,15,101854984,2,402,2, 301.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,290489730,3,293,2, 301.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,306928356,3,317,2, 303.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,14,205133509,6,271,2, 307.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,345163727,2,142,2, 308.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,119892528,3,449,2, 310.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,14,94265006,2,74,2, 317.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,83,78037356,2,278,2, 317.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,348334224,2,234,2, 321.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,55,161995280,8,472,2, 323.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,120831779,6,230,2, 324.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,253294089,0,129,2, 329.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,108994701,7,391,2, 330.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,2,304599744,5,25,2, 330.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,14,321871849,5,312,2, 331.22);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 623,5,252881626,2,233,2, 331.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,120862725,7,28,2, 337.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,70289877,3,415,2, 337.77);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,37,133297860,7,232,2, 337.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,7,147843646,4,413,2, 340.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,61,152281312,7,404,2, 343.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,346098925,3,157,2, 345.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,39,319852908,3,336,2, 347.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,173005519,6,442,2, 348.40);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,26,171859642,0,305,2, 348.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,26909131,2,5,2, 355.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,287612561,3,192,2, 356.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,174214808,0,224,2, 357.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,7,194158634,6,113,2, 359.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,212415609,0,291,2, 359.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,5,246783691,6,199,2, 360.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,5,109408088,5,231,2, 364.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,115584880,1,161,2, 364.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,366988259,2,57,2, 365.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,7,375479909,2,418,2, 366.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,45,222583938,1,220,2, 367.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,27,152607205,4,419,2, 370.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,8,295739455,5,444,2, 370.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,71561595,5,439,2, 370.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,291653525,8,13,2, 372.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,2,12457207,6,464,2, 373.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,19183183,7,83,2, 374.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,335655953,1,357,2, 374.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,20,311248511,4,321,2, 375.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,172434281,2,82,2, 377.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,1,103068840,0,14,2, 379.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,23,385646699,4,128,2, 381.15);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,23,22261025,8,412,2, 387.44);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,257406629,2,126,2, 389.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,32,146565516,7,225,2, 391.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,419927856,3,432,2, 392.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,281590938,4,441,2, 393.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,22,4845451,3,304,2, 393.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,357659616,8,2,2, 394.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,90,203988788,6,130,2, 395.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,18,16955469,7,259,2, 395.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,53306245,5,371,2, 396.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,59,297614839,1,26,2, 399.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,8,123157329,3,424,2, 400.33);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,46,214266971,7,209,2, 406.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,150555655,1,152,2, 407.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,278566345,2,29,2, 408.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,67,197457840,4,254,2, 409.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,139042757,5,242,2, 409.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,244883880,0,266,2, 412.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,1,433900313,3,176,2, 416.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,5,162814876,8,322,2, 417.96);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,137736540,3,99,2, 419.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,63,198413933,8,217,2, 420.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,8,145805591,2,397,2, 421.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,97,370200553,7,475,2, 427.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,187511463,1,300,2, 427.93);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,64,41274465,6,291,2, 428.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,21,238231361,4,279,2, 428.67);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,3,339616064,3,243,2, 429.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,233072312,0,93,2, 429.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,312103822,7,375,2, 430.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,392769798,8,72,2, 433.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,25,293238749,6,274,2, 434.82);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,378367445,2,309,2, 436.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,31,49466611,4,367,2, 437.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,21,212102682,8,414,2, 438.54);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,58,106703716,7,295,2, 438.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,96,140698307,8,107,2, 439.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,25,336251546,0,491,2, 440.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,171793285,4,434,2, 441.16);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,79,357292155,5,281,2, 441.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,16,217545867,5,196,2, 443.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,1,424527622,3,16,2, 443.91);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,16,85495902,8,471,2, 451.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,19,319089332,7,494,2, 452.34);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,5,178152679,3,459,2, 460.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,253070359,2,77,2, 463.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,1,430754320,4,44,2, 463.85);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,26,15325457,2,435,2, 634.60);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,343680986,0,101,2, 635.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,96562416,8,484,2, 641.04);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,342928300,2,97,2, 641.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,29,353286653,8,360,2, 641.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,18,57900118,8,190,2, 643.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,18,431014199,6,193,2, 645.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,340618593,1,247,2, 645.23);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,295186051,0,77,2, 645.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,16,374955132,8,121,2, 646.84);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,12,203989772,8,65,2, 647.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,71,332346818,0,3,2, 650.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,48,320009446,0,452,2, 650.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,6,264454988,2,241,2, 652.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,37,431398026,8,451,2, 652.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,383463676,0,59,2, 656.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,404307387,8,145,2, 657.13);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,2,396397360,6,69,2, 660.10);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,82,198969482,2,488,2, 660.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,42,385435512,4,378,2, 661.73);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,31,1745250,4,200,2, 663.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,199169029,0,201,2, 663.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,367385521,2,267,2, 664.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,346855259,7,31,2, 668.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,24,44294555,7,495,2, 669.99);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,16,347866165,6,380,2, 673.14);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,22,278600126,8,386,2, 673.27);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,6,68545428,5,20,2, 674.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,308188397,7,21,2, 675.46);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,133151725,5,330,2, 676.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,59227932,5,387,2, 677.55);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,21,260070721,1,135,2, 680.69);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,19,14767465,2,284,2, 681.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,72,31879157,7,213,2, 682.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 655,4,267269132,5,327,2, 684.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,20,334808963,7,343,2, 684.74);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,25,219131727,3,453,2, 687.28);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,34,358212114,6,264,2, 692.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,25,345398841,1,393,2, 695.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,28,364721267,5,56,2, 697.06);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,29358466,0,180,2, 697.18);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,27,117059620,3,438,2, 697.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,8,12481557,1,41,2, 704.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,57,618414,1,325,2, 708.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,45,262817224,4,255,2, 709.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,10,98305027,8,288,2, 713.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,35,99457920,7,47,2, 715.86);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,102,118676303,3,270,2, 717.41);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,24048895,8,76,2, 717.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,47,132822257,7,458,2, 720.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,17,284146067,6,36,2, 724.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,342936889,2,499,2, 726.26);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,28,280523875,6,390,2, 727.64);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,77,222531385,7,53,2, 728.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,44,16293719,0,401,2, 729.95);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,9,52668425,5,98,2, 730.48);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,19477901,5,467,2, 734.68);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,40,125219232,8,85,2, 735.01);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,19,60336965,5,116,2, 736.25);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,94,94715990,6,411,2, 742.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,18,146124300,0,287,2, 742.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,1,127838726,4,323,2, 743.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,2,201484438,0,32,2, 743.51);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,262245541,4,111,2, 743.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,1,233342431,4,295,2, 744.20);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,40,296326411,6,170,2, 747.90);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,239350397,1,469,2, 748.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,43,141446647,6,447,2, 748.88);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,13,53087598,4,238,2, 750.58);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,85,368241711,8,140,2, 751.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,98,42191114,8,258,2, 751.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,11,373602010,6,236,2, 753.43);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,80,181763720,5,241,2, 760.17);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,14,364578650,6,138,2, 763.12);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,42,116265008,4,381,2, 763.36);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,54,418125983,2,362,2, 770.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,25,178985163,4,466,2, 777.35);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,50,9758400,2,162,2, 784.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,8,179093455,3,249,2, 786.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,15,269295123,4,405,2, 788.29);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,31,208066282,8,314,2, 789.70);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,20,245051338,3,6,2, 791.05);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,5,371047745,5,379,2, 798.39);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,22,76253486,6,390,2, 800.72);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,11,383975196,8,345,2, 802.02);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,20,271352669,7,429,2, 802.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,78,37430685,3,41,2, 804.94);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,60,360009812,8,292,2, 805.85);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,6,193291495,2,282,2, 806.75);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,75,217989140,8,4,2, 814.03);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,4,348850672,0,48,2, 814.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,14,225836084,3,474,2, 815.71);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,41,288165031,8,166,2, 815.80);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,3,402204855,1,203,2, 815.81);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,4,413602655,4,272,2, 817.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,12,188542592,6,425,2, 818.11);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,4,414448303,0,328,2, 820.76);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,174308602,8,360,2, 821.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,11,291972848,4,226,2, 822.66);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,13,45021305,5,353,2, 826.05);



INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,2,409112000,2,289,2, 827.00);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,3,435450952,5,90,2, 829.09);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,74,95028093,8,219,2, 835.21);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 33,29,267312285,4,205,2, 837.37);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 237,3,215637901,0,262,2, 843.78);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,36,393292023,4,456,2, 844.38);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 247,29,366490642,2,500,2, 844.89);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,10,11718435,5,182,2, 845.42);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,70,182514182,1,243,2, 845.59);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,92,221373266,8,30,2, 846.53);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,8,310329511,7,94,2, 848.57);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 399,19,343019537,2,42,2, 852.45);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,66,161410091,6,256,2, 855.62);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,73,372106632,3,422,2, 855.98);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,7,57689792,4,396,2, 856.49);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 1,26,268004601,2,373,2, 858.30);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 104,93,257282600,5,134,2, 859.65);
INSERT INTO cliente_transacoes (id, banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito,cliente_numero,tipo_transacao_id,valor) VALUES (SQ_CLIENTE_TRANSACOES.NEXTVAL, 477,12,188340066,0,283,2, 859.85);



SELECT NUMERO, NOME FROM BANCO;


SELECT BANCO_NUMERO, NUMERO, NOME FROM AGENCIA;


SELECT NUMERO, NOME, EMAIL FROM CLIENTE;


SELECT BANCO_NUMERO, AGENCIA_NUMERO, CLIENTE_NUMERO FROM CLIENTE_TRANSACOES;


--AVG
--COUNT (HAVING)
--MAX
--MIN
--SUM


SELECT AVG(VALOR) FROM CLIENTE_TRANSACOES;


SELECT COUNT(NUMERO) FROM CLIENTE;


SELECT
    COUNT(NUMERO)
   ,EMAIL
  FROM CLIENTE
    WHERE EMAIL LIKE '%@gmail.com'
  GROUP BY EMAIL
;


SELECT MAX(NUMERO) FROM CLIENTE;



SELECT MIN(NUMERO) FROM CLIENTE;


SELECT MAX(VALOR) FROM CLIENTE_TRANSACOES;


SELECT MIN(VALOR) FROM CLIENTE_TRANSACOES;


SELECT
    MAX(VALOR)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
  GROUP BY TIPO_TRANSACAO_ID
;


SELECT
    MIN(VALOR)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
  GROUP BY TIPO_TRANSACAO_ID
;



SELECT
    COUNT(ID)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
    GROUP BY TIPO_TRANSACAO_ID
;


SELECT
    COUNT(ID)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
    GROUP BY TIPO_TRANSACAO_ID
  HAVING COUNT(ID) > 150
;


SELECT SUM(VALOR) FROM CLIENTE_TRANSACOES; 


SELECT 
    SUM(VALOR)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
    GROUP BY TIPO_TRANSACAO_ID
;



SELECT 
    SUM(VALOR)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
    GROUP BY TIPO_TRANSACAO_ID
    ORDER BY TIPO_TRANSACAO_ID ASC
;


SELECT 
    SUM(VALOR)
   ,TIPO_TRANSACAO_ID
  FROM CLIENTE_TRANSACOES
    GROUP BY TIPO_TRANSACAO_ID
    ORDER BY TIPO_TRANSACAO_ID DESC
;


SELECT
    NUMERO
   ,NOME 
  FROM BANCO
;



SELECT
    BANCO_NUMERO
   ,NUMERO
   ,NOME
  FROM AGENCIA
;



SELECT
    NUMERO
   ,NOME
  FROM CLIENTE
;



SELECT
    BANCO_NUMERO
   ,AGENCIA_NUMERO
   ,NUMERO
   ,DIGITO
   ,CLIENTE_NUMERO
  FROM CONTA_CORRENTE
;



SELECT
    BANCO_NUMERO
   ,AGENCIA_NUMERO
   ,CONTA_CORRENTE_NUMERO
   ,CONTA_CORRENTE_DIGITO
   ,CLIENTE_NUMERO
   ,VALOR
  FROM CLIENTE_TRANSACOES
;



SELECT -- 144 BANCOS
    COUNT(1)
  FROM BANCO
;




SELECT -- 269 AGENCIAS
    COUNT(1)
  FROM AGENCIA
;



SELECT
    BANCO.NUMERO
   ,BANCO.NOME
   ,AGENCIA.NUMERO
   ,AGENCIA.NOME
  FROM BANCO
    JOIN AGENCIA
      ON AGENCIA.BANCO_NUMERO = BANCO.NUMERO
;



SELECT
    COUNT(DISTINCT BANCO.NUMERO)
  FROM BANCO
    JOIN AGENCIA
      ON AGENCIA.BANCO_NUMERO = BANCO.NUMERO
;



SELECT
    BANCO.NUMERO
   ,BANCO.NOME
   ,AGENCIA.NUMERO
   ,AGENCIA.NOME
  FROM BANCO
    LEFT JOIN AGENCIA
      ON AGENCIA.BANCO_NUMERO = BANCO.NUMERO
;



SELECT
    AGENCIA.NUMERO
   ,AGENCIA.NOME
   ,BANCO.NUMERO
   ,BANCO.NOME
  FROM AGENCIA
    LEFT JOIN BANCO
      ON BANCO.NUMERO = AGENCIA.BANCO_NUMERO
;



CREATE TABLE TESTE_A (
    ID NUMBER PRIMARY KEY
   ,VALOR VARCHAR(10)
);



CREATE TABLE TESTE_B (
    ID NUMBER PRIMARY KEY
   ,VALOR VARCHAR(10)
);



INSERT INTO TESTE_A (ID, VALOR)
  VALUES (1, 'teste1')
;
INSERT INTO TESTE_A (ID, VALOR)
  VALUES (2, 'teste2')
;
INSERT INTO TESTE_A (ID, VALOR)
  VALUES (3, 'teste3')
;
INSERT INTO TESTE_A (ID, VALOR)
  VALUES (4, 'teste4')
;



INSERT INTO TESTE_B (ID, VALOR)
  VALUES (1, 'teste_a')
;
INSERT INTO TESTE_B (ID, VALOR)
  VALUES (2, 'teste_b')
;
INSERT INTO TESTE_B (ID, VALOR)
  VALUES (3, 'teste_c')
;
INSERT INTO TESTE_B (ID, VALOR)
  VALUES (4, 'teste_d')
;



SELECT
    TBLA.VALOR
   ,TBLB.VALOR
  FROM TESTE_A TBLA
    CROSS JOIN TESTE_B TBLB
;



DROP TABLE TESTE_A;
DROP TABLE TESTE_B;



SELECT
    BAN.NOME
   ,AGE.NOME
   ,CCO.NUMERO
   ,CCO.DIGITO
   ,CLI.NOME
  FROM BANCO BAN
    JOIN AGENCIA AGE
      ON AGE.BANCO_NUMERO = BAN.NUMERO
    JOIN CONTA_CORRENTE CCO
      ON CCO.BANCO_NUMERO = BAN.NUMERO
      AND CCO.AGENCIA_NUMERO = AGE.NUMERO
    JOIN CLIENTE CLI
      ON CLI.NUMERO = CCO.CLIENTE_NUMERO
;


SELECT 
    NUMERO
   ,NOME
  FROM BANCO
;



SELECT
    BANCO_NUMERO
   ,NUMERO
   ,NOME
  FROM AGENCIA
;



WITH TBL_TMP_BANCO AS (
    SELECT
        NUMERO
       ,NOME
      FROM BANCO
)
SELECT
    NUMERO
   ,NOME
  FROM TBL_TMP_BANCO
;



WITH CLIENTE_E_TRANSACOES AS (
    SELECT 
        CLI.NOME    AS CLIENTE_NOME
       ,TTR.NOME    AS TIPO_TRANSACAO_NOME
       ,CTR.VALOR   AS TIPO_TRANSACAO_VALOR
      FROM CLIENTE_TRANSACOES CTR
        JOIN CLIENTE CLI
          ON CLI.NUMERO = CTR.CLIENTE_NUMERO
        JOIN TIPO_TRANSACAO TTR
          ON TTR.ID = CTR.TIPO_TRANSACAO_ID
)
SELECT
    CLIENTE_NOME
   ,TIPO_TRANSACAO_NOME
   ,TIPO_TRANSACAO_VALOR
  FROM CLIENTE_E_TRANSACOES
;



SELECT
    NUMERO
   ,NOME
   ,ATIVO
  FROM BANCO
;



CREATE OR REPLACE VIEW VW_BANCOS AS (
    SELECT
        NUMERO
       ,NOME
       ,ATIVO
      FROM BANCO
);



SELECT * FROM VW_BANCOS;



CREATE OR REPLACE VIEW VW_BANCOS_2 (BANCO_NUMERO, BANCO_NOME, BANCO_ATIVO) AS (
    SELECT
        NUMERO
       ,NOME
       ,ATIVO
      FROM BANCO
);



SELECT * FROM VW_BANCOS_2;



INSERT INTO VW_BANCOS_2 (BANCO_NUMERO, BANCO_NOME, BANCO_ATIVO)
    VALUES (51, 'Banco Boa Ideia', 1)
;



SELECT
    *
  FROM VW_BANCOS_2
  WHERE BANCO_NUMERO = 51
;



UPDATE VW_BANCOS_2 
  SET BANCO_ATIVO = 0 
    WHERE BANCO_NUMERO = 51
;  



SELECT
    *
  FROM VW_BANCOS_2
  WHERE BANCO_NUMERO = 51
;



CREATE OR REPLACE VIEW VW_BANCOS_ATIVOS AS (
    SELECT
        NUMERO
       ,NOME
       ,ATIVO
      FROM BANCO
      WHERE ATIVO = 1
);



SELECT * FROM VW_BANCOS_ATIVOS;


SELECT
    NUMERO
   ,NOME
  FROM BANCO
    ORDER BY NUMERO
;



UPDATE BANCO
  SET ATIVO = 0
    WHERE NUMERO = 0
;



SELECT
    NUMERO
   ,NOME
   ,ATIVO
  FROM BANCO
    ORDER BY NUMERO
;



BEGIN;
UPDATE BANCO
  SET ATIVO = 1
    WHERE NUMERO = 0
;

SELECT
    NUMERO
   ,NOME
   ,ATIVO
  FROM BANCO
    ORDER BY NUMERO
;
ROLLBACK;



BEGIN;
UPDATE BANCO
  SET ATIVO = 1
    WHERE NUMERO = 0
;

SELECT
    NUMERO
   ,NOME
   ,ATIVO
  FROM BANCO
    ORDER BY NUMERO
;
COMMIT;



