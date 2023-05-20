CREATE TABLE tb_medico(
	cod_medico SERIAL PRIMARY KEY,
	crm VARCHAR(20) UNIQUE NOT NULL,
	nome VARCHAR(300) NOT NULL
);

INSERT INTO tb_medico (crm, nome)
VALUES 
('123456', 'Ana'),
('789456', 'Pedro');

SELECT * FROM tb_medico;

CREATE TABLE tb_paciente(
	cod_paciente SERIAL PRIMARY KEY,
	cpf VARCHAR(20) UNIQUE NOT NULL,
	nome VARCHAR(300) NOT NULL,
	idade INT NULL
);


CREATE TABLE tb_consulta(
	cod_consulta SERIAL PRIMARY KEY,
	cod_medico INT NOT NULL,
	cod_paciente INT NOT NULL,
	data_hora TIMESTAMP NOT NULL,
	CONSTRAINT fk_medico FOREIGN KEY 
		(cod_medico) REFERENCES tb_medico(cod_medico),
	CONSTRAINT fk_paciente FOREIGN KEY
		(cod_paciente) REFERENCES tb_paciente(cod_paciente)
);