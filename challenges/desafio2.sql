SELECT COUNT(cancoes.song_id) AS `cancoes`, MAX(artistas.artist_id) AS `artistas`, MAX(albuns.albun_id) AS `albuns`
	FROM SpotifyClone.artists AS `artistas`
    INNER JOIN SpotifyClone.albuns AS `albuns`
		ON artistas.artist_id = albuns.artist_id
	RIGHT JOIN SpotifyClone.songs AS `cancoes`
		ON cancoes.albun_id = albuns.albun_id;