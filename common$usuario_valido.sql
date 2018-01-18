-- Function: "common$usuario_valido"(character varying, character)

-- DROP FUNCTION "common$usuario_valido"(character varying, character);

CREATE OR REPLACE FUNCTION "common$usuario_valido"(
    _email character varying,
    _password character)
  RETURNS integer AS
$BODY$

DECLARE _fecha 	timestamp;
	_row 	int;
	_estado int;

BEGIN
	_row := 0;
	_estado := 1;
	
	SELECT 	count(*) INTO _row
	FROM 	usuario
	WHERE 	email = _email AND 
		password = _password AND
		(estado = 1 OR		-- usuario normal OK
		estado = 2);		-- usuario normal con restablecer contraseña
		
	-- esta OK
	IF _row = 1
	THEN
		return _row;
	END IF;

	SELECT usuario.estado INTO _estado FROM usuario WHERE email = _email AND password = _password;

	-- usuario en algun estado extra
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
ALTER FUNCTION "common$usuario_valido"(character varying, character)
  OWNER TO postgres;

