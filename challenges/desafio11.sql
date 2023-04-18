SELECT al.`name` AS album, COUNT(fav.song_id) AS `favoritadas` FROM SpotifyClone.albuns AS al
	INNER JOIN SpotifyClone.songs AS s
		ON al.albun_id = s.albun_id
	INNER JOIN SpotifyClone.favorite_songs AS fav
		ON fav.song_id = s.song_id
	GROUP BY al.`name`
    ORDER BY `favoritadas` DESC, al.`name`
    LIMIT 3;