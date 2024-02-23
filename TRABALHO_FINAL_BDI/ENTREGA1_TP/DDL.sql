						-- Delete Table
/*DROP TABLE IF EXISTS Candidaturas;
DROP TABLE IF EXISTS Entrevistas;
DROP TABLE IF EXISTS Reunioes;
DROP TABLE IF EXISTS Convocatorias;
DROP TABLE IF EXISTS Ideias;
DROP TABLE IF EXISTS Oportunidades;
DROP TABLE IF EXISTS TipoOportunidades;
DROP TABLE IF EXISTS Vagas;
DROP TABLE IF EXISTS Investimentos;
DROP TABLE IF EXISTS Parcerias;
DROP TABLE IF EXISTS Negocios;
DROP TABLE IF EXISTS Departamentos;
DROP TABLE IF EXISTS Colaboradores;
DROP TABLE IF EXISTS Filiais;
DROP TABLE IF EXISTS CrendenciaisAcesso;
DROP TABLE IF EXISTS Utilizadores;
DROP TABLE IF EXISTS Permissoes;
DROP TABLE IF EXISTS Beneficios;
DROP TABLE IF EXISTS Habilitacoes;
DROP TABLE IF EXISTS AreaNegocio;
DROP TABLE IF EXISTS TipoIdeias;
DROP TABLE IF EXISTS Localidades;
DROP TABLE IF EXISTS Estados;*/

-- Verificar as tabelas que sao referenciadas numa outra tabela
-- Utilizamos para organizar a ordem do DROP TABLE

/*SELECT OBJECT_NAME(f.parent_object_id) AS 'Tabela Referenciadora'
FROM sys.foreign_keys AS f
INNER JOIN sys.objects AS o ON o.object_id = f.referenced_object_id
WHERE o.name = 'Departamentos'*/


						-- Create Table

						-- Estados 
		-- (oportunidades/negocios/parecerias)

CREATE TABLE Estados(
	IDEstado			TINYINT IDENTITY (1, 1)			NOT NULL,
	NomeEstado			VARCHAR(30)						NOT NULL,

	CONSTRAINT PK_Estado PRIMARY KEY (IDEstado)
)
						-- Localidades

CREATE TABLE Localidades(
	IDLocalidade		INT	IDENTITY (1, 1)		NOT NULL,
	Localidade			VARCHAR(30)				NOT NULL,
	CodigoPostal		CHAR(8)					NOT NULL,

	CONSTRAINT PK_Localidades PRIMARY KEY (IDLocalidade)
)

						-- TipoIdeias
CREATE TABLE TipoIdeias (
   IDTipoIdeia      INT IDENTITY(1, 1)  NOT NULL,
   Descricao		VARCHAR(50)        NOT NULL,
   
   CONSTRAINT PK_TipoIdeias PRIMARY KEY (IDTipoIdeia)
)

						-- AreaNegocio

CREATE TABLE AreaNegocio (
   IDArea             INT IDENTITY (1, 1)		NOT NULL,
   Area               VARCHAR(40)				NOT NULL, 

   CONSTRAINT PK_AreaNegocio PRIMARY KEY (IDArea)
)

						-- Habilitacoes

CREATE TABLE Habilitacoes(
	IDHabilitacoes		INT IDENTITY (1, 1)		NOT NULL,
	Descricao			VARCHAR(30)				NOT NULL,

	CONSTRAINT PK_Habilitacoes PRIMARY KEY (IDHabilitacoes)
)

						-- Beneficios

CREATE TABLE Beneficios (
	IDBeneficio       INT IDENTITY (1, 1)				NOT NULL,
	Titulo            VARCHAR(50)						NOT NULL,      
	Descricao         VARCHAR(MAX)						NOT NULL,
	Tipo		      VARCHAR(20)						NOT NULL,
	
	CONSTRAINT PK_BENEFICIOS PRIMARY KEY (IDBeneficio)
)

						-- Permissoes

CREATE TABLE Permissoes(
   IDPermissao		INT					NOT NULL,
   Descricao		VARCHAR(20)			NOT NULL,
   
   CONSTRAINT PK_Permissoes PRIMARY KEY (IDPermissao)
)

						-- Utilizadores

CREATE TABLE Utilizadores (
	IDUtilizador		INT IDENTITY(1, 1)		NOT NULL,
	PrimeiroNome        VARCHAR(20)				NOT NULL,
	UltimoNome	        VARCHAR(20)				NOT NULL,
	Telemovel           VARCHAR(15),
	Email               VARCHAR(50)				NOT NULL,
	DataRegisto			DATETIME				NOT NULL,
	UltimoAcesso		DATETIME				NOT NULL,
	IsAtivo				BIT /* 0 'NAO' 1 'SIM'*/	NOT NULL,
	IsColaborador       BIT /* 0 'NAO' 1 'SIM'*/	NOT NULL,
	Permissoes			INT						NOT NULL,
	IsCandidato			BIT /* 0 'NAO' 1 'SIM'*/	NOT NULL,

   CONSTRAINT PK_Utilizadores PRIMARY KEY (IDUtilizador),
   CONSTRAINT FK_Utilizadores_Permissoes FOREIGN KEY (Permissoes) REFERENCES Permissoes(IDPermissao)
)

						-- Departamentos

CREATE TABLE Departamentos(
	IDDepartamento		TINYINT IDENTITY (1, 1)	NOT NULL,
	Nome                VARCHAR(20)            NOT NULL,
    Responsavel         INT                    NOT NULL,
    DataCriacao         DATETIME               NOT NULL,
    Descricao           VARCHAR(MAX),

	CONSTRAINT PK_Departamentos PRIMARY KEY (IDDepartamento),
)
						-- CredenciaisAcesso

CREATE TABLE CrendenciaisAcesso (
	IDCrendenciais			INT IDENTITY (1, 1)			NOT NULL,
	Utilizador				INT							NOT NULL,
	Username				VARCHAR(30)                 NOT NULL,
	Password_				VARCHAR(30)					NOT NULL,

	CONSTRAINT PK_Credenciais PRIMARY KEY (IDCrendenciais),
	CONSTRAINT FK_Credenciais_Utilizadores FOREIGN KEY (Utilizador) REFERENCES Utilizadores (IDUtilizador)
)


						-- Filiais

CREATE TABLE Filiais(
	IDFilial			TINYINT	IDENTITY (1, 1)	NOT NULL,
	Endereço			VARCHAR(50)				NOT NULL,
	Localidade			INT						NOT NULL,
	Telefone			VARCHAR(15)				NOT NULL,
	Email				VARCHAR(50)				NOT NULL,
	DataAbertura		DATE					NOT NULL,

	CONSTRAINT PK_Filiais PRIMARY KEY (IDFilial),
	CONSTRAINT FK_Filiais_Localidades FOREIGN KEY (Localidade) REFERENCES Localidades (IDLocalidade)
)

						-- Colaboradores

CREATE TABLE Colaboradores(
	IDColaborador			INT	IDENTITY (1, 1)		NOT NULL,
	Utilizador				INT						NOT NULL,
	HabilitacoesEscolares	INT						NOT NULL,
	Endereço				VARCHAR(50)				NOT NULL,
	Localidade				INT						NOT NULL,
	Filial					TINYINT					NOT NULL,
	Departamento			TINYINT					NOT NULL,
	Cargo					VARCHAR(50)				NOT NULL,
	Salario					DECIMAL(10, 2)			NOT NULL,
	DataContratacao			DATETIME				NOT NULL,
	

	CONSTRAINT PK_Colaboradores PRIMARY KEY (IDColaborador),
	CONSTRAINT FK_Colaboradores_Utilizadores FOREIGN KEY (Utilizador) REFERENCES Utilizadores (IDUtilizador),
	CONSTRAINT FK_Colaboradores_Filiais FOREIGN KEY (Filial) REFERENCES Filiais (IDFilial),
	CONSTRAINT FK_Colaboradores_Localidades FOREIGN KEY (Localidade) REFERENCES Localidades (IDLocalidade),
	CONSTRAINT FK_Colaboradores_Departamentos FOREIGN KEY (Departamento) REFERENCES Departamentos (IDDepartamento),
	CONSTRAINT FK_Colaboradores_Habilitacoes FOREIGN KEY (HabilitacoesEscolares) REFERENCES Habilitacoes (IDHabilitacoes)
)
	
						-- DepartamentoColaborador
CREATE TABLE DepartamentoColaborador
(
	IDDepartamento			TINYINT					NOT NULL,
	IDColaborador			INT						NOT NULL

	CONSTRAINT PK_DepartamentoColaborador PRIMARY KEY (IDDepartamento, IDColaborador),
	CONSTRAINT FK_DepartamentoColaborador_Departamentos FOREIGN KEY (IDDepartamento) REFERENCES Departamentos (IDDepartamento),
	CONSTRAINT FK_DepartamentoColaborador_Colaboradores FOREIGN KEY (IDColaborador) REFERENCES Colaboradores (IDColaborador)

)

						-- Negocios

CREATE TABLE Negocios(
	IDNegocio				INT					NOT NULL,
	AreaNegocio             INT                 NOT NULL,
	Departamento            TINYINT				NOT NULL,
	Contactos				VARCHAR(100)		NOT NULL,
	Orçamento				DECIMAL(20,2)       NOT NULL,
	Descricao				VARCHAR(100)        NOT NULL,
	DataResgisto			DATETIME            NOT NULL,                
	DataAtualizacao			DATETIME            NOT NULL,
	Estado					TINYINT             NOT NULL,
	Responsável				INT					NOT NULL, 
	
	CONSTRAINT PK_Negocios PRIMARY KEY (IDNegocio),
	CONSTRAINT FK_Negocios_AreaNegocio FOREIGN KEY (AreaNegocio) REFERENCES AreaNegocio (IDArea),
	CONSTRAINT FK_Negocios_Colaboradores FOREIGN KEY (Responsável) REFERENCES Colaboradores (IDColaborador),
	CONSTRAINT FK_Negocios_Estado FOREIGN KEY (Estado) REFERENCES Estados (IDEstado),
	CONSTRAINT FK_Negocios_Departamentos FOREIGN KEY (Departamento) REFERENCES Departamentos (IDDepartamento)

)

						-- Parcerias

CREATE TABLE Parcerias(
	IDParceria			INT IDENTITY (1, 1)		NOT NULL,
	Beneficios          VARCHAR(150)			NOT NULL,
	Requisitos          VARCHAR(150)			NOT NULL,
	NomeParceiro		VARCHAR(100),
	DataInicio			DATE					NOT NULL,
	DataFim				DATE,
	Estado				TINYINT,
	Email				VARCHAR(50)				NOT NULL,
	Telefone			VARCHAR(15)				NOT NULL,
	Observacoes			VARCHAR(MAX),

	CONSTRAINT PK_Pareceria PRIMARY KEY (IDParceria),
	CONSTRAINT FK_Parcerias_Estados FOREIGN KEY (Estado) REFERENCES Estados (IDEstado)
)

						-- Investimentos

CREATE TABLE Investimentos(
	IDInvestimento			INT IDENTITY(1, 1)	NOT NULL,
	Montante				INT					NOT NULL,
	DataInvestimento		DATE, 
	Descricao				VARCHAR(MAX),

	CONSTRAINT PK_INVESTIMENTO PRIMARY KEY (IDInvestimento),
)

						-- Vagas

CREATE TABLE Vagas(
	IDVaga							INT IDENTITY,
	Titulo							VARCHAR(50)				NOT NULL,                
	Descricao						VARCHAR(MAX)			NOT NULL,   
	Localizacao						TINYINT					NOT NULL,  
	Departamento					TINYINT					NOT NULL,
	HabilitacoesMinimas				INT,
	ExperienciaMinima				VARCHAR(100),
	RenumeraçãoBase					DECIMAL(10, 2)			NOT NULL,       
	IsInterna						BIT /*0 'NAO' / 1 'SIM'*/ 	NOT NULL,  
	DataRegisto						DATETIME				NOT NULL,
	DataAtualizacao					DATETIME, 
	Responsavel						INT						NOT NULL
   
   CONSTRAINT PK_Vagas PRIMARY KEY (IDVaga),
   CONSTRAINT FK_Vagas_Departamentos FOREIGN KEY (Departamento) REFERENCES Departamentos (IDDepartamento),
   CONSTRAINT FK_Vagas_Habilitacoes FOREIGN KEY (HabilitacoesMinimas) REFERENCES Habilitacoes (IDHabilitacoes),
   CONSTRAINT FK_Vagas_Colaboradores FOREIGN KEY (Responsavel) REFERENCES Colaboradores (IDColaborador),
   CONSTRAINT FK_Vagas_Filiais FOREIGN KEY (Localizacao) REFERENCES Filiais(IDFilial)
)

						-- Candidaturas

CREATE TABLE Candidaturas (     
	IDCandidatura			INT IDENTITY (1, 1)			NOT NULL,
	Vaga					INT							NOT NULL, 
	Utilizador				INT							NOT NULL, 
	Habilitacoes			INT							NOT NULL, 
	Filial					TINYINT						NOT NULL, 
	Informacoes				VARCHAR(MAX)				NOT NULL, 
	ExperienciaProfissional VARCHAR(50)					NOT NULL,
	Estado					BIT /*0 'ATIVO' 1 'INATIVO' */	NOT NULL,   
	DataCriacao				DATETIME					NOT NULL,
	DataAtualizacao			DATETIME,
	DataEnvio				DATETIME					NOT NULL,
	DataAlteracaoInfo		DATETIME,

	CONSTRAINT PK_Candidaturas PRIMARY KEY (IDCandidatura),
	CONSTRAINT FK_Candidaturas_Vagas FOREIGN KEY (Vaga) REFERENCES Vagas (IDVaga),
	CONSTRAINT FK_Candidaturas_Utilizadores FOREIGN KEY (Utilizador) REFERENCES Utilizadores (IDUtilizador),
	CONSTRAINT FK_Candidaturas_Habilitacoes FOREIGN KEY (Habilitacoes) REFERENCES Habilitacoes (IDHabilitacoes),
	CONSTRAINT FK_Candidaturas_Filiais FOREIGN KEY (Filial) REFERENCES Filiais (IDFilial),
)

						-- TipoOportunidades

CREATE TABLE TipoOportunidades(
	IDTipoOportunidade	INT IDENTITY (1, 1)		NOT NULL,
	Descricao			VARCHAR(30)				NOT NULL,
	Negocio				INT,
	Parceria			INT,
	Investimento		INT,

	CONSTRAINT PK_TipoOportunidades PRIMARY KEY (IDTipoOportunidade),
	CONSTRAINT FK_TipoOportunidades_Negocios FOREIGN KEY (Negocio) REFERENCES Negocios(IDNegocio),
	CONSTRAINT FK_TipoOportunidades_Investimentos FOREIGN KEY (Investimento) REFERENCES Investimentos(IDInvestimento),
	CONSTRAINT FK_TipoOportunidades_Parcerias FOREIGN KEY (Parceria) REFERENCES Parcerias(IDParceria)
)

						-- Oportunidades

CREATE TABLE Oportunidades (
	IDOportunidade			INT IDENTITY (1, 1),
	Utilizador				INT,
	Tipo					INT,
	Estado					TINYINT DEFAULT '0'			NOT NULL,
	Titulo					VARCHAR(50)					NOT NULL,
	Descricao				VARCHAR(MAX)				NOT NULL,
	Responsavel				INT							NOT NULL,
	
	CONSTRAINT PK_OPORTUNIDADES PRIMARY KEY (IDOportunidade),
	CONSTRAINT FK_Oportunidades_Utilizadores FOREIGN KEY (Utilizador) REFERENCES Utilizadores (IDUtilizador),
	CONSTRAINT FK_OOportunidades_Estado FOREIGN KEY (Estado) REFERENCES Estados (IDEstado),
	CONSTRAINT FK_Oportunidades_Tipo FOREIGN KEY (Tipo) REFERENCES TipoOportunidades (IDTipoOportunidade),
	CONSTRAINT FK_Oportunidades_Colaboradores FOREIGN KEY (Responsavel) REFERENCES Colaboradores (IDColaborador)
)


						-- Ideias
CREATE TABLE Ideias (
   IDIdeia          INT IDENTITY(1, 1)  NOT NULL,
   Utilizador		INT					NOT NULL,
   TipoIdeia		INT					NOT NULL,
   Titulo           VARCHAR(50)			NOT NULL,
   Descricao        VARCHAR(MAX)		NOT NULL,
   
   CONSTRAINT PK_Ideias PRIMARY KEY (IDIdeia),
   CONSTRAINT FK_Ideias_Utilizadores FOREIGN KEY (Utilizador) REFERENCES Utilizadores (IDUtilizador),
   CONSTRAINT FK_Ideias_TipoIdeias FOREIGN KEY (TipoIdeia) REFERENCES TipoIdeias (IDTipoIdeia)
)

						-- Reunioes

CREATE TABLE Reunioes (
	IDReuniao			INT IDENTITY (1, 1)			NOT NULL,
	DiaReuniao			DATE						NOT NULL,
	HoraReuniao         TIME							NOT NULL, 
	Assunto				VARCHAR(20)					NOT NULL,
	HoraFim				TIME, 
	Responsavel			INT							NOT NULL,
	Participantes		VARCHAR(MAX)				NOT NULL,
	Observacoes			VARCHAR(MAX),

	CONSTRAINT PK_Reunioes PRIMARY KEY (IDReuniao),
	CONSTRAINT FK_Reunioes_Responsavel FOREIGN KEY (Responsavel) REFERENCES Colaboradores (IDColaborador)
)

						-- Convocatorias
CREATE TABLE Convocatorias(
	IDConvocatoria			INT IDENTITY (1, 1)		NOT NULL,
	Reuniao					INT						NOT NULL,
	Utilizador				INT						NOT NULL,

	CONSTRAINT PK_Convocatorias PRIMARY KEY (IDConvocatoria),
	CONSTRAINT FK_Convocatorias_Reunioes FOREIGN KEY (Reuniao) REFERENCES Reunioes(IDReuniao),
	CONSTRAINT FK_Convocatorias_Utilizadores FOREIGN KEY (Utilizador) REFERENCES Utilizadores(IDUtilizador)
)

						-- Entrevistas

CREATE TABLE Entrevistas (
	IDEntrevista		INT IDENTITY (1, 1)			NOT NULL,
	Candidatura			INT							NOT NULL,
	DataEntrevista		DATE						NOT NULL,
	HoraInicio			TIME						NOT NULL,
	Observacoes         VARCHAR(MAX),
	
	CONSTRAINT PK_Entrevistas PRIMARY KEY (IDEntrevista),
	CONSTRAINT FK_Entrevistas_Candidaturas FOREIGN KEY (Candidatura) REFERENCES Candidaturas (IDCandidatura)
)
