CREATE DATABASE IF NOT EXISTS bd_torneio_padel;
USE bd_torneio_padel;

CREATE TABLE atletas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    vitorias INT DEFAULT 0,
    derrotas INT DEFAULT 0,
    pontos INT DEFAULT 0
);

CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dupla1_atleta1_id INT NOT NULL,
    dupla1_atleta2_id INT NOT NULL,
    dupla2_atleta1_id INT NOT NULL,
    dupla2_atleta2_id INT NOT NULL,
    placar VARCHAR(50) DEFAULT '0-0',
    dupla_vencedora INT NULL, -- 1 = Dupla 1, 2 = Dupla 2
    status VARCHAR(20) DEFAULT 'agendada', -- 'agendada' ou 'finalizada'
    FOREIGN KEY (dupla1_atleta1_id) REFERENCES atletas(id),
    FOREIGN KEY (dupla1_atleta2_id) REFERENCES atletas(id),
    FOREIGN KEY (dupla2_atleta1_id) REFERENCES atletas(id),
    FOREIGN KEY (dupla2_atleta2_id) REFERENCES atletas(id)
);