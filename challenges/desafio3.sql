SELECT u.`name` AS `pessoa_usuaria`, COUNT(s.song_id) AS `musicas_ouvidas`, ROUND(SUM(s.duration)/60, 2) AS `total_minutos` FROM SpotifyClone.users AS u
	INNER JOIN SpotifyClone.historical AS h
		ON u.user_id = h.user_id
    INNER JOIN SpotifyClone.songs AS s
		ON h.song_id = s.song_id
	GROUP BY u.`name`
    ORDER BY u.`name`;