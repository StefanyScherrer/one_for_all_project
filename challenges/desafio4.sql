SELECT u.`name` AS pessoa_usuaria, IF((YEAR(MAX(h.reproduction_date))) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria FROM SpotifyClone.users AS u
	INNER JOIN SpotifyClone.historical AS h
		ON u.user_id = h.user_id
        GROUP BY u.`name`
        ORDER BY u.`name`;