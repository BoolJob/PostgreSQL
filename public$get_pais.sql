-- Function: "public$get_pais"()

-- DROP FUNCTION "public$get_pais"();

CREATE OR REPLACE FUNCTION "public$get_pais"()
  RETURNS SETOF pais AS
$BODY$

BEGIN
	RETURN QUERY SELECT id_pais, nombre from pais;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION "public$get_pais"()
  OWNER TO postgres;

