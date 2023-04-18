-- Descomente e altere as linhas abaixo:

-- CREATE TABLE SpotifyClone.tabela(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;

-- INSERT INTO SpotifyClone.tabela (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
DROP TABLE IF EXISTS SpotifyClone.favorite_songs;
CREATE TABLE SpotifyClone.favorite_songs(
    favorite_song_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    song_id INT,
    CONSTRAINT UNIQUE (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (song_id) REFERENCES songs (song_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.favorite_songs (user_id, song_id)
  VALUES
    (1, 3),
    (1, 6),
    (1, 10),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 7),
    (4, 4),
    (5, 10),
	  (5, 2),
    (8, 4),
    (9, 7),
    (10, 3);