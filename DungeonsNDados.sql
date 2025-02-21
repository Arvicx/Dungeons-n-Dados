CREATE DATABASE projetoDnD;
USE projetoDnD;

-- Criação das Tabelas, sendo elas JOGADOR (dono do personagem),
-- o PERSONAGEM, que possui ITENS, uma CLASSE e HABILIDADES,
-- além de poder aceitar MISSÕES com diferentes MONSTROS

CREATE TABLE jogador(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE classe(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200) NOT NULL
);

CREATE TABLE habilidades(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    efeito VARCHAR(200) NOT NULL,
    id_classe INT NOT NULL,
    FOREIGN KEY(id_classe) REFERENCES classe(id)
);

CREATE TABLE monstro(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel VARCHAR(2) NOT NULL,
    habilidades VARCHAR(100) NOT NULL,
    lore VARCHAR(200) NOT NULL
);

CREATE TABLE missao(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    recompensa VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    id_monstro INT NOT NULL,
    FOREIGN KEY(id_monstro) REFERENCES monstro(id)
);

CREATE TABLE personagem(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nivel VARCHAR(2) NOT NULL,
    id_jogador INT NOT NULL,
    FOREIGN KEY(id_jogador) REFERENCES jogador(id),
    id_classe INT NOT NULL,
    FOREIGN KEY(id_classe) REFERENCES classe(id),
    id_missao INT NOT NULL,
    FOREIGN KEY(id_missao) REFERENCES missao(id)
);

CREATE TABLE itens(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    efeito VARCHAR(100) NOT NULL,
    id_personagem INT NOT NULL,
    FOREIGN KEY(id_personagem) REFERENCES personagem(id)
);