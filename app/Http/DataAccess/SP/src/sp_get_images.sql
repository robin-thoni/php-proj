
        SELECT i.id, i.name, i.user_id, i.date
        FROM images i
        WHERE (CASE WHEN _only_mine THEN i.user_id = _user_id_me ELSE TRUE END)
