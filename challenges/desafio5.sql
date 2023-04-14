SELECT s.`name` AS `cancao`, COUNT(h.song_id) AS `reproducoes` FROM SpotifyClone.songs AS s
	INNER JOIN SpotifyClone.historical as h
		ON s.song_id = h.song_id
    GROUP BY s.`name`
    ORDER BY COUNT(h.song_id) DESC, s.`name` 
    LIMIT 2;