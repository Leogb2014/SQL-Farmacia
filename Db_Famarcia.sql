CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
    id BIGINT AUTO_INCREMENT,
    departamento VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));
    
INSERT INTO tb_categorias(departamento, descricao)
VALUES("Bem-estar", "Vitaminas no geral"),
("Bebê e criança","Produtos para cuidados de bebês e crianças"),
("Cosméticos","Produtos para Cabelos e maquiagem"),
("Medicamentos","Medicamentos para dor e primeiros socorros"),
("Higiene Pessoal", "Produtos para cuidados pessoais");

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    quantidade INT,
    preco DECIMAL(6,2) NOT NULL,
    data_validade DATE NOT NULL,
    categoriaid BIGINT,
    PRIMARY KEY(id));

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias 
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);    

INSERT INTO tb_produtos(nome, descricao, quantidade, preco, data_validade, categoriaid)
VALUES("Shampoo", "Shampoo capilar", 2, 33.20, "2024-08-16", 3),
("Fralda", "Fralda tamanho m", 5, 25.40, "2024-11-20", 2),
("Remédio", "Remédio para enxaqueca", 2, 4.30, "2025-03-12", 4),
("Vitamina C", "Vitamina fortificante", 3, 3.20, "2024-10-29",1),
("Pasta", "Creme dental", 2, 33.20, "2024-08-16", 5),
("Batom", "Batom labial", 4, 15.00, "2026-02-16-10", 3),
("Curativo", "Curativo Para feridas", 3, 40.10, "2027-06-02", 4),
("Suplemento infantil", "Suplemento para crianças", 2, 70.90, "2025-07-11",2);

SELECT * FROM tb_produtos;
SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco > 5.00 AND preco < 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT nome, tb_produtos.descricao, preco, quantidade, data_validade, tb_categorias.departamento
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

SELECT nome, tb_produtos.descricao, preco, quantidade, data_validade, tb_categorias.departamento
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id WHERE tb_categorias.id = 3;