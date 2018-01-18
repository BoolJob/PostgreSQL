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
	
	SELECT common$usuario_valido INTO _estado FROM common$usuario_valido(_email, _password);

	-- esta OK
	IF _estado = 1
	THEN
		UPDATE 	usuario 
		SET 	ultimo_ingreso = _fecha,
			token_email = ''
		WHERE 	email = _email AND 
			password = _password;
		
		return _estado;
	END IF;

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

	RETURN _estado;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "public$get_login"(character varying, character, character varying)
  OWNER TO postgres;

