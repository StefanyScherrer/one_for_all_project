-- Descomente e altere as linhas abaixo:

-- DROP DATABASE IF EXISTS SpotifyClone;
-- CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- CREATE TABLE SpotifyClone.tabela1(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- CREATE TABLE SpotifyClone.tabela2(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
-- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados X'),
--   ('exemplo de dados 2', 'exemplo de dados Y');
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `price` DECIMAL(3,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    albun_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    realese_year INT NOT NULL,
    artist_id INT, 
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.songs(
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `duration` INT NOT NULL,
    albun_id INT,
    FOREIGN KEY (albun_id) REFERENCES albuns (albun_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `age` INT NOT NULL,
    signature_date DATE NOT NULL,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.historical(
    historic_id INT PRIMARY KEY AUTO_INCREMENT,
    reproduction_date DATETIME NOT NULL,
    user_id INT,
    song_id INT,
    CONSTRAINT UNIQUE (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (song_id) REFERENCES songs (song_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.following_artists(
    following_artists_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    artist_id INT,
    CONSTRAINT UNIQUE (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.artists (`name`)
 VALUES
   ('Beyoncé'),
   ('Queen'),
   ('Elis Regina'),
   ('Baco Exu do Blues'),
   ('Blind Guardian'),
   ('Nina Simone');

INSERT INTO SpotifyClone.plans (`name`, `price`)
 VALUES
   ('gratuito', 0),
   ('familiar', 7.99),
   ('universitário', 5.99),
   ('pessoal', 6.99);

INSERT INTO SpotifyClone.albuns (`name`, realese_year, artist_id)
 VALUES
   ('Renaissance', 2022, 1),
   ('Jazz', 1978, 2),
   ('Hot Space', 1982, 2),
   ('Falso Brilhante', 1998, 3),
   ('Vento de Maio', 2001, 3),
   ('QVVJFA?', 2003, 4),
   ('Somewhere Far Beyond', 2007, 5),
   ('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.songs (`name`, `duration`,  albun_id)
  VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGOS GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Dont Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre"', 207, 5),
    ('Samba em Paris', 267, 6),
    ('The Bards Song', 244, 7),
    ('Feeling Good', 100, 8);

INSERT INTO SpotifyClone.users (`name`, `age` , signature_date, plan_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.historical (reproduction_date, user_id , song_id)
  VALUES
    ('2022-02-28 10:45:55', 1, 8),
    ('2020-05-02 05:30:35', 1, 2),
    ('2020-03-06 11:22:33', 1, 10),
    ('2022-08-05 08:05:17', 2, 10),
    ('2020-01-02 07:40:33', 2, 7),
    ('2020-12-05 18:38:30', 3, 2),
    ('2020-11-13 16:55:13', 3, 10),
    ('2021-08-15 17:10:10', 4, 8),
    ('2020-08-06 15:23:43', 5, 5),
    ('2022-01-09 01:44:33', 5, 8),
    ('2017-10-12 12:35:20', 6, 1),
    ('2017-01-24 00:31:17', 6, 7),
    ('2011-12-15 22:30:49', 7, 4),
    ('2012-03-17 14:56:41', 8, 4),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 10, 3);

INSERT INTO SpotifyClone.following_artists (user_id , artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (8, NULL),
    (9, 3),
    (10, 2);