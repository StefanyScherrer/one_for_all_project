SELECT a.`name` AS `artista`, al.`name` AS `album`, COUNT(f.user_id) AS pessoas_seguidoras FROM SpotifyClone.`artists` AS a
	INNER JOIN SpotifyClone.`albuns` AS al
		ON al.artist_id = a.artist_id
	INNER JOIN SpotifyClone.following_artists AS f
		ON f.artist_id = a.artist_id
	GROUP BY a.`name`, al.`name`
    ORDER BY pessoas_seguidoras DESC, `artista`, `album`;