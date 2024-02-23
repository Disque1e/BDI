-- Juncoes
	
	-- Inner join
	/*SELECT U.IDUtilizador, U.PrimeiroNome + ' ' + U.UltimoNome AS 'Nome', P.Descricao AS 'Permissao' 
	FROM Utilizadores AS U INNER JOIN Permissoes AS P
		ON U.Permissoes = P.IDPermissao*/

	-- Esta juncao mostra-nos os utilizadores e as permissoes dos mesmos

	-- Outer join
	/*SELECT  C.IDCandidatura, C.Informacoes, C.ExperienciaProfissional, L.Localidade + ', ' + L.CodigoPostal AS 'Localidade', V.Titulo, 
			U.PrimeiroNome + U.UltimoNome AS 'Nome Candidato', U.Email + ' | ' + U.Telemovel AS 'Contactos', 
			H.Descricao AS 'Habilitacoes', V.IsInterna AS 'Tipo de candidatura'
	FROM Localidades AS L LEFT OUTER JOIN Filiais AS F
		ON  L.IDLocalidade = F.Localidade LEFT OUTER JOIN Candidaturas AS C 
			ON F.IDFilial = C.Filial LEFT OUTER JOIN Vagas AS V 
				ON C.Vaga = V.IDVaga LEFT OUTER JOIN Utilizadores AS U 
					ON C.Utilizador = U.IDUtilizador LEFT OUTER JOIN Habilitacoes AS H
						ON C.Habilitacoes = H.IDHabilitacoes
	WHERE C.Estado = 1*/

	-- Esta juncao oferece o conjunto de todas as inforcoes sobre as candidaturas ATIVAS!

-- Agrupamentos

/*SELECT U.PrimeiroNome + ' ' + U.UltimoNome AS 'Nome', COUNT(*) AS NumCandidaturas
FROM Candidaturas AS CA INNER JOIN Utilizadores AS U
	ON CA.Utilizador = U.IDUtilizador
GROUP BY U.PrimeiroNome + ' ' + U.UltimoNome*/


--Este agrupamento tem como objetivo apresentar o nome completo dos utilizadores e o número de candidaturas que cada utilizador fez.


/*SELECT P.Descricao AS 'Permissao', COUNT(*) AS Utilizadores
FROM Utilizadores AS U INNER JOIN Permissoes AS P
	ON U.Permissoes = P.IDPermissao
GROUP BY P.Descricao*/


-- Este agrupamento tem como objetivo apresentar o número de utilizadores existentes em cada permissão.


-- Subconsultas-

/*SELECT V.Titulo, U.PrimeiroNome + ' ' + U.UltimoNome AS 'Nome' , C.Informacoes, C.Estado, F.Endereço + L.Localidade + ', ' + L.CodigoPostal AS 'Morada'
FROM Vagas AS V INNER JOIN Candidaturas AS C 
	ON V.IDVaga = C.Vaga INNER JOIN Utilizadores AS U
		ON  C.Utilizador = U.IDUtilizador INNER JOIN Filiais AS F
			ON C.Filial = F.IDFilial INNER JOIN Localidades AS L
				ON F.Localidade = L.IDLocalidade
WHERE F.Localidade = 2*/


-- O objetivo desta subconsulta é obter informações relacionadas com as vagas, a candidaturas, a utilizadores, a filiais e a localidades, 
-- filtrando os resultados de forma a mostrar apenas as candidaturas de uma determinada Filial.



/*SELECT D.Nome AS 'Departamento', U.PrimeiroNome + ' ' + U.UltimoNome AS 'Nome', Salario
FROM Departamentos AS D LEFT OUTER JOIN Colaboradores AS C 
	ON D.IDDepartamento = C.Departamento INNER JOIN Utilizadores AS U
		ON C.Utilizador = U.IDUtilizador
		WHERE Salario IN(
			SELECT MAX(Salario)
			FROM Colaboradores
			GROUP BY Departamento);*/


-- O objetivo desta subconsulta é apresentar os nomes dos departamentos, dos colaboradores e os seus respetivos salários, 
-- filtrando e apresentando apenas o colaboradore que possui salário mais elevado de cada departamento.



-- Procedimento Armazenado

/*IF OBJECT_ID('ValidacaoInserirNegocio') IS NOT NULL
	DROP PROC ValidacaoInserirNegocio
GO

CREATE PROC ValidacaoInserirNegocio
	@IDNegocio INT = NULL,
	@Area INT = NULL,
	@Departamento INT = NULL,
	@Contactos VARCHAR(100) = NULL,
	@Orcamento DECIMAL(20, 2) = NULL,
	@Descricao VARCHAR(MAX) = NULL,
	@DataCriacao DATE = NULL,
	@DataAtualizacao DATE = NULL,
	@Estado VARCHAR(20) = NULL,
	@Responsavel INT = NULL
AS
IF NOT EXISTS (SELECT * FROM AreaNegocio WHERE IDArea = @Area)
	RAISERROR('Essa area de negocio nao se encontra disponivel...', 11, 1)

IF NOT EXISTS (SELECT * FROM Departamentos WHERE IDDepartamento = @Departamento)
	RAISERROR('Esse departamento nao existe...', 11, 1)

IF @Contactos IS NULL
	RAISERROR('Tem de inserir os contactos...', 11, 1)

IF @Orcamento IS NULL
	RAISERROR('Tem de inserir o orcamento...', 11, 1)

IF @Descricao IS NULL
	RAISERROR('Tem de inserir a descricao...', 11, 1)

IF @DataCriacao IS NULL OR @DataCriacao > GETDATE() OR DATEDIFF(dd, @DataCriacao, GETDATE()) > 30
	RAISERROR('Data de criacao inválida...', 11, 1)

IF @DataAtualizacao IS NULL OR @DataAtualizacao > GETDATE() OR DATEDIFF(dd, @DataCriacao, GETDATE()) > 30 OR @DataAtualizacao > @DataCriacao
	RAISERROR('Data de atualizacao inválida...', 11, 1)

IF @Estado != 'Aprovado' OR @Estado != 'Pendente' OR @Estado != 'Em revisao' OR @Estado != 'Recusado' OR @Estado IS NULL
	RAISERROR('Estado inválido...', 11, 1)

IF NOT EXISTS (SELECT * FROM Colaboradores WHERE IDColaborador = @Responsavel)
	RAISERROR('Esse colaborador nao existe...', 11, 1)


INSERT Negocios
VALUES (@IDNegocio, @Area, @Departamento, @Contactos, @Orcamento, @Descricao, @DataCriacao, @DataAtualizacao, @Estado, @Responsavel)*/

		-- O objetivo deste procedimento e validar as inserções dos dados na tabela Negócios


-- Funcao

/*CREATE FUNCTION CalcularLucroNegocio (@orcamento DECIMAL(20, 2), @custos DECIMAL(20, 2), @receitas DECIMAL(20, 2))
	RETURNS DECIMAL(20, 2)
AS
BEGIN
    DECLARE @lucro DECIMAL(20, 2);
    SET @lucro = @receitas - @custos;

    IF @lucro < 0
        SET @lucro = 0;
    	
    RETURN @lucro;
END*/

   -- O objetivo desta funcao e calcular lucro de um negocio


-- Triggers

/*CREATE TRIGGER HistoricoUtilizadores
	ON Utilizadores
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE NAME = 'AlteracoesUtilizadores')
    BEGIN
        CREATE TABLE AlteracoesUtilizadores (
            IDAlteracao     INT IDENTITY(1, 1)   NOT NULL,
            DataAlteracao   DATETIME            NOT NULL,
            Operacao        VARCHAR(10)         NOT NULL,
            IDUtilizador    INT,
            PrimeiroNome    VARCHAR(20),
            UltimoNome      VARCHAR(20),
            Telemovel       VARCHAR(15),
            Email           VARCHAR(50),
            IsAtivo         BIT,
            IsColaborador   BIT,
            Permissoes      INT,
            IsCandidato     BIT,
            Detalhes        NVARCHAR(MAX),

            CONSTRAINT PK_AlteracoesUtilizadores PRIMARY KEY (IDAlteracao)
        )
    END

    DECLARE @Operacao VARCHAR(10)
    DECLARE @DataAlteracao DATETIME
    SET @DataAlteracao = GETDATE()

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        IF EXISTS (SELECT * FROM deleted)
        BEGIN
            SET @Operacao = 'UPDATE'

            INSERT INTO AlteracoesUtilizadores (DataAlteracao, Operacao, IDUtilizador, PrimeiroNome, UltimoNome, Telemovel, Email, IsAtivo, IsColaborador, Permissoes, IsCandidato, Detalhes)
            SELECT @DataAlteracao, @Operacao, i.IDUtilizador, i.PrimeiroNome, i.UltimoNome, i.Telemovel, i.Email, i.IsAtivo, i.IsColaborador, i.Permissoes, i.IsCandidato,
                'Campo atualizado: ' +
                CASE WHEN i.PrimeiroNome != d.PrimeiroNome THEN 'PrimeiroNome ' ELSE '' END +
                CASE WHEN i.UltimoNome != d.UltimoNome THEN 'UltimoNome ' ELSE '' END +
                CASE WHEN i.Telemovel != d.Telemovel THEN 'Telemovel ' ELSE '' END +
                CASE WHEN i.Email != d.Email THEN 'Email ' ELSE '' END +
                CASE WHEN i.IsAtivo != d.IsAtivo THEN 'IsAtivo ' ELSE '' END +
                CASE WHEN i.IsColaborador != d.IsColaborador THEN 'IsColaborador ' ELSE '' END +
                CASE WHEN i.Permissoes != d.Permissoes THEN 'Permissoes ' ELSE '' END +
                CASE WHEN i.IsCandidato != d.IsCandidato THEN 'IsCandidato ' ELSE '' END
            FROM inserted i
            INNER JOIN deleted d ON i.IDUtilizador = d.IDUtilizador
            WHERE 
                i.PrimeiroNome != d.PrimeiroNome OR
                i.UltimoNome != d.UltimoNome OR
                i.Telemovel != d.Telemovel OR
                i.Email != d.Email OR
                i.IsAtivo != d.IsAtivo OR
                i.IsColaborador != d.IsColaborador OR
                i.Permissoes != d.Permissoes OR
                i.IsCandidato != d.IsCandidato
        END
        ELSE
        BEGIN
            SET @Operacao = 'INSERT'

            INSERT INTO AlteracoesUtilizadores (DataAlteracao, Operacao, IDUtilizador, PrimeiroNome, UltimoNome, Telemovel, Email, IsAtivo, IsColaborador, Permissoes, IsCandidato, Detalhes)
            SELECT @DataAlteracao, @Operacao, IDUtilizador, PrimeiroNome, UltimoNome, Telemovel, Email, IsAtivo, IsColaborador, Permissoes, IsCandidato, 'Criacao do utilizador'
            FROM inserted
        END
    END
    ELSE
    BEGIN
        SET @Operacao = 'DELETE'

        INSERT INTO AlteracoesUtilizadores (DataAlteracao, Operacao, IDUtilizador, PrimeiroNome, UltimoNome, Telemovel, Email, IsAtivo, IsColaborador, Permissoes, IsCandidato, Detalhes)
        SELECT @DataAlteracao, @Operacao, IDUtilizador, PrimeiroNome, UltimoNome, Telemovel, Email, IsAtivo, IsColaborador, Permissoes, IsCandidato, 'Eliminacao do utilizador'
        FROM deleted
    END
END*/


-- Após a efetuação de uma pesquisa por "alterações utilizadores" nas tabelas do sistema, caso esta exista, as alterações, insercoes e eliminacoes feitas a um utilziador 
-- são inseridas nessa tabela. Se a tabela não esxistir, o trigger cria e insere lá todas as alterações, insercoes e eliminacoes efetuadas.


-- Cursor

/*CREATE TRIGGER VerificarPermissoes
ON Utilizadores
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM inserted AS i LEFT OUTER JOIN Permissoes AS P
		ON i.Permissoes = P.IDPermissao
		WHERE P.IDPermissao IS NULL
	)
	BEGIN
	RAISERROR('Nao tem, permissoes para efetuar essa ', 16, 1)
	ROLLBACK
	END
END*/

/*DECLARE Cursor_DepartamentoColaboradorNegocio CURSOR
FORWARD_ONLY STATIC READ_ONLY
FOR 
SELECT D.Nome, U.PrimeiroNome + ' ' + U.UltimoNome, N.IDNegocio
FROM Departamentos AS D LEFT OUTER JOIN Colaboradores AS C 
	ON D.IDDepartamento = C.Departamento LEFT OUTER JOIN Utilizadores AS U 
		ON C.Utilizador = U.IDUtilizador LEFT OUTER JOIN Negocios AS N
			ON N.Responsável = C.IDColaborador
ORDER BY D.Nome ASC

OPEN Cursor_DepartamentoColaboradorNegocio
DECLARE @Departamento VARCHAR(30), @Nome VARCHAR(50), @Negocio VARCHAR(30)

FETCH NEXT 
FROM Cursor_DepartamentoColaboradorNegocio INTO @Departamento, @Nome, @Negocio
	PRINT ' Departamento   |   Colaborador   |   Negocio '
	PRINT '----------------------------------------------'
WHILE @@FETCH_STATUS = 0
BEGIN
	IF(@Nome IS NULL AND @Negocio IS NULL)
	BEGIN 
		PRINT @Departamento + ' | - sem colaborador - | - sem negocio -'
	END
	ELSE IF(@Nome IS NULL AND @Negocio IS NOT NULL)
	BEGIN
		PRINT @Departamento + ' | - sem colaborador - | ' + @Negocio 
	END
	ELSE IF(@Nome IS NOT NULL AND @Negocio IS NULL)
	BEGIN
		PRINT @Departamento + ' | ' + @Nome + ' | - sem negocio -'
	END
	ELSE IF(@Nome IS NOT NULL AND @Negocio IS NOT NULL)
	BEGIN
		PRINT @Departamento + ' | ' + @Nome + ' | '+ @Negocio 
	END
	FETCH NEXT 
	FROM Cursor_DepartamentoColaboradorNegocio INTO @Departamento, @Nome, @Negocio 
END

CLOSE Cursor_DepartamentoColaboradorNegocio
DEALLOCATE Cursor_DepartamentoColaboradorNegocio*/

-- Este cursor da display ao colaborador, ao departamento a que pertence e os negócios que este está envolvido