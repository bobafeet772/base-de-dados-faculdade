SHOW DATABASES;

-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS faculdade;
USE faculdade;

-- Tabela de cursos
CREATE TABLE curso (
  id_curso INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

-- Tabela de alunos
CREATE TABLE aluno (
  id_aluno INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  matricula VARCHAR(20),
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Tabela de professores
CREATE TABLE professor (
  id_professor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100)
);

-- Tabela de disciplinas
CREATE TABLE disciplina (
  id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Tabela de turmas
CREATE TABLE turma (
  id_turma INT AUTO_INCREMENT PRIMARY KEY,
  id_disciplina INT,
  id_professor INT,
  semestre VARCHAR(10),
  FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
  FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

-- Tabela de matrícula
CREATE TABLE matricula (
  id_aluno INT,
  id_turma INT,
  PRIMARY KEY (id_aluno, id_turma),
  FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
  FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

-- Tabela de notas
CREATE TABLE nota (
  id_aluno INT,
  id_turma INT,
  nota1 DECIMAL(5,2),
  nota2 DECIMAL(5,2),
  media_final DECIMAL(5,2),
  PRIMARY KEY (id_aluno, id_turma),
  FOREIGN KEY (id_aluno, id_turma) REFERENCES matricula(id_aluno, id_turma)
);

-- Inserindo dados de exemplo
INSERT INTO curso (nome) VALUES ('Engenharia de Software'), ('Administração');

INSERT INTO aluno (nome, email, matricula, id_curso)
VALUES 
('Maria Oliveira', 'maria@exemplo.com', '2025001', 1),
('João Silva', 'joao@exemplo.com', '2025002', 1);

INSERT INTO professor (nome, email)
VALUES ('Carlos Mendes', 'carlos@exemplo.com'),
       ('Ana Paula', 'ana@exemplo.com');

INSERT INTO disciplina (nome, id_curso)
VALUES ('Banco de Dados', 1),
       ('Administração Financeira', 2);

INSERT INTO turma (id_disciplina, id_professor, semestre)
VALUES (1, 1, '2025.1'),
       (2, 2, '2025.1');

INSERT INTO matricula (id_aluno, id_turma)
VALUES (1, 1), (2, 1);

INSERT INTO nota (id_aluno, id_turma, nota1, nota2, media_final)
VALUES 
(1, 1, 8.5, 7.5, 8.0),
(2, 1, 6.0, 7.0, 6.5);

-- SELECT exemplo
SELECT aluno.nome AS aluno, curso.nome AS curso
FROM aluno
JOIN curso ON aluno.id_curso = curso.id_curso;

-- Atualizando a média final de um aluno
UPDATE nota
SET nota1 = 9.0, nota2 = 8.0, media_final = (9.0 + 8.0)/2
WHERE id_aluno = 1 AND id_turma = 1;

-- Deletando uma nota
DELETE FROM nota
WHERE id_aluno = 2 AND id_turma = 1;








