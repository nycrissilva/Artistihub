CREATE DATABASE IF NOT EXISTS artisthub;

USE artisthub;

CREATE TABLE tb_usuario (
    usu_id INT AUTO_INCREMENT PRIMARY KEY,
    usu_nome VARCHAR(100),
    usu_email VARCHAR(150),
    usu_senha VARCHAR(255)
);

CREATE TABLE tb_artista (
    art_id INT AUTO_INCREMENT PRIMARY KEY,
    usu_id INT,
    art_nome_artistico VARCHAR(100),
    art_biografia TEXT,
    art_generos VARCHAR(255),
    art_foto_url VARCHAR(500),
    art_instagram VARCHAR(255),
    art_youtube VARCHAR(255),
    art_spotify VARCHAR(255),

    FOREIGN KEY (usu_id)
        REFERENCES tb_usuario (usu_id)
);

CREATE TABLE tb_lancamento (
    lan_id INT AUTO_INCREMENT PRIMARY KEY,
    art_id INT,
    lan_titulo VARCHAR(150),
    lan_tipo VARCHAR(30),
    lan_data DATE,
    lan_status VARCHAR(30),
    lan_capa_url VARCHAR(500),
    lan_descricao TEXT,

    FOREIGN KEY (art_id)
        REFERENCES tb_artista (art_id)
);

CREATE TABLE tb_composicao (
    com_id INT AUTO_INCREMENT PRIMARY KEY,
    art_id INT,
    lan_id INT NULL,
    com_titulo VARCHAR(150),
    com_letra LONGTEXT,
    com_idioma VARCHAR(50),
    com_status VARCHAR(30),

    FOREIGN KEY (art_id)
        REFERENCES tb_artista (art_id),

    FOREIGN KEY (lan_id)
        REFERENCES tb_lancamento (lan_id)
);

CREATE TABLE tb_tarefa (
    tar_id INT AUTO_INCREMENT PRIMARY KEY,
    usu_id INT,
    tar_titulo VARCHAR(150),
    tar_descricao TEXT,
    tar_prazo DATE,
    tar_prioridade VARCHAR(30),
    tar_status VARCHAR(30),

    FOREIGN KEY (usu_id)
        REFERENCES tb_usuario (usu_id)
);