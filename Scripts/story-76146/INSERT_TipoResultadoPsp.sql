use GestaoAvaliacao

insert into TipoResultadoPsp (Codigo,Nome,NomeTabelaProvaSp,CreateDate,UpdateDate,[State])
values 
(1,'Resultado Aluno','ResultadoAluno',getdate(),getdate(),1),
(2,'Resultado Turma','ResultadoTurma',getdate(),getdate(),0),
(3,'Resultado Escola','ResultadoEscola',getdate(),getdate(),0),
(4,'Resultado Dre','ResultadoDre',getdate(),getdate(),0),
(5,'Resultado Sme','ResultadoSme',getdate(),getdate(),0),
(6,'Resultado Enturmacao Atual','ResultadoEnturmacaoAtual',getdate(),getdate(),0),
(7,'Ciclo Aluno','ResultadoCicloAluno',getdate(),getdate(),0),
(8,'Ciclo DRE','ResultadoCicloDre',getdate(),getdate(),0),
(9,'Ciclo Enturmacao Atual','ResultadoCicloEnturmacaoAtual',getdate(),getdate(),0),
(10,'Ciclo Escola','ResultadoCicloEscola',getdate(),getdate(),0),
(11,'Ciclo SME','ResultadoCicloSme',getdate(),getdate(),0),
(12,'Ciclo Turma','ResultadoCicloTurma',getdate(),getdate(),0),
(13,'Participa��o DRE', 'ParticipacaoDRE',getdate(),getdate(),0),
(14,'Participa��o DRE - AreaConhecimento', 'ParticipacaoDREAreaConhecimento',getdate(),getdate(),0),
(15,'Participa��o Escola', 'ParticipacaoEscola',getdate(),getdate(),0),
(16,'Participa��o Escola - AreaConhecimento', 'ParticipacaoEscolaAreaConhecimento',getdate(),getdate(),0),
(17,'Participa��o SME', 'ParticipacaoSME',getdate(),getdate(),0),
(18,'Participa��o SME - AreaConhecimento', 'ParticipacaoSMEAreaConhecimento',getdate(),getdate(),0),
(19,'Participa��o Turma', 'ParticipacaoTurma',getdate(),getdate(),0),
(20,'Participa��o Turma - AreaConhecimento', 'ParticipacaoTurmaAreaConhecimento',getdate(),getdate(),0);
