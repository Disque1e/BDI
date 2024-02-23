						-- estados

INSERT INTO Estados(NomeEstado)
Values('Aprovada')

INSERT INTO Estados(NomeEstado)
Values('Em revisão')

INSERT INTO Estados(NomeEstado)
Values('Pendente')

INSERT INTO Estados(NomeEstado)
Values('Recusada')

						-- Localidades

INSERT INTO Localidades(Localidade,CodigoPostal)
Values('Viseu', '3500-021')

INSERT INTO Localidades(Localidade,CodigoPostal)
Values('Porto', '4465-692')

INSERT INTO Localidades(Localidade,CodigoPostal)
Values('Aveiro', '3800-002')

						-- TipoIdeias

INSERT INTO TipoIdeias(Descricao)
Values('Sugestão')

INSERT INTO TipoIdeias(Descricao)
Values('Opinião')

INSERT INTO TipoIdeias(Descricao)
Values('Negocio')

INSERT INTO TipoIdeias(Descricao)
Values('Tecnologia')

INSERT INTO TipoIdeias(Descricao)
Values('Moda e design')

INSERT INTO TipoIdeias(Descricao)
Values('Saúde e bem-estar')

						-- AreaNegocio

INSERT INTO AreaNegocio(Area)
Values('Desenvolvimento de Software')

INSERT INTO AreaNegocio(Area)
Values('Serviços de Consultoria em TI')

INSERT INTO AreaNegocio(Area)
Values('Outsourcing de TI')

INSERT INTO AreaNegocio(Area)
Values('Infraestrutura de TI')

INSERT INTO AreaNegocio(Area)
Values('Serviços de Suporte Técnico')

INSERT INTO AreaNegocio(Area)
Values('Transformação Digital')

INSERT INTO AreaNegocio(Area)
Values('Serviços de Segurança Cibernética')

						-- Habilitacoes

INSERT INTO Habilitacoes(Descricao)
Values('4º ano')

INSERT INTO Habilitacoes(Descricao)
Values('9º ano')

INSERT INTO Habilitacoes(Descricao)
Values('12º ano')

INSERT INTO Habilitacoes(Descricao)
Values('Licenciatura')

INSERT INTO Habilitacoes(Descricao)
Values('Mestrado')

INSERT INTO Habilitacoes(Descricao)
Values('Doutoramento')


						-- Beneficios
INSERT INTO Beneficios(Titulo,Descricao,Tipo)
Values('Saúde em primeiro lugar','Assistência médica e odontológica para funcionários e, em alguns casos, também para seus dependentes.','Plano de Saúde')

INSERT INTO Beneficios(Titulo,Descricao,Tipo)
Values('Segurança','Cobertura de seguro de vida para proteção financeira dos funcionários e suas famílias.','Seguro de Vida')

INSERT INTO Beneficios(Titulo,Descricao,Tipo)
Values('Auxilio nos custos com alimentação diária.','Foi criada uma cantina em todos os estabelecimentos e implementado maquinas de comida para que os funcionários possam usufruir','Vale-refeição')

INSERT INTO Beneficios(Titulo,Descricao,Tipo)
Values('Fornecimento de transporte','Auxílio no transporte dos funcionários para o trabalho.','Vale-transporte')

INSERT INTO Beneficios(Titulo,Descricao,Tipo)
Values('Horários Flexíveis para os funcionários','Possibilidade de horários flexíveis ou trabalho remoto, permitindo uma maior conciliação entre vida pessoal e profissional.','Horários Flexíveis')

						-- Permissoes

INSERT INTO Permissoes(IDPermissao, Descricao)
Values(1, 'ADMINISTRADOR')

INSERT INTO Permissoes(IDPermissao, Descricao)

Values(2, 'GESTOR')

INSERT INTO Permissoes(IDPermissao, Descricao)
Values(3, 'UTILIZADOR')

						-- Utilizadores
INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Pedro', 'Carreiras', '999999999', 'exemplo@exemplo.com','2021-04-26', '2022-04-27', 1, 1, 1, 0)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Miguel', 'Batista', '999999999', 'exemplo@exemplo.com','2021-05-20', '2023-04-03', 1, 1, 2, 0)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Gabriel', 'Morujão', '999999999', 'exemplo@exemplo.com','2021-05-20', '2023-04-05', 1, 1, 2, 1)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Mário', 'Martins', '999999999', 'exemplo@exemplo.com','2023-04-26', '2023-04-27', 1, 1, 2, 0)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Asdrubal', 'Ferreira', '999999999', 'exemplo@exemplo.com','2023-04-26', '2023-04-27', 1, 1, 2, 0)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Fernando', 'Pessoa', '999999999', 'exemplo@exemplo.com','2021-05-20', '2023-04-03', 1, 0, 3, 0)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Paulo', 'Quinteiro', '999999999', 'exemplo@exemplo.com','2023-04-26', '2023-04-27', 0, 0, 3, 0)

INSERT INTO Utilizadores(PrimeiroNome, UltimoNome, Telemovel, Email, DataRegisto, UltimoAcesso, IsAtivo, IsColaborador, Permissoes, IsCandidato)
Values('Tiago', 'Saramago', '999999999', 'exemplo@exemplo.com','2023-04-26', '2023-04-27', 1, 0, 3, 1)

						-- Departamentos

INSERT INTO Departamentos(Nome, Responsavel, DataCriacao, Descricao)
Values('Recursos Humanos', 1, '2021-04-26', 'Ajudar os funcionarios.')

INSERT INTO Departamentos(Nome, Responsavel, DataCriacao, Descricao)
Values('Desenvolvimento', 2, '2022-04-27', 'Responsável pelo website e app')

INSERT INTO Departamentos(Nome, Responsavel, DataCriacao, Descricao)
Values('Suporte Técnico', 3, '2022-04-27', 'Ajuda os funcionarios que tem problemas')

INSERT INTO Departamentos(Nome, Responsavel, DataCriacao, Descricao)
Values('S. Informatica', 1, '2022-04-27', 'Segurança dos servidores da empresa')

INSERT INTO Departamentos(Nome, Responsavel, DataCriacao, Descricao)
Values('Qualidade', 4, '2022-04-28','Responsável por manter a empresa nos seus melhores')

						-- CredenciaisAcesso

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(1, 'admin', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(2, 'gestor1', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(3, 'gestor2', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(4, 'gestor3', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(5, 'gestor4', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(6, 'user1', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(7, 'user2', '1234')

INSERT INTO CrendenciaisAcesso(Utilizador, Username, Password_)
Values(8, 'user3', '1234')

						-- Filiais

INSERT INTO Filiais(Endereço, Localidade, Telefone,Email,DataAbertura)
Values('Rua Sao Joao da Madeira, lote 4', 1, '232232232', 'exemplofilial@gmail.com','2022-04-28')

INSERT INTO Filiais(Endereço, Localidade, Telefone,Email,DataAbertura)
Values('Rua Antonio Augusto Ferreira, 189', 2, '232232232', 'exemplofilial@gmail.com','2022-06-20')

INSERT INTO Filiais(Endereço, Localidade, Telefone,Email,DataAbertura)
Values('Rua Dona Maria das flores, lote 5', 3, '232232232', 'exemplofilial@gmail.com','2023-03-21')

						-- Colaboradores

INSERT INTO Colaboradores(Utilizador, HabilitacoesEscolares, Endereço, Localidade, Filial, Departamento, Cargo, Salario, DataContratacao)
Values(1, 2, 'Rua Sao Joao da Madeira, lote 4', 1, 1, 5, 'Administrador e responsável pela segurança online', 9450.0, '2021-04-26')

INSERT INTO Colaboradores(Utilizador, HabilitacoesEscolares, Endereço, Localidade, Filial, Departamento, Cargo, Salario, DataContratacao)
Values(2, 1, 'Rua Sao Joao da Madeira, lote 4', 1, 1, 2, 'Gestor do website, software e app', 8650.0, '2021-05-20')

INSERT INTO Colaboradores(Utilizador, HabilitacoesEscolares, Endereço, Localidade, Filial, Departamento, Cargo, Salario, DataContratacao)
Values(3,1, 'Rua Dona Maria das flores, lote 5', 2, 2, 3, 'Suporte Técnico da empresa', 8780.0, '2021-05-20' )

INSERT INTO Colaboradores(Utilizador, HabilitacoesEscolares, Endereço, Localidade, Filial, Departamento, Cargo, Salario, DataContratacao)
Values(4,2, 'Rua Dona Maria das flores, lote 5', 2, 2, 5, 'Responável pela qualidade', 3500.0, '2023-04-26')

INSERT INTO Colaboradores(Utilizador, HabilitacoesEscolares, Endereço, Localidade, Filial, Departamento, Cargo, Salario, DataContratacao)
Values(5,6, 'Rua Dona Maria das flores, lote 5', 2, 2, 1,'Responável pelos recursos humanos', 2200.0, '2023-04-26')

						-- Negocios

INSERT INTO Negocios(IDNegocio, AreaNegocio, Departamento, Contactos, Orçamento, Descricao, DataResgisto, DataAtualizacao, Estado, Responsável)
Values(1, 1, 2, '999999999', 10000.5, 'Desenvolvimento de uma aplicação para a repsol', '2023-01-26', '2023-02-07', 1, 2)

INSERT INTO Negocios(IDNegocio, AreaNegocio, Departamento, Contactos, Orçamento, Descricao, DataResgisto, DataAtualizacao, Estado, Responsável)
Values(2, 5, 3, '999999999', 12600.0, 'Desenvolvimento da área de suporte tecnico numa empresa dos Açores', '2023-01-26', '2023-02-10', 1, 3)

INSERT INTO Negocios(IDNegocio, AreaNegocio, Departamento, Contactos, Orçamento, Descricao, DataResgisto, DataAtualizacao, Estado, Responsável)
Values(3, 7, 4, '999999999', 50000.0, 'Desenvolvimento de uma melhor segurança nos sistemas de uma empresa', '2023-02-20', '2023-02-26', 3, 1)

						-- Parcerias

INSERT INTO Parcerias(Beneficios, Requisitos, NomeParceiro, DataInicio, DataFim, Estado, Email, Telefone, Observacoes)
Values('Cartão de desconto em combusrivel na Repsol', 'Ser trabalhador da empresa que necessita de transporte', 'Repsol', '2023-02-20', '2023-11-11', 1, 'exemplo@exemplo.com', '999999999', 'Cartão disponivel, na primeira semana de trabalho' )

INSERT INTO Parcerias(Beneficios, Requisitos, NomeParceiro, DataInicio, DataFim, Estado, Email, Telefone, Observacoes)
Values('Seguro gratuito na Multicare', 'Ser trabalhador da empresa', 'Multicare', '2023-05-02', '2023-10-28', 1, 'exemplo@exemplo.com', '999999999', 'Seguro de saúde atualizado anualmente' )

INSERT INTO Parcerias(Beneficios, Requisitos, NomeParceiro, DataInicio, DataFim, Estado, Email, Telefone, Observacoes)
Values('Descontos na compra de autmoveis no stand JC Automóveis ', 'Ser colabroador da empresa que necessita de transporte', 'JC Automóveis', '2023-03-23', '2024-09-26', 1, 'exemplo@exemplo.com', '999999999', 'No dia da compra do autmovel, sera fornecido um cartão de identidade a comprovar que é um colaborador' )

						-- Investimentos

INSERT INTO Investimentos(Montante, DataInvestimento, Descricao)
Values(50000,  '2023-04-24', 'Investimento na área de redes de comunicação na empresa NOS')

INSERT INTO Investimentos(Montante, DataInvestimento, Descricao)
Values(40000,  '2023-01-03', 'Investimento na criação de uma nova aplicação mobile')

INSERT INTO Investimentos(Montante, DataInvestimento, Descricao)
Values(10000,  '2022-12-01', 'Investimento no novo departamento de pesquisas no setor de Lisboa')

						-- Vagas

INSERT INTO Vagas(Titulo, Descricao, Localizacao, Departamento, HabilitacoesMinimas, ExperienciaMinima, RenumeraçãoBase, IsInterna, DataRegisto, DataAtualizacao, Responsavel)
Values('Vaga em Progaramador em Sotware', 'Foi aberta uma nova vaga em programador de Sotware',1 ,2,4, '1 ano de trabalho na área de desenvvolvimento de sofware', 6000, 1, '2023-02-20', '2023-02-26', 1)

INSERT INTO Vagas(Titulo, Descricao, Localizacao, Departamento, HabilitacoesMinimas, ExperienciaMinima, RenumeraçãoBase, IsInterna, DataRegisto, DataAtualizacao, Responsavel)
Values('Vaga em Recursos Humanos', 'Foi aberta uma nova vaga em Recursos Humanos',1 ,1 ,6 , '1 ano de trabalho na área de recursos humanos', 1500, 0, '2023-01-26', '2023-02-07', 1)

						-- Candidaturas

INSERT INTO Candidaturas(Vaga, Utilizador, Habilitacoes, Filial, Informacoes, ExperienciaProfissional, Estado, DataCriacao, DataAtualizacao, DataEnvio, DataAlteracaoInfo)
Values(1, 3, 1, 1, 'Informação sobre  candidatura 1', '5 anos a trabalhar na área de informatica com mestrado', 3, '2023-01-26', '2023-02-07', '2023-02-10', '2023-02-11')

INSERT INTO Candidaturas(Vaga, Utilizador, Habilitacoes, Filial, Informacoes, ExperienciaProfissional, Estado, DataCriacao, DataAtualizacao, DataEnvio, DataAlteracaoInfo)
Values(1, 6, 1, 1, 'Informação sobre  candidatura 2', '2 anos a trabalhar na área de informatica com mestrado', 3, '2023-01-26', '2023-02-07', '2023-02-10', '2023-02-17')

						-- TipoOportunidades

INSERT INTO TipoOportunidades(Descricao, Negocio, Parceria, Investimento)
Values('Oportunidades de emprego', 1, 2, 2)

INSERT INTO TipoOportunidades(Descricao, Negocio, Parceria, Investimento)
Values('Programas de estágio', 3, 1, 3)

INSERT INTO TipoOportunidades(Descricao, Negocio, Parceria, Investimento)
Values('Projetos desafiadores', 2, 3, 1)

						-- Oportunidades

INSERT INTO Oportunidades(Utilizador, Tipo, Estado, Titulo, Descricao, Responsavel)
Values(3,1,3, 'Entrada na área de de TI', 'Oportunidade unica para mostrar a compreensão e conhecimento na área informatica',1)

INSERT INTO Oportunidades(Utilizador, Tipo, Estado, Titulo, Descricao, Responsavel)
Values(4,3,4, 'Desenvolvimento de uma aplicação mobile', 'Oportunidade unica para mostrar a compreensão na criação de aplicações mobiles',2)

INSERT INTO Oportunidades(Utilizador, Tipo, Estado, Titulo, Descricao, Responsavel)
Values(2,3,1, 'Desenvolvimento de uma aplicação web', 'Oportunidade unica para mostrar a compreensão na criação de aplicações Web',2)

						-- Ideias

INSERT INTO Ideias(Utilizador, TipoIdeia, Titulo, Descricao)
Values(1,1,'Melhor organização nos recursos humanos', 'Melhorar o processo de analise das candidaturas')

INSERT INTO Ideias(Utilizador, TipoIdeia, Titulo, Descricao)
Values(4,2, 'Suporte tecnico', 'Qualidade de suporte incrivel e resposta rápida ao problema')

INSERT INTO Ideias(Utilizador, TipoIdeia, Titulo, Descricao)
Values(5,3, 'Nova app mobile', 'A app mobile tem um design antigo')

						-- Reunioes

INSERT INTO Reunioes(DiaReuniao, HoraReuniao, Assunto, HoraFim, Responsavel, Participantes, Observacoes)
Values('2022-12-01', '16:31', 'Assuntos internos da empresa', '18:37', 2, 'Miguel', 'S/observações')

INSERT INTO Reunioes(DiaReuniao, HoraReuniao, Assunto, HoraFim, Responsavel, Participantes, Observacoes)
Values('2022-12-01', '16:31', 'Assuntos internos da empresa', '18:37', 2, 'Gabriel', 'Necessidade de mais empregados no setor de suporte tecnico')

						-- Convocatorias

INSERT INTO Convocatorias(Reuniao, Utilizador)
Values(3, 2)

INSERT INTO Convocatorias(Reuniao, Utilizador)
Values(4, 3)

						-- Entrevistas

INSERT INTO Entrevistas(Candidatura, DataEntrevista, HoraInicio, Observacoes)
Values(5, '2022-12-01', '16:31', '18:37')

INSERT INTO Entrevistas(Candidatura, DataEntrevista, HoraInicio, Observacoes)
Values(6, '2022-12-02', '16:31', '18:37')