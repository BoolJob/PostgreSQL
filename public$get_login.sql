-- Function: "public$get_login"(character varying, character, character varying)

-- DROP FUNCTION "public$get_login"(character varying, character, character varying);

CREATE OR REPLACE FUNCTION "public$get_login"(
    _email character varying,
    _password character,
    _token character varying)
  RETURNS integer AS
$BODY$

DECLARE _fecha 	timestamp;
	_row 	int;
	_estado int;

BEGIN
	_fecha := (SELECT (now() AT TIME ZONE 'utc'));
	_row := 0;
	_estado := 1;
	
	UPDATE 	usuario 
	SET 	ultimo_ingreso = _fecha,
		token_email = ''
	WHERE 	email = _email AND 
		password = _password AND
		estado = 1;

	GET DIAGNOSTICS _row = ROW_COUNT;

	-- esta OK
	IF _row = 1
	THEN
		return _row;
	END IF;

	SELECT usuario.estado INTO _estado FROM usuario WHERE email = _email AND password = _password;

	-- usuario no ha validado email
	IF _estado = 0
	THEN
		UPDATE 	usuario 
		SET 	ultimo_ingreso = _fecha,
			estado = 1
		WHERE 	email = _email AND 
			password = _password AND
			token_email = _token;

		GET DIAGNOSTICS _row = ROW_COUNT;

		return _row;
		
	END IF;

	-- algun estado extra
	IF _estado IS NOT NULL 
	THEN
		RETURN -(_estado);
	END IF;

	-- email no existe
	IF NOT EXISTS (SELECT id_usuario FROM usuario WHERE email = _email)
	THEN
		RETURN -1;
	END IF;

	-- pass incorrecta
	RETURN -2;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "public$get_login"(character varying, character, character varying)
  OWNER TO postgres;

