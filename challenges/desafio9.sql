SELECT COUNT(h.song_id) AS musicas_no_historico FROM SpotifyClone.users AS u
	INNER JOIN SpotifyClone.historical AS h
		ON u.user_id = h.user_id
    WHERE u.`name` = 'Barbara Liskov'
    GROUP BY u.`name`;