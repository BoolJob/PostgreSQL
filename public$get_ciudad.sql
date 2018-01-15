-- Function: "public$get_ciudad"(bigint)

-- DROP FUNCTION "public$get_ciudad"(bigint);

CREATE TYPE ciudad_type AS (id_ciudad bigint, nombre character varying);

CREATE OR REPLACE FUNCTION "public$get_ciudad"(_id_pais bigint)
  RETURNS SETOF ciudad_type AS
$BODY$

BEGIN
	RETURN QUERY SELECT id_ciudad, nombre from ciudad where id_region = _id_pais;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION "public$get_ciudad"(bigint)
  OWNER TO postgres;

