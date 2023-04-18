SELECT ar.name AS 'artista',
    CASE
		WHEN COUNT(user_id) >= 5 THEN 'A'
        WHEN COUNT(user_id) = 3 OR COUNT(user_id) = 4 THEN 'B'
        WHEN COUNT(user_id) = 1 OR COUNT(user_id) = 2 THEN 'C'
        ELSE '-'
	END 'ranking'
FROM SpotifyClone.albuns AS al
	INNER JOIN SpotifyClone.songs AS s
		ON al.albun_id = s.albun_id
	INNER JOIN SpotifyClone.favorite_songs AS fav
		ON fav.song_id = s.song_id
	RIGHT JOIN SpotifyClone.artists AS ar
		ON ar.artist_id = al.artist_id
	GROUP BY ar.name
    ORDER BY COUNT(user_id) DESC, ar.name;