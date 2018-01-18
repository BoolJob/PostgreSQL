-- Function: "public$busqueda_publicacion"(character varying, character varying, numeric, integer, integer)

-- DROP FUNCTION "public$busqueda_publicacion"(character varying, character varying, numeric, integer, integer);

CREATE OR REPLACE FUNCTION "public$busqueda_publicacion"(
    _str_busqueda character varying,
    _idioma character varying,
    _min_rank numeric,
    _limit integer,
    _offset integer)
  RETURNS SETOF busqueda_type AS
$BODY$

BEGIN
	RETURN QUERY 	SELECT  id_publicacion AS id, titulo, descripcion_corta
			FROM(
				SELECT 	id_publicacion, 
					titulo, 
					descripcion_corta, 
					ts_rank(tsv_publicacion, 
						to_tsquery(_idioma, regexp_replace(_str_busqueda,'\s+','|','g'))) AS rank
				FROM 	publicacion
			) publicacion
			WHERE rank > _min_rank
			ORDER BY rank desc
			LIMIT _limit
			OFFSET _offset;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION "public$busqueda_publicacion"(character varying, character varying, numeric, integer, integer)
  OWNER TO postgres;

