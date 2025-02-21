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

-- insira o nome do jogador
INSERT INTO jogador(nome) VALUES ("Arthur");

-- primeiro teste
SELECT * FROM jogador;

-- insira o nome e nível do personagem
INSERT INTO personagem(nome, nivel) VALUES ("Arturo", "1");

-- insira a classe (ex: Guerreiro, Mago, Clérigo) do personagem e a descreva
INSERT INTO classe(nome, descricao) VALUES ("Ladino","Furtivo");

-- insira uma habilidade e a descreva
INSERT INTO habilidades(nome,efeito) VALUES ("Ataque Furtivo","Adiciona o dobro de dano em ataques com vantagem");

-- insira os itens
INSERT INTO itens(id,nome,tipo,efeito) VALUES(1,"Adaga","Cortante","1d6 de dano");

-- insira a missão, junto com a recompensa e a descrição dela
INSERT INTO missao(nome,recompensa,descricao) VALUES ("Cólera","100PO","Mate a Cólera");

-- cadastre monstros, informando o nome, nivel, habilidades, seus efeitos e a descrição do monstro
INSERT INTO monstro(nome,nivel,habilidade,lore) VALUES ("Cólera","1","Adoecer Inimigos","Cólera é uma doença");

