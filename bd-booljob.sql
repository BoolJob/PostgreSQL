/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     20-12-2017 14:22:52                          */
/*==============================================================*/


drop table AGENDAR;

drop table CATEGORIA;

drop table CIUDAD;

drop table COMUNA;

drop table CONTACTO;

drop table ESPECIALIDAD;

drop table ESTUDIO;

drop table FAVORITO;

drop table HORARIO;

drop table IMAGEN;

drop table MENSAJE;

drop table MENSAJE_OFERTA;

drop table OFERTAR;

drop table PAIS;

drop table PUBLICACION;

drop table REGION;

drop table SUBCATEGORIA;

drop table SUSCRIPCION;

drop table SUSCRIPCION_ACTIVA;

drop table TOKEN_PUSH;

drop table TRABAJO;

drop table USUARIO;

drop table VIDEO;

/*==============================================================*/
/* Table: AGENDAR                                               */
/*==============================================================*/
create table AGENDAR (
   ID_AGENDAR           INT8                 not null,
   ID_USUARIO           INT8                 null,
   ID_PUBLICACION       INT8                 null,
   FECHA_INICIO         TIMESTAMP            null,
   FECHA_FIN            TIMESTAMP            null,
   constraint PK_AGENDAR primary key (ID_AGENDAR)
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   ID_CATEGORIA         INT8                 not null,
   NOMBRE               VARCHAR(128)         null,
   ESTADO               BOOL                 null,
   constraint PK_CATEGORIA primary key (ID_CATEGORIA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            INT8                 not null,
   ID_REGION            INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: COMUNA                                                */
/*==============================================================*/
create table COMUNA (
   ID_COMUNA            INT8                 not null,
   ID_CIUDAD            INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   constraint PK_COMUNA primary key (ID_COMUNA)
);

/*==============================================================*/
/* Table: CONTACTO                                              */
/*==============================================================*/
create table CONTACTO (
   ID_CONTACTO          INT8                 not null,
   ID_USUARIO           INT8                 null,
   ID_PUBLICACION       INT8                 null,
   DESCRIPCION          VARCHAR(128)         null,
   FECHA                TIMESTAMP            null,
   REPORTADO            BOOL                 null,
   VISIBLE              BOOL                 null,
   constraint PK_CONTACTO primary key (ID_CONTACTO)
);

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD (
   ID_ESPECIALIDAD      INT8                 not null,
   ID_SUBCATEGORIA      INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   ESTADO               BOOL                 null,
   constraint PK_ESPECIALIDAD primary key (ID_ESPECIALIDAD)
);

/*==============================================================*/
/* Table: ESTUDIO                                               */
/*==============================================================*/
create table ESTUDIO (
   ID_ESTUDIO           INT8                 not null,
   ID_USUARIO           INT8                 null,
   DESCRIPCION          VARCHAR(128)         null,
   TITULO               VARCHAR(64)          null,
   ID_VALIDACION        VARCHAR(128)         null,
   VALIDADO             BOOL                 null,
   constraint PK_ESTUDIO primary key (ID_ESTUDIO)
);

/*==============================================================*/
/* Table: FAVORITO                                              */
/*==============================================================*/
create table FAVORITO (
   ID_FAVORITO          INT8                 not null,
   ID_USUARIO           INT8                 null,
   ID_PUBLICACION       INT8                 null,
   NOTIFICA             BOOL                 null,
   constraint PK_FAVORITO primary key (ID_FAVORITO)
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO (
   ID_PUBLICACION       INT8                 not null,
   LUNES                BOOL                 null,
   MARTES               BOOL                 null,
   MIERCOLES            BOOL                 null,
   JUEVES               BOOL                 null,
   VIERNES              BOOL                 null,
   SABADO               BOOL                 null,
   DOMINGO              BOOL                 null,
   HORA_INICIO          TIME                 null,
   HORA_FIN             TIME                 null,
   constraint PK_HORARIO primary key (ID_PUBLICACION)
);

/*==============================================================*/
/* Table: IMAGEN                                                */
/*==============================================================*/
create table IMAGEN (
   ID_IMAGEN            INT8                 not null,
   ID_PUBLICACION       INT8                 null,
   ID_TRABAJOS          INT8                 null,
   ID_OFERTAR           INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   PRINCIPAL            BOOL                 null,
   constraint PK_IMAGEN primary key (ID_IMAGEN)
);

/*==============================================================*/
/* Table: MENSAJE                                               */
/*==============================================================*/
create table MENSAJE (
   ID_MENSAJE           INT8                 not null,
   ID_PUBLICACION       INT8                 null,
   ID_USUARIO           INT8                 null,
   ID_RESPUESTA         INT8                 null,
   DESCRIPCION          VARCHAR(128)         null,
   FECHA                TIMESTAMP            null,
   REPORTADO            BOOL                 null,
   VISIBLE              BOOL                 null,
   constraint PK_MENSAJE primary key (ID_MENSAJE)
);

/*==============================================================*/
/* Table: MENSAJE_OFERTA                                        */
/*==============================================================*/
create table MENSAJE_OFERTA (
   ID_MENSAJE_OFERTA    INT8                 not null,
   ID_OFERTAR           INT8                 null,
   ID_USUARIO           INT8                 null,
   MENSAJE              VARCHAR(128)         null,
   FECHA                TIMESTAMP            null,
   PRECIO               DECIMAL(19,2)        null,
   MONEDA               VARCHAR(5)           null,
   VISIBLE              BOOL                 null,
   MEJOR_OFERTA         BOOL                 null,
   VALORACION           DECIMAL(2,1)         null,
   COMENTARIO_VALORACION VARCHAR(128)         null,
   constraint PK_MENSAJE_OFERTA primary key (ID_MENSAJE_OFERTA)
);

/*==============================================================*/
/* Table: OFERTAR                                               */
/*==============================================================*/
create table OFERTAR (
   ID_OFERTAR           INT8                 not null,
   ID_USUARIO           INT8                 null,
   ID_ESPECIALIDAD      INT8                 null,
   ID_PAIS              INT8                 null,
   ID_REGION            INT8                 null,
   ID_CIUDAD            INT8                 null,
   ID_COMUNA            INT8                 null,
   TITULO               VARCHAR(32)          null,
   DESCRIPCION_CORTA    VARCHAR(64)          null,
   DESCRIPCION          VARCHAR(512)         null,
   ESTADO               INT2                 null,
   PRECIO               DECIMAL(18,2)        null,
   PRECIO_ANTERIOR      DECIMAL(18,2)        null,
   FECHA_LIMITE         DATE                 null,
   constraint PK_OFERTAR primary key (ID_OFERTAR)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS (
   ID_PAIS              INT8                 not null,
   NOMBRE               VARCHAR(128)         null,
   constraint PK_PAIS primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PUBLICACION                                           */
/*==============================================================*/
create table PUBLICACION (
   ID_PUBLICACION       INT8                 not null,
   ID_USUARIO           INT8                 null,
   ID_PAIS              INT8                 null,
   ID_REGION            INT8                 null,
   ID_CIUDAD            INT8                 null,
   ID_COMUNA            INT8                 null,
   ID_ESPECIALIDAD      INT8                 null,
   FECHA_PUBLICACION    TIMESTAMP            null,
   FECHA_MODIFICACION   TIMESTAMP            null,
   TITULO               VARCHAR(32)          null,
   DESCRIPCION_CORTA    VARCHAR(64)          null,
   DESCRIPCION          VARCHAR(512)         null,
   VALORACION           DECIMAL(2,1)         null,
   TIPO_PUBLICACION     INT2                 null,
   ESTADO               INT2                 null,
   PRECIO               DECIMAL(18,2)        null,
   PRECIO_ANTERIOR      DECIMAL(18,2)        null,
   GARANTIA             INT2                 null,
   NUMERO_VISITA        INT8                 null,
   constraint PK_PUBLICACION primary key (ID_PUBLICACION)
);

/*==============================================================*/
/* Table: REGION                                                */
/*==============================================================*/
create table REGION (
   ID_REGION            INT8                 not null,
   ID_PAIS              INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   constraint PK_REGION primary key (ID_REGION)
);

/*==============================================================*/
/* Table: SUBCATEGORIA                                          */
/*==============================================================*/
create table SUBCATEGORIA (
   ID_SUBCATEGORIA      INT8                 not null,
   ID_CATEGORIA         INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   ESTADO               BOOL                 null,
   constraint PK_SUBCATEGORIA primary key (ID_SUBCATEGORIA)
);

/*==============================================================*/
/* Table: SUSCRIPCION                                           */
/*==============================================================*/
create table SUSCRIPCION (
   ID_SUSCRIPCION       INT8                 not null,
   PRECIO               DECIMAL(9,2)         null,
   TITULO               VARCHAR(32)          null,
   DESCRIPCION          VARCHAR(128)         null,
   IMAGEN               VARCHAR(16)          null,
   DURACION             INT2                 null,
   ESTADO               BOOL                 null,
   TIPO                 INT2                 null,
   constraint PK_SUSCRIPCION primary key (ID_SUSCRIPCION)
);

/*==============================================================*/
/* Table: SUSCRIPCION_ACTIVA                                    */
/*==============================================================*/
create table SUSCRIPCION_ACTIVA (
   ID_SUSCRIPCION_ACTIVA INT8                 not null,
   ID_SUSCRIPCION       INT8                 null,
   FECHA_INICIO         DATE                 null,
   FECHA_TERMINO        DATE                 null,
   FECHA_PAGO           DATE                 null,
   MONTO                DECIMAL(9,2)         null,
   MONEDA               CHAR(5)              null,
   ID_RELATIVO          INT8                 null,
   constraint PK_SUSCRIPCION_ACTIVA primary key (ID_SUSCRIPCION_ACTIVA)
);

/*==============================================================*/
/* Table: TOKEN_PUSH                                            */
/*==============================================================*/
create table TOKEN_PUSH (
   ID_TOKEN_PUSH        INT8                 not null,
   ID_USUARIO           INT8                 null,
   TOKEN                VARCHAR(256)         null,
   SISTEMA_OPERATIVO    VARCHAR(16)          null,
   VERSION_APP          DECIMAL(4,1)         null,
   MODELO_CELULAR       VARCHAR(32)          null,
   constraint PK_TOKEN_PUSH primary key (ID_TOKEN_PUSH)
);

/*==============================================================*/
/* Table: TRABAJO                                               */
/*==============================================================*/
create table TRABAJO (
   ID_TRABAJOS          INT8                 not null,
   ID_PUBLICACION       INT8                 null,
   ID_USUARIO           INT8                 null,
   COMENTARIOS          VARCHAR(512)         null,
   VALORACION           DECIMAL(2,1)         null,
   FECHA                TIMESTAMP            null,
   VISIBLE              BOOL                 null,
   constraint PK_TRABAJO primary key (ID_TRABAJOS)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           INT8                 not null,
   ID_REGION            INT8                 null,
   ID_CIUDAD            INT8                 null,
   ID_COMUNA            INT8                 null,
   ID_PAIS              INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   APELLIDO             VARCHAR(128)         null,
   EMAIL                VARCHAR(128)         null,
   RUT                  VARCHAR(11)          null,
   FECHA_REGISTRO       TIMESTAMP            null,
   VALORACION           DECIMAL(2,1)         null,
   ESTADO               INT2                 null,
   ULTIMO_INGRESO       TIMESTAMP            null,
   TIPO_USUARIO         INT2                 null,
   IMAGEN               VARCHAR(32)          null,
   DESCRIPCION          VARCHAR(1024)        null,
   GENERO               CHAR(1)              null,
   PASSWORD             CHAR(64)             null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: VIDEO                                                 */
/*==============================================================*/
create table VIDEO (
   ID_VIDEO             INT8                 not null,
   ID_PUBLICACION       INT8                 null,
   ID_OFERTAR           INT8                 null,
   ID_TRABAJOS          INT8                 null,
   NOMBRE               VARCHAR(128)         null,
   constraint PK_VIDEO primary key (ID_VIDEO)
);

alter table AGENDAR
   add constraint FK_AGENDAR_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table AGENDAR
   add constraint FK_AGENDAR_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table CIUDAD
   add constraint FK_CIUDAD_REFERENCE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION);

alter table COMUNA
   add constraint FK_COMUNA_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table CONTACTO
   add constraint FK_CONTACTO_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table CONTACTO
   add constraint FK_CONTACTO_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table ESPECIALIDAD
   add constraint FK_ESPECIAL_REFERENCE_SUBCATEG foreign key (ID_SUBCATEGORIA)
      references SUBCATEGORIA (ID_SUBCATEGORIA);

alter table ESTUDIO
   add constraint FK_ESTUDIO_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table FAVORITO
   add constraint FK_FAVORITO_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table FAVORITO
   add constraint FK_FAVORITO_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table HORARIO
   add constraint FK_HORARIO_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table IMAGEN
   add constraint FK_IMAGEN_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table IMAGEN
   add constraint FK_IMAGEN_REFERENCE_TRABAJO foreign key (ID_TRABAJOS)
      references TRABAJO (ID_TRABAJOS);

alter table IMAGEN
   add constraint FK_IMAGEN_REFERENCE_OFERTAR foreign key (ID_OFERTAR)
      references OFERTAR (ID_OFERTAR);

alter table MENSAJE
   add constraint FK_MENSAJE_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table MENSAJE
   add constraint FK_MENSAJE_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table MENSAJE
   add constraint FK_MENSAJE_REFERENCE_MENSAJE foreign key (ID_RESPUESTA)
      references MENSAJE (ID_MENSAJE);

alter table MENSAJE_OFERTA
   add constraint FK_MENSAJE__REFERENCE_OFERTAR foreign key (ID_OFERTAR)
      references OFERTAR (ID_OFERTAR);

alter table MENSAJE_OFERTA
   add constraint FK_MENSAJE__REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table OFERTAR
   add constraint FK_OFERTAR_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table OFERTAR
   add constraint FK_OFERTAR_REFERENCE_ESPECIAL foreign key (ID_ESPECIALIDAD)
      references ESPECIALIDAD (ID_ESPECIALIDAD);

alter table OFERTAR
   add constraint FK_OFERTAR_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table OFERTAR
   add constraint FK_OFERTAR_REFERENCE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION);

alter table OFERTAR
   add constraint FK_OFERTAR_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table OFERTAR
   add constraint FK_OFERTAR_REFERENCE_COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA);

alter table PUBLICACION
   add constraint FK_PUBLICAC_REFERENCE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION);

alter table PUBLICACION
   add constraint FK_PUBLICAC_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table PUBLICACION
   add constraint FK_PUBLICAC_REFERENCE_COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA);

alter table PUBLICACION
   add constraint FK_PUBLICAC_REFERENCE_ESPECIAL foreign key (ID_ESPECIALIDAD)
      references ESPECIALIDAD (ID_ESPECIALIDAD);

alter table PUBLICACION
   add constraint FK_PUBLICAC_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table PUBLICACION
   add constraint FK_PUBLICAC_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table REGION
   add constraint FK_REGION_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table SUBCATEGORIA
   add constraint FK_SUBCATEG_REFERENCE_CATEGORI foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA);

alter table SUSCRIPCION_ACTIVA
   add constraint FK_SUSCRIPC_REFERENCE_SUSCRIPC foreign key (ID_SUSCRIPCION)
      references SUSCRIPCION (ID_SUSCRIPCION);

alter table TOKEN_PUSH
   add constraint FK_TOKEN_PU_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table TRABAJO
   add constraint FK_TRABAJO_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table TRABAJO
   add constraint FK_TRABAJO_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_REGION foreign key (ID_REGION)
      references REGION (ID_REGION);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_COMUNA foreign key (ID_COMUNA)
      references COMUNA (ID_COMUNA);

alter table USUARIO
   add constraint FK_USUARIO_REFERENCE_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS);

alter table VIDEO
   add constraint FK_VIDEO_REFERENCE_PUBLICAC foreign key (ID_PUBLICACION)
      references PUBLICACION (ID_PUBLICACION);

alter table VIDEO
   add constraint FK_VIDEO_REFERENCE_OFERTAR foreign key (ID_OFERTAR)
      references OFERTAR (ID_OFERTAR);

alter table VIDEO
   add constraint FK_VIDEO_REFERENCE_TRABAJO foreign key (ID_TRABAJOS)
      references TRABAJO (ID_TRABAJOS);

