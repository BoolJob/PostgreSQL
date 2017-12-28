-- Function: insertausuario(character varying, character varying, character varying, character varying, bigint, bigint, bigint, bigint, character)

-- DROP FUNCTION insertausuario(character varying, character varying, character varying, character varying, bigint, bigint, bigint, bigint, character);

CREATE OR REPLACE FUNCTION insertausuario(
    _nombre character varying,
    _apellido character varying,
    _email character varying,
    _rut character varying,
    _pais bigint,
    _region bigint,
    _ciudad bigint,
    _comuna bigint,
    _password character)
  RETURNS void AS
$BODY$

DECLARE _fecharegistro timestamp;

BEGIN
	_fecharegistro := (SELECT (now() AT TIME ZONE 'utc'));
	
	INSERT INTO usuario (nombre,apellido,email,rut,id_pais,id_region,id_ciudad,id_comuna,password,fecha_registro, estado)
	VALUES (_nombre,_apellido,_email,_rut,_pais,_region,_ciudad,_comuna,_password,_fecharegistro, 0);
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION insertausuario(character varying, character varying, character varying, character varying, bigint, bigint, bigint, bigint, character)
  OWNER TO postgres;

