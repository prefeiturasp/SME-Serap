BEGIN TRAN
UPDATE ProvaSP.dbo.NivelProficienciaAnoEscolar SET Nome = 'Abaixo do B�sico'
	WHERE AnoEscolar = 5 and Nome = 'Nivel basico'
COMMIT