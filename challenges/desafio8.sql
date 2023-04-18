SELECT a.`name` AS `artista`, al.`name` AS 'album' FROM SpotifyClone.`albuns` AS al
	INNER JOIN SpotifyClone.artists AS a
		ON al.artist_id = a.artist_id
        HAVING a.`name` = 'Elis Regina';