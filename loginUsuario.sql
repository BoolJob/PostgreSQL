-- Function: loginusuario(character varying, character)

-- DROP FUNCTION loginusuario(character varying, character);

CREATE OR REPLACE FUNCTION loginusuario(
    _email character varying,
    _password character)
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
	SET 	ultimo_ingreso = _fecha 
	WHERE 	email = _email AND 
		password = _password AND
		estado = 1;

	GET DIAGNOSTICS _row = ROW_COUNT;

	IF _row = 1
	THEN
		return _row;
	END IF;

	SELECT usuario.estado INTO _estado FROM usuario WHERE email = _email AND password = _password;

	IF _estado IS NOT NULL 
	THEN
		RETURN -(_estado);
	END IF;

	IF NOT EXISTS (SELECT id_usuario FROM usuario WHERE email = _email)
	THEN
		RETURN -1;
	END IF;

	RETURN -2;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION loginusuario(character varying, character)
  OWNER TO postgres;

