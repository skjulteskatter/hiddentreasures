-- +goose Up
/***********************************************************/
/*** SCRIPT AUTHOR: Fredrik Vedvik (fredrik@vedvik.tech) ***/
/***    CREATED ON: 2023-03-27T16:19:11.693Z             ***/
/***********************************************************/

--- BEGIN CREATE TABLE "public"."track_types" ---

CREATE TABLE IF NOT EXISTS "public"."track_types" (
                                                      "date_created" timestamptz NULL  ,
                                                      "date_updated" timestamptz NULL  ,
                                                      "id" varchar(255) NOT NULL DEFAULT NULL::character varying ,
                                                      "label" text NOT NULL  ,
                                                      "user_created" uuid NULL  ,
                                                      "user_updated" uuid NULL  ,
                                                      CONSTRAINT "track_types_pkey" PRIMARY KEY (id) ,
                                                      CONSTRAINT "track_types_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
                                                      CONSTRAINT "track_types_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id)
);

ALTER TABLE IF EXISTS "public"."track_types" OWNER TO app;

GRANT SELECT ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."track_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."track_types"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."track_types"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."track_types"."id"  IS NULL;


COMMENT ON COLUMN "public"."track_types"."label"  IS NULL;


COMMENT ON COLUMN "public"."track_types"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."track_types"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "track_types_pkey" ON "public"."track_types" IS NULL;


COMMENT ON CONSTRAINT "track_types_user_created_foreign" ON "public"."track_types" IS NULL;


COMMENT ON CONSTRAINT "track_types_user_updated_foreign" ON "public"."track_types" IS NULL;

COMMENT ON TABLE "public"."track_types"  IS NULL;

--- END CREATE TABLE "public"."track_types" ---

--- BEGIN CREATE TABLE "public"."video_types" ---

CREATE TABLE IF NOT EXISTS "public"."video_types" (
                                                      "date_created" timestamptz NULL  ,
                                                      "date_updated" timestamptz NULL  ,
                                                      "id" varchar(255) NOT NULL DEFAULT NULL::character varying ,
                                                      "label" text NOT NULL  ,
                                                      "user_created" uuid NULL  ,
                                                      "user_updated" uuid NULL  ,
                                                      CONSTRAINT "video_types_pkey" PRIMARY KEY (id) ,
                                                      CONSTRAINT "video_types_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
                                                      CONSTRAINT "video_types_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id)
);

ALTER TABLE IF EXISTS "public"."video_types" OWNER TO app;

GRANT SELECT ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."video_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."video_types"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."video_types"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."video_types"."id"  IS NULL;


COMMENT ON COLUMN "public"."video_types"."label"  IS NULL;


COMMENT ON COLUMN "public"."video_types"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."video_types"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "video_types_pkey" ON "public"."video_types" IS NULL;


COMMENT ON CONSTRAINT "video_types_user_created_foreign" ON "public"."video_types" IS NULL;


COMMENT ON CONSTRAINT "video_types_user_updated_foreign" ON "public"."video_types" IS NULL;

COMMENT ON TABLE "public"."video_types"  IS NULL;

--- END CREATE TABLE "public"."video_types" ---

--- BEGIN CREATE SEQUENCE "public"."contributors_files_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."contributors_files_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."contributors_files_id_seq" OWNER TO app;
GRANT SELECT ON SEQUENCE "public"."contributors_files_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."contributors_files_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."contributors_files_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON SEQUENCE "public"."contributors_files_id_seq"  IS NULL;

--- END CREATE SEQUENCE "public"."contributors_files_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."songs_assets_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."songs_assets_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."songs_assets_id_seq" OWNER TO app;
GRANT SELECT ON SEQUENCE "public"."songs_assets_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."songs_assets_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."songs_assets_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON SEQUENCE "public"."songs_assets_id_seq"  IS NULL;

--- END CREATE SEQUENCE "public"."songs_assets_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."songs_categories_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."songs_categories_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."songs_categories_id_seq" OWNER TO app;
GRANT SELECT ON SEQUENCE "public"."songs_categories_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."songs_categories_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."songs_categories_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON SEQUENCE "public"."songs_categories_id_seq"  IS NULL;

--- END CREATE SEQUENCE "public"."songs_categories_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."songs_contributors_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."songs_contributors_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."songs_contributors_id_seq" OWNER TO app;
GRANT SELECT ON SEQUENCE "public"."songs_contributors_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."songs_contributors_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."songs_contributors_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON SEQUENCE "public"."songs_contributors_id_seq"  IS NULL;

--- END CREATE SEQUENCE "public"."songs_contributors_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."songs_tags_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."songs_tags_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."songs_tags_id_seq" OWNER TO app;
GRANT SELECT ON SEQUENCE "public"."songs_tags_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."songs_tags_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."songs_tags_id_seq" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON SEQUENCE "public"."songs_tags_id_seq"  IS NULL;

--- END CREATE SEQUENCE "public"."songs_tags_id_seq" ---

--- BEGIN CREATE TABLE "public"."assets" ---

CREATE TABLE IF NOT EXISTS "public"."assets" (
	"date_created" timestamptz NULL  ,
	"date_updated" timestamptz NULL  ,
	"file" uuid NOT NULL  ,
	"id" uuid NOT NULL  ,
	"status" varchar(255) NOT NULL DEFAULT 'draft'::character varying ,
	"track_type" varchar(255) NULL DEFAULT NULL::character varying ,
	"type" varchar(255) NOT NULL DEFAULT NULL::character varying ,
	"user_created" uuid NULL  ,
	"user_updated" uuid NULL  ,
	"video_type" varchar(255) NULL DEFAULT NULL::character varying ,
	CONSTRAINT "assets_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "assets_file_foreign" FOREIGN KEY (file) REFERENCES directus_files(id) ,
	CONSTRAINT "assets_track_type_foreign" FOREIGN KEY (track_type) REFERENCES track_types(id) ,
	CONSTRAINT "assets_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
	CONSTRAINT "assets_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) ,
	CONSTRAINT "assets_video_type_foreign" FOREIGN KEY (video_type) REFERENCES video_types(id) 
);

ALTER TABLE IF EXISTS "public"."assets" OWNER TO app;

GRANT SELECT ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."assets"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."assets"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."assets"."file"  IS NULL;


COMMENT ON COLUMN "public"."assets"."id"  IS NULL;


COMMENT ON COLUMN "public"."assets"."status"  IS NULL;


COMMENT ON COLUMN "public"."assets"."track_type"  IS NULL;


COMMENT ON COLUMN "public"."assets"."type"  IS NULL;


COMMENT ON COLUMN "public"."assets"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."assets"."user_updated"  IS NULL;


COMMENT ON COLUMN "public"."assets"."video_type"  IS NULL;

COMMENT ON CONSTRAINT "assets_pkey" ON "public"."assets" IS NULL;


COMMENT ON CONSTRAINT "assets_file_foreign" ON "public"."assets" IS NULL;


COMMENT ON CONSTRAINT "assets_track_type_foreign" ON "public"."assets" IS NULL;


COMMENT ON CONSTRAINT "assets_user_created_foreign" ON "public"."assets" IS NULL;


COMMENT ON CONSTRAINT "assets_user_updated_foreign" ON "public"."assets" IS NULL;


COMMENT ON CONSTRAINT "assets_video_type_foreign" ON "public"."assets" IS NULL;

COMMENT ON TABLE "public"."assets"  IS NULL;

--- END CREATE TABLE "public"."assets" ---

--- BEGIN CREATE TABLE "public"."categories" ---

CREATE TABLE IF NOT EXISTS "public"."categories" (
	"date_created" timestamptz NULL  ,
	"date_updated" timestamptz NULL  ,
	"id" uuid NOT NULL  ,
	"status" varchar(255) NOT NULL DEFAULT 'draft'::character varying ,
	"title" text NOT NULL  ,
	"user_created" uuid NULL  ,
	"user_updated" uuid NULL  ,
	CONSTRAINT "categories_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "categories_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
	CONSTRAINT "categories_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."categories" OWNER TO app;

GRANT SELECT ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."categories"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."categories"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."categories"."id"  IS NULL;


COMMENT ON COLUMN "public"."categories"."status"  IS NULL;


COMMENT ON COLUMN "public"."categories"."title"  IS NULL;


COMMENT ON COLUMN "public"."categories"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."categories"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "categories_pkey" ON "public"."categories" IS NULL;


COMMENT ON CONSTRAINT "categories_user_created_foreign" ON "public"."categories" IS NULL;


COMMENT ON CONSTRAINT "categories_user_updated_foreign" ON "public"."categories" IS NULL;

COMMENT ON TABLE "public"."categories"  IS NULL;

--- END CREATE TABLE "public"."categories" ---

--- BEGIN CREATE TABLE "public"."contributors" ---

CREATE TABLE IF NOT EXISTS "public"."contributors" (
	"birth_date" date NULL  ,
	"date_created" timestamptz NULL  ,
	"date_updated" timestamptz NULL  ,
	"death_date" date NULL  ,
	"display_name" text NULL  ,
	"first_name" varchar(255) NULL DEFAULT NULL::character varying ,
	"id" uuid NOT NULL  ,
	"last_name" varchar(255) NULL DEFAULT NULL::character varying ,
	"middle_name" varchar(255) NULL DEFAULT NULL::character varying ,
	"status" varchar(255) NOT NULL DEFAULT 'draft'::character varying ,
	"user_created" uuid NULL  ,
	"user_updated" uuid NULL  ,
	CONSTRAINT "contributors_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "contributors_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
	CONSTRAINT "contributors_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."contributors" OWNER TO app;

GRANT SELECT ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."contributors"."birth_date"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."death_date"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."display_name"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."first_name"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."id"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."last_name"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."middle_name"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."status"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."contributors"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "contributors_pkey" ON "public"."contributors" IS NULL;


COMMENT ON CONSTRAINT "contributors_user_created_foreign" ON "public"."contributors" IS NULL;


COMMENT ON CONSTRAINT "contributors_user_updated_foreign" ON "public"."contributors" IS NULL;

COMMENT ON TABLE "public"."contributors"  IS NULL;

--- END CREATE TABLE "public"."contributors" ---

--- BEGIN CREATE TABLE "public"."contributors_files" ---

CREATE TABLE IF NOT EXISTS "public"."contributors_files" (
	"contributors_id" uuid NULL  ,
	"directus_files_id" uuid NULL  ,
	"id" int4 NOT NULL DEFAULT nextval('contributors_files_id_seq'::regclass) ,
	"sort" int4 NULL  ,
	CONSTRAINT "contributors_files_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "contributors_files_contributors_id_foreign" FOREIGN KEY (contributors_id) REFERENCES contributors(id) ON DELETE CASCADE ,
	CONSTRAINT "contributors_files_directus_files_id_foreign" FOREIGN KEY (directus_files_id) REFERENCES directus_files(id) ON DELETE CASCADE 
);

ALTER TABLE IF EXISTS "public"."contributors_files" OWNER TO app;

GRANT SELECT ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."contributors_files" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."contributors_files"."contributors_id"  IS NULL;


COMMENT ON COLUMN "public"."contributors_files"."directus_files_id"  IS NULL;


COMMENT ON COLUMN "public"."contributors_files"."id"  IS NULL;


COMMENT ON COLUMN "public"."contributors_files"."sort"  IS NULL;

COMMENT ON CONSTRAINT "contributors_files_pkey" ON "public"."contributors_files" IS NULL;


COMMENT ON CONSTRAINT "contributors_files_contributors_id_foreign" ON "public"."contributors_files" IS NULL;


COMMENT ON CONSTRAINT "contributors_files_directus_files_id_foreign" ON "public"."contributors_files" IS NULL;

COMMENT ON TABLE "public"."contributors_files"  IS NULL;

--- END CREATE TABLE "public"."contributors_files" ---

--- BEGIN CREATE TABLE "public"."languages" ---

CREATE TABLE IF NOT EXISTS "public"."languages" (
	"code" varchar(255) NOT NULL DEFAULT NULL::character varying ,
	"date_created" timestamptz NULL  ,
	"date_updated" timestamptz NULL  ,
	"label" varchar(255) NOT NULL DEFAULT NULL::character varying ,
	"user_created" uuid NULL  ,
	"user_updated" uuid NULL  ,
	CONSTRAINT "languages_pkey" PRIMARY KEY (code) ,
	CONSTRAINT "languages_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
	CONSTRAINT "languages_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."languages" OWNER TO app;

GRANT SELECT ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."languages" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."languages"."code"  IS NULL;


COMMENT ON COLUMN "public"."languages"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."languages"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."languages"."label"  IS NULL;


COMMENT ON COLUMN "public"."languages"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."languages"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "languages_pkey" ON "public"."languages" IS NULL;


COMMENT ON CONSTRAINT "languages_user_created_foreign" ON "public"."languages" IS NULL;


COMMENT ON CONSTRAINT "languages_user_updated_foreign" ON "public"."languages" IS NULL;

COMMENT ON TABLE "public"."languages"  IS NULL;

--- END CREATE TABLE "public"."languages" ---

--- BEGIN CREATE TABLE "public"."participant_types" ---

CREATE TABLE IF NOT EXISTS "public"."participant_types" (
	"date_created" timestamptz NULL  ,
	"date_updated" timestamptz NULL  ,
	"id" varchar(255) NOT NULL DEFAULT NULL::character varying ,
	"label" text NOT NULL  ,
	"user_created" uuid NULL  ,
	"user_updated" uuid NULL  ,
	CONSTRAINT "participant_types_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "participant_types_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
	CONSTRAINT "participant_types_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."participant_types" OWNER TO app;

GRANT SELECT ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."participant_types" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."participant_types"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."participant_types"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."participant_types"."id"  IS NULL;


COMMENT ON COLUMN "public"."participant_types"."label"  IS NULL;


COMMENT ON COLUMN "public"."participant_types"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."participant_types"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "participant_types_pkey" ON "public"."participant_types" IS NULL;


COMMENT ON CONSTRAINT "participant_types_user_created_foreign" ON "public"."participant_types" IS NULL;


COMMENT ON CONSTRAINT "participant_types_user_updated_foreign" ON "public"."participant_types" IS NULL;

COMMENT ON TABLE "public"."participant_types"  IS NULL;

--- END CREATE TABLE "public"."participant_types" ---

--- BEGIN CREATE TABLE "public"."songs" ---

CREATE TABLE IF NOT EXISTS "public"."songs" (
	"date_created" timestamptz NULL  ,
	"date_updated" timestamptz NULL  ,
	"id" uuid NOT NULL  ,
	"status" varchar(255) NOT NULL DEFAULT 'draft'::character varying ,
	"title" text NOT NULL  ,
	"user_created" uuid NULL  ,
	"user_updated" uuid NULL  ,
	CONSTRAINT "songs_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "songs_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
	CONSTRAINT "songs_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."songs" OWNER TO app;

GRANT SELECT ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."songs" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."songs"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."songs"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."songs"."id"  IS NULL;


COMMENT ON COLUMN "public"."songs"."status"  IS NULL;


COMMENT ON COLUMN "public"."songs"."title"  IS NULL;


COMMENT ON COLUMN "public"."songs"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."songs"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "songs_pkey" ON "public"."songs" IS NULL;


COMMENT ON CONSTRAINT "songs_user_created_foreign" ON "public"."songs" IS NULL;


COMMENT ON CONSTRAINT "songs_user_updated_foreign" ON "public"."songs" IS NULL;

COMMENT ON TABLE "public"."songs"  IS NULL;

--- END CREATE TABLE "public"."songs" ---

--- BEGIN CREATE TABLE "public"."songs_assets" ---

CREATE TABLE IF NOT EXISTS "public"."songs_assets" (
	"assets_id" uuid NULL  ,
	"id" int4 NOT NULL DEFAULT nextval('songs_assets_id_seq'::regclass) ,
	"songs_id" uuid NULL  ,
	"sort" int4 NULL  ,
	CONSTRAINT "songs_assets_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "songs_assets_assets_id_foreign" FOREIGN KEY (assets_id) REFERENCES assets(id) ON DELETE CASCADE ,
	CONSTRAINT "songs_assets_songs_id_foreign" FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE 
);

ALTER TABLE IF EXISTS "public"."songs_assets" OWNER TO app;

GRANT SELECT ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."songs_assets" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."songs_assets"."assets_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_assets"."id"  IS NULL;


COMMENT ON COLUMN "public"."songs_assets"."songs_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_assets"."sort"  IS NULL;

COMMENT ON CONSTRAINT "songs_assets_pkey" ON "public"."songs_assets" IS NULL;


COMMENT ON CONSTRAINT "songs_assets_assets_id_foreign" ON "public"."songs_assets" IS NULL;


COMMENT ON CONSTRAINT "songs_assets_songs_id_foreign" ON "public"."songs_assets" IS NULL;

COMMENT ON TABLE "public"."songs_assets"  IS NULL;

--- END CREATE TABLE "public"."songs_assets" ---

--- BEGIN CREATE TABLE "public"."songs_categories" ---

CREATE TABLE IF NOT EXISTS "public"."songs_categories" (
	"categories_id" uuid NULL  ,
	"id" int4 NOT NULL DEFAULT nextval('songs_categories_id_seq'::regclass) ,
	"songs_id" uuid NULL  ,
	"sort" int4 NULL  ,
	CONSTRAINT "songs_categories_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "songs_categories_categories_id_foreign" FOREIGN KEY (categories_id) REFERENCES categories(id) ON DELETE CASCADE ,
	CONSTRAINT "songs_categories_songs_id_foreign" FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE 
);

ALTER TABLE IF EXISTS "public"."songs_categories" OWNER TO app;

GRANT SELECT ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."songs_categories" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."songs_categories"."categories_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_categories"."id"  IS NULL;


COMMENT ON COLUMN "public"."songs_categories"."songs_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_categories"."sort"  IS NULL;

COMMENT ON CONSTRAINT "songs_categories_pkey" ON "public"."songs_categories" IS NULL;


COMMENT ON CONSTRAINT "songs_categories_categories_id_foreign" ON "public"."songs_categories" IS NULL;


COMMENT ON CONSTRAINT "songs_categories_songs_id_foreign" ON "public"."songs_categories" IS NULL;

COMMENT ON TABLE "public"."songs_categories"  IS NULL;

--- END CREATE TABLE "public"."songs_categories" ---

--- BEGIN CREATE TABLE "public"."songs_contributors" ---

CREATE TABLE IF NOT EXISTS "public"."songs_contributors" (
	"contributors_id" uuid NULL  ,
	"id" int4 NOT NULL DEFAULT nextval('songs_contributors_id_seq'::regclass) ,
	"songs_id" uuid NULL  ,
	"sort" int4 NULL  ,
	"type" varchar(255) NOT NULL DEFAULT NULL::character varying ,
	CONSTRAINT "songs_contributors_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "songs_contributors_contributors_id_foreign" FOREIGN KEY (contributors_id) REFERENCES contributors(id) ON DELETE CASCADE ,
	CONSTRAINT "songs_contributors_songs_id_foreign" FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE 
);

ALTER TABLE IF EXISTS "public"."songs_contributors" OWNER TO app;

GRANT SELECT ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."songs_contributors" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."songs_contributors"."contributors_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_contributors"."id"  IS NULL;


COMMENT ON COLUMN "public"."songs_contributors"."songs_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_contributors"."sort"  IS NULL;


COMMENT ON COLUMN "public"."songs_contributors"."type"  IS NULL;

COMMENT ON CONSTRAINT "songs_contributors_pkey" ON "public"."songs_contributors" IS NULL;


COMMENT ON CONSTRAINT "songs_contributors_contributors_id_foreign" ON "public"."songs_contributors" IS NULL;


COMMENT ON CONSTRAINT "songs_contributors_songs_id_foreign" ON "public"."songs_contributors" IS NULL;

COMMENT ON TABLE "public"."songs_contributors"  IS NULL;

--- END CREATE TABLE "public"."songs_contributors" ---

--- BEGIN CREATE TABLE "public"."tags" ---

CREATE TABLE IF NOT EXISTS "public"."tags" (
                                               "date_created" timestamptz NULL  ,
                                               "date_updated" timestamptz NULL  ,
                                               "id" uuid NOT NULL  ,
                                               "status" varchar(255) NOT NULL DEFAULT 'draft'::character varying ,
                                               "title" text NOT NULL  ,
                                               "user_created" uuid NULL  ,
                                               "user_updated" uuid NULL  ,
                                               CONSTRAINT "tags_pkey" PRIMARY KEY (id) ,
                                               CONSTRAINT "tags_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ,
                                               CONSTRAINT "tags_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id)
);

ALTER TABLE IF EXISTS "public"."tags" OWNER TO app;

GRANT SELECT ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."tags"."date_created"  IS NULL;


COMMENT ON COLUMN "public"."tags"."date_updated"  IS NULL;


COMMENT ON COLUMN "public"."tags"."id"  IS NULL;


COMMENT ON COLUMN "public"."tags"."status"  IS NULL;


COMMENT ON COLUMN "public"."tags"."title"  IS NULL;


COMMENT ON COLUMN "public"."tags"."user_created"  IS NULL;


COMMENT ON COLUMN "public"."tags"."user_updated"  IS NULL;

COMMENT ON CONSTRAINT "tags_pkey" ON "public"."tags" IS NULL;


COMMENT ON CONSTRAINT "tags_user_created_foreign" ON "public"."tags" IS NULL;


COMMENT ON CONSTRAINT "tags_user_updated_foreign" ON "public"."tags" IS NULL;

COMMENT ON TABLE "public"."tags"  IS NULL;

--- END CREATE TABLE "public"."tags" ---

--- BEGIN CREATE TABLE "public"."songs_tags" ---

CREATE TABLE IF NOT EXISTS "public"."songs_tags" (
	"id" int4 NOT NULL DEFAULT nextval('songs_tags_id_seq'::regclass) ,
	"songs_id" uuid NULL  ,
	"sort" int4 NULL  ,
	"tags_id" uuid NULL  ,
	CONSTRAINT "songs_tags_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "songs_tags_songs_id_foreign" FOREIGN KEY (songs_id) REFERENCES songs(id) ON DELETE CASCADE ,
	CONSTRAINT "songs_tags_tags_id_foreign" FOREIGN KEY (tags_id) REFERENCES tags(id) ON DELETE CASCADE 
);

ALTER TABLE IF EXISTS "public"."songs_tags" OWNER TO app;

GRANT SELECT ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."songs_tags" TO app; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

COMMENT ON COLUMN "public"."songs_tags"."id"  IS NULL;


COMMENT ON COLUMN "public"."songs_tags"."songs_id"  IS NULL;


COMMENT ON COLUMN "public"."songs_tags"."sort"  IS NULL;


COMMENT ON COLUMN "public"."songs_tags"."tags_id"  IS NULL;

COMMENT ON CONSTRAINT "songs_tags_pkey" ON "public"."songs_tags" IS NULL;


COMMENT ON CONSTRAINT "songs_tags_songs_id_foreign" ON "public"."songs_tags" IS NULL;


COMMENT ON CONSTRAINT "songs_tags_tags_id_foreign" ON "public"."songs_tags" IS NULL;

COMMENT ON TABLE "public"."songs_tags"  IS NULL;

--- END CREATE TABLE "public"."songs_tags" ---

--- BEGIN SYNCHRONIZE TABLE "public"."directus_collections" RECORDS ---

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('categories', 'category', NULL, '{{title}}', false, false, NULL, 'status', true, 'archived', 'draft', NULL, 'all', '#A2B5CD', NULL, 3, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('contributors', 'person', NULL, '{{display_name}}', false, false, NULL, 'status', true, 'archived', 'draft', NULL, 'all', '#3399FF', NULL, 1, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('contributors_files', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 6, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('languages', 'language', NULL, '{{label}}', false, false, NULL, NULL, true, NULL, NULL, NULL, 'all', '#2ECDA7', NULL, 5, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('participant_types', NULL, NULL, '{{label}}', true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 7, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('songs', 'music_note', NULL, '{{title}}', false, false, NULL, 'status', true, 'archived', 'draft', NULL, 'all', '#FFA439', NULL, 2, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('assets', 'file_present', NULL, NULL, false, false, NULL, 'status', true, 'archived', 'draft', NULL, 'all', '#E35169', NULL, 1, 'songs', 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('songs_assets', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 10, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('songs_categories', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 11, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('songs_contributors', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 12, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('songs_tags', 'import_export', NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 13, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('tags', 'tag', NULL, '{{title}}', false, false, NULL, 'status', true, 'archived', 'draft', NULL, 'all', '#FFC23B', NULL, 4, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('track_types', NULL, NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 8, NULL, 'open');

INSERT INTO "public"."directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse")  VALUES ('video_types', NULL, NULL, NULL, true, false, NULL, NULL, true, NULL, NULL, NULL, 'all', NULL, NULL, 9, NULL, 'open');

--- END SYNCHRONIZE TABLE "public"."directus_collections" RECORDS ---

--- BEGIN SYNCHRONIZE TABLE "public"."directus_fields" RECORDS ---

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (1, 'categories', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (2, 'categories', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (3, 'categories', 'id', 'uuid', 'input', NULL, NULL, NULL, true, false, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (4, 'categories', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}],"showAsDot":true}', false, false, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (5, 'categories', 'title', NULL, 'input', NULL, 'raw', NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (6, 'categories', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (7, 'categories', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (8, 'contributors', 'birth_date', NULL, 'datetime', NULL, 'datetime', NULL, false, false, 1, 'half', NULL, NULL, NULL, false, 'details', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (9, 'contributors', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 4, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (10, 'contributors', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (11, 'contributors', 'death_date', NULL, 'datetime', NULL, 'datetime', NULL, false, false, 2, 'half', NULL, NULL, NULL, false, 'details', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (12, 'contributors', 'details', 'alias,group,no-data', 'group-detail', NULL, NULL, NULL, false, false, 8, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (13, 'contributors', 'display_name', NULL, 'input', NULL, 'raw', NULL, false, false, 1, 'full', NULL, NULL, NULL, false, 'name', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (14, 'contributors', 'first_name', NULL, 'input', NULL, 'raw', NULL, false, false, 2, 'half', NULL, NULL, NULL, false, 'name', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (15, 'contributors', 'id', 'uuid', 'input', NULL, NULL, NULL, true, false, 1, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (16, 'contributors', 'images', 'files', 'files', NULL, 'related-values', NULL, false, false, 9, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (17, 'contributors', 'last_name', NULL, 'input', NULL, 'raw', NULL, false, false, 4, 'full', NULL, NULL, NULL, false, 'name', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (18, 'contributors', 'middle_name', NULL, 'input', NULL, 'raw', NULL, false, false, 3, 'half', NULL, NULL, NULL, false, 'name', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (19, 'contributors', 'name', 'alias,group,no-data', 'group-detail', NULL, NULL, NULL, false, false, 7, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (20, 'contributors', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}],"showAsDot":true}', false, false, 2, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (21, 'contributors', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 3, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (22, 'contributors', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (23, 'contributors_files', 'contributors_id', NULL, 'select-dropdown-m2o', NULL, 'related-values', NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (24, 'contributors_files', 'directus_files_id', NULL, 'select-dropdown-m2o', NULL, 'related-values', NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (25, 'contributors_files', 'id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (26, 'contributors_files', 'sort', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (27, 'languages', 'code', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (28, 'languages', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (29, 'languages', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (30, 'languages', 'label', NULL, 'input', NULL, 'raw', NULL, false, false, NULL, 'full', NULL, 'For internal use', NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (31, 'languages', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (32, 'languages', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (33, 'participant_types', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (34, 'participant_types', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (35, 'participant_types', 'id', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (36, 'participant_types', 'label', NULL, 'input', NULL, 'raw', NULL, false, false, NULL, 'full', NULL, 'For internal use', NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (37, 'participant_types', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (38, 'participant_types', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (39, 'songs', 'assets', 'm2m', 'list-m2m', NULL, 'related-values', NULL, false, false, 8, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (40, 'songs', 'categories', 'm2m', 'list-m2m', NULL, 'related-values', NULL, false, false, 2, 'full', NULL, NULL, NULL, false, 'metadata', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (41, 'songs', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 4, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (42, 'songs', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (43, 'songs', 'id', 'uuid', 'input', NULL, NULL, NULL, true, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (44, 'songs', 'metadata', 'alias,group,no-data', 'group-detail', NULL, NULL, NULL, false, false, 10, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (45, 'songs', 'participants', 'm2m', 'list-m2m', '{"allowDuplicates":true,"junctionFieldLocation":"top","template":"{{contributors_id.display_name}} - {{type}}"}', 'related-values', '{"template":"{{contributors_id.display_name}} - {{type}}"}', false, false, 9, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (46, 'songs', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}],"showAsDot":true}', false, false, 2, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (47, 'songs', 'tags', 'm2m', 'list-m2m', NULL, 'related-values', NULL, false, false, 1, 'full', NULL, NULL, NULL, false, 'metadata', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (48, 'songs', 'title', NULL, 'input', NULL, 'raw', NULL, false, false, 7, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (49, 'songs', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 3, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (50, 'songs', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (51, 'assets', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 4, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (52, 'assets', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, 6, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (53, 'assets', 'file', 'file', 'file', NULL, 'file', NULL, false, false, 9, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (54, 'assets', 'id', 'uuid', 'input', NULL, NULL, NULL, true, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (55, 'assets', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}],"showAsDot":true}', false, false, 2, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (56, 'assets', 'track', 'alias,group,no-data', 'group-detail', NULL, NULL, NULL, false, false, 10, 'full', NULL, NULL, '[{"name":"Show if type track","rule":{"_and":[{"type":{"_neq":"track"}}]},"hidden":true,"options":{"start":"open"}}]', false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (57, 'assets', 'track_type', 'm2o', 'select-dropdown-m2o', NULL, 'related-values', NULL, false, false, 1, 'full', NULL, NULL, NULL, false, 'track', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (58, 'assets', 'type', NULL, 'select-dropdown', '{"choices":[{"text":"Track","value":"track"},{"text":"Video","value":"video"},{"text":"Sheetmusic","value":"sheetmusic"}]}', 'labels', NULL, false, false, 8, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (59, 'assets', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 3, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (60, 'assets', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, 5, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (61, 'assets', 'video', 'alias,group,no-data', 'group-detail', NULL, NULL, NULL, false, false, 11, 'full', NULL, NULL, '[{"name":"Show if video","rule":{"_and":[{"type":{"_neq":"video"}}]},"hidden":true,"options":{"start":"open"}}]', false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (62, 'assets', 'video_type', 'm2o', 'select-dropdown-m2o', NULL, 'related-values', NULL, false, false, 1, 'full', NULL, NULL, NULL, false, 'video', NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (63, 'songs_assets', 'assets_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (64, 'songs_assets', 'id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (65, 'songs_assets', 'songs_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (66, 'songs_assets', 'sort', NULL, NULL, NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (67, 'songs_categories', 'categories_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (68, 'songs_categories', 'id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (69, 'songs_categories', 'songs_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (70, 'songs_categories', 'sort', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (71, 'songs_contributors', 'contributors_id', NULL, NULL, NULL, NULL, NULL, false, true, 3, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (72, 'songs_contributors', 'id', NULL, NULL, NULL, NULL, NULL, false, true, 1, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (73, 'songs_contributors', 'songs_id', NULL, NULL, NULL, NULL, NULL, false, true, 2, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (74, 'songs_contributors', 'sort', NULL, NULL, NULL, NULL, NULL, false, true, 4, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (75, 'songs_contributors', 'type', NULL, 'select-dropdown', '{"choices":[{"text":"Author","value":"author"},{"text":"Composer","value":"composer"},{"text":"Arranger","value":"arranger"},{"text":"Editor","value":"editor"}]}', NULL, NULL, false, false, 5, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (76, 'songs_tags', 'id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (77, 'songs_tags', 'songs_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (78, 'songs_tags', 'sort', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (79, 'songs_tags', 'tags_id', NULL, NULL, NULL, NULL, NULL, false, true, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (80, 'tags', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (81, 'tags', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (82, 'tags', 'id', 'uuid', 'input', NULL, NULL, NULL, true, false, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (83, 'tags', 'status', NULL, 'select-dropdown', '{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}', 'labels', '{"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}],"showAsDot":true}', false, false, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (84, 'tags', 'title', NULL, 'input', NULL, 'raw', NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (85, 'tags', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (86, 'tags', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (87, 'track_types', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (88, 'track_types', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (89, 'track_types', 'id', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (90, 'track_types', 'label', NULL, 'input', NULL, 'raw', NULL, false, false, NULL, 'full', NULL, 'For internal use', NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (91, 'track_types', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (92, 'track_types', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (93, 'video_types', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (94, 'video_types', 'date_updated', 'date-updated', 'datetime', NULL, 'datetime', '{"relative":true}', true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (95, 'video_types', 'id', NULL, 'input', NULL, NULL, NULL, false, false, NULL, 'full', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (96, 'video_types', 'label', NULL, 'input', NULL, 'raw', NULL, false, false, NULL, 'full', NULL, 'For internal use', NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (97, 'video_types', 'user_created', 'user-created', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

INSERT INTO "public"."directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message")  VALUES (98, 'video_types', 'user_updated', 'user-updated', 'select-dropdown-m2o', '{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}', 'user', NULL, true, true, NULL, 'half', NULL, NULL, NULL, false, NULL, NULL, NULL);

SELECT setval(pg_get_serial_sequence('"public"."directus_fields"', 'id'), max("id"), true) FROM "public"."directus_fields";

--- END SYNCHRONIZE TABLE "public"."directus_fields" RECORDS ---

--- BEGIN SYNCHRONIZE TABLE "public"."directus_relations" RECORDS ---

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (1, 'assets', 'file', 'directus_files', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (2, 'assets', 'track_type', 'track_types', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (3, 'assets', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (4, 'assets', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (5, 'assets', 'video_type', 'video_types', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (6, 'categories', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (7, 'categories', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (8, 'contributors', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (9, 'contributors', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (10, 'contributors_files', 'contributors_id', 'contributors', 'images', NULL, NULL, 'directus_files_id', 'sort', 'delete');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (11, 'contributors_files', 'directus_files_id', 'directus_files', NULL, NULL, NULL, 'contributors_id', NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (12, 'languages', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (13, 'languages', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (14, 'participant_types', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (15, 'participant_types', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (16, 'songs', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (17, 'songs', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (18, 'songs_assets', 'assets_id', 'assets', NULL, NULL, NULL, 'songs_id', NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (19, 'songs_assets', 'songs_id', 'songs', 'assets', NULL, NULL, 'assets_id', 'sort', 'delete');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (20, 'songs_categories', 'categories_id', 'categories', NULL, NULL, NULL, 'songs_id', NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (21, 'songs_categories', 'songs_id', 'songs', 'categories', NULL, NULL, 'categories_id', 'sort', 'delete');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (22, 'songs_contributors', 'contributors_id', 'contributors', NULL, NULL, NULL, 'songs_id', NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (23, 'songs_contributors', 'songs_id', 'songs', 'participants', NULL, NULL, 'contributors_id', 'sort', 'delete');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (24, 'songs_tags', 'songs_id', 'songs', 'tags', NULL, NULL, 'tags_id', 'sort', 'delete');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (25, 'songs_tags', 'tags_id', 'tags', NULL, NULL, NULL, 'songs_id', NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (26, 'tags', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (27, 'tags', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (28, 'track_types', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (29, 'track_types', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (30, 'video_types', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

INSERT INTO "public"."directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action")  VALUES (31, 'video_types', 'user_updated', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

SELECT setval(pg_get_serial_sequence('"public"."directus_relations"', 'id'), max("id"), true) FROM "public"."directus_relations";

--- END SYNCHRONIZE TABLE "public"."directus_relations" RECORDS ---
-- +goose Down
/***********************************************************/
/*** SCRIPT AUTHOR: Fredrik Vedvik (fredrik@vedvik.tech) ***/
/***    CREATED ON: 2023-03-27T16:19:12.097Z             ***/
/***********************************************************/

--- BEGIN DROP TABLE "public"."languages" ---

DROP TABLE IF EXISTS "public"."languages";

--- END DROP TABLE "public"."languages" ---

--- BEGIN DROP TABLE "public"."participant_types" ---

DROP TABLE IF EXISTS "public"."participant_types";

--- END DROP TABLE "public"."participant_types" ---

--- BEGIN DROP TABLE "public"."songs_assets" ---

DROP TABLE IF EXISTS "public"."songs_assets";

--- END DROP TABLE "public"."songs_assets" ---

--- BEGIN DROP TABLE "public"."songs_categories" ---

DROP TABLE IF EXISTS "public"."songs_categories";

--- END DROP TABLE "public"."songs_categories" ---

--- BEGIN DROP TABLE "public"."songs_contributors" ---

DROP TABLE IF EXISTS "public"."songs_contributors";

--- END DROP TABLE "public"."songs_contributors" ---

--- BEGIN DROP TABLE "public"."songs_tags" ---

DROP TABLE IF EXISTS "public"."songs_tags";

--- END DROP TABLE "public"."songs_tags" ---

--- BEGIN DROP TABLE "public"."songs" ---

DROP TABLE IF EXISTS "public"."songs";

--- END DROP TABLE "public"."songs" ---

--- BEGIN DROP TABLE "public"."tags" ---

DROP TABLE IF EXISTS "public"."tags";

--- END DROP TABLE "public"."tags" ---

--- BEGIN DROP TABLE "public"."assets" ---

DROP TABLE IF EXISTS "public"."assets";

--- END DROP TABLE "public"."assets" ---

--- BEGIN DROP TABLE "public"."track_types" ---

DROP TABLE IF EXISTS "public"."track_types";

--- END DROP TABLE "public"."track_types" ---

--- BEGIN DROP TABLE "public"."video_types" ---

DROP TABLE IF EXISTS "public"."video_types";

--- END DROP TABLE "public"."video_types" ---

--- BEGIN DROP TABLE "public"."categories" ---

DROP TABLE IF EXISTS "public"."categories";

--- END DROP TABLE "public"."categories" ---

--- BEGIN DROP TABLE "public"."contributors_files" ---

DROP TABLE IF EXISTS "public"."contributors_files";

--- END DROP TABLE "public"."contributors_files" ---

--- BEGIN DROP TABLE "public"."contributors" ---

DROP TABLE IF EXISTS "public"."contributors";

--- END DROP TABLE "public"."contributors" ---

--- BEGIN SYNCHRONIZE TABLE "public"."directus_collections" RECORDS ---

DELETE FROM "public"."directus_collections" WHERE "collection" = 'categories';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'contributors';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'contributors_files';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'languages';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'participant_types';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'assets';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'songs_assets';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'songs_categories';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'songs_contributors';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'songs_tags';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'tags';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'track_types';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'video_types';

DELETE FROM "public"."directus_collections" WHERE "collection" = 'songs';

--- END SYNCHRONIZE TABLE "public"."directus_collections" RECORDS ---

--- BEGIN SYNCHRONIZE TABLE "public"."directus_fields" RECORDS ---

DELETE FROM "public"."directus_fields" WHERE "id" = 1;

DELETE FROM "public"."directus_fields" WHERE "id" = 2;

DELETE FROM "public"."directus_fields" WHERE "id" = 3;

DELETE FROM "public"."directus_fields" WHERE "id" = 4;

DELETE FROM "public"."directus_fields" WHERE "id" = 5;

DELETE FROM "public"."directus_fields" WHERE "id" = 6;

DELETE FROM "public"."directus_fields" WHERE "id" = 7;

DELETE FROM "public"."directus_fields" WHERE "id" = 8;

DELETE FROM "public"."directus_fields" WHERE "id" = 9;

DELETE FROM "public"."directus_fields" WHERE "id" = 10;

DELETE FROM "public"."directus_fields" WHERE "id" = 11;

DELETE FROM "public"."directus_fields" WHERE "id" = 12;

DELETE FROM "public"."directus_fields" WHERE "id" = 13;

DELETE FROM "public"."directus_fields" WHERE "id" = 14;

DELETE FROM "public"."directus_fields" WHERE "id" = 15;

DELETE FROM "public"."directus_fields" WHERE "id" = 16;

DELETE FROM "public"."directus_fields" WHERE "id" = 17;

DELETE FROM "public"."directus_fields" WHERE "id" = 18;

DELETE FROM "public"."directus_fields" WHERE "id" = 19;

DELETE FROM "public"."directus_fields" WHERE "id" = 20;

DELETE FROM "public"."directus_fields" WHERE "id" = 21;

DELETE FROM "public"."directus_fields" WHERE "id" = 22;

DELETE FROM "public"."directus_fields" WHERE "id" = 23;

DELETE FROM "public"."directus_fields" WHERE "id" = 24;

DELETE FROM "public"."directus_fields" WHERE "id" = 25;

DELETE FROM "public"."directus_fields" WHERE "id" = 26;

DELETE FROM "public"."directus_fields" WHERE "id" = 27;

DELETE FROM "public"."directus_fields" WHERE "id" = 28;

DELETE FROM "public"."directus_fields" WHERE "id" = 29;

DELETE FROM "public"."directus_fields" WHERE "id" = 30;

DELETE FROM "public"."directus_fields" WHERE "id" = 31;

DELETE FROM "public"."directus_fields" WHERE "id" = 32;

DELETE FROM "public"."directus_fields" WHERE "id" = 33;

DELETE FROM "public"."directus_fields" WHERE "id" = 34;

DELETE FROM "public"."directus_fields" WHERE "id" = 35;

DELETE FROM "public"."directus_fields" WHERE "id" = 36;

DELETE FROM "public"."directus_fields" WHERE "id" = 37;

DELETE FROM "public"."directus_fields" WHERE "id" = 38;

DELETE FROM "public"."directus_fields" WHERE "id" = 39;

DELETE FROM "public"."directus_fields" WHERE "id" = 40;

DELETE FROM "public"."directus_fields" WHERE "id" = 41;

DELETE FROM "public"."directus_fields" WHERE "id" = 42;

DELETE FROM "public"."directus_fields" WHERE "id" = 43;

DELETE FROM "public"."directus_fields" WHERE "id" = 44;

DELETE FROM "public"."directus_fields" WHERE "id" = 45;

DELETE FROM "public"."directus_fields" WHERE "id" = 46;

DELETE FROM "public"."directus_fields" WHERE "id" = 47;

DELETE FROM "public"."directus_fields" WHERE "id" = 48;

DELETE FROM "public"."directus_fields" WHERE "id" = 49;

DELETE FROM "public"."directus_fields" WHERE "id" = 50;

DELETE FROM "public"."directus_fields" WHERE "id" = 51;

DELETE FROM "public"."directus_fields" WHERE "id" = 52;

DELETE FROM "public"."directus_fields" WHERE "id" = 53;

DELETE FROM "public"."directus_fields" WHERE "id" = 54;

DELETE FROM "public"."directus_fields" WHERE "id" = 55;

DELETE FROM "public"."directus_fields" WHERE "id" = 56;

DELETE FROM "public"."directus_fields" WHERE "id" = 57;

DELETE FROM "public"."directus_fields" WHERE "id" = 58;

DELETE FROM "public"."directus_fields" WHERE "id" = 59;

DELETE FROM "public"."directus_fields" WHERE "id" = 60;

DELETE FROM "public"."directus_fields" WHERE "id" = 61;

DELETE FROM "public"."directus_fields" WHERE "id" = 62;

DELETE FROM "public"."directus_fields" WHERE "id" = 63;

DELETE FROM "public"."directus_fields" WHERE "id" = 64;

DELETE FROM "public"."directus_fields" WHERE "id" = 65;

DELETE FROM "public"."directus_fields" WHERE "id" = 66;

DELETE FROM "public"."directus_fields" WHERE "id" = 67;

DELETE FROM "public"."directus_fields" WHERE "id" = 68;

DELETE FROM "public"."directus_fields" WHERE "id" = 69;

DELETE FROM "public"."directus_fields" WHERE "id" = 70;

DELETE FROM "public"."directus_fields" WHERE "id" = 71;

DELETE FROM "public"."directus_fields" WHERE "id" = 72;

DELETE FROM "public"."directus_fields" WHERE "id" = 73;

DELETE FROM "public"."directus_fields" WHERE "id" = 74;

DELETE FROM "public"."directus_fields" WHERE "id" = 75;

DELETE FROM "public"."directus_fields" WHERE "id" = 76;

DELETE FROM "public"."directus_fields" WHERE "id" = 77;

DELETE FROM "public"."directus_fields" WHERE "id" = 78;

DELETE FROM "public"."directus_fields" WHERE "id" = 79;

DELETE FROM "public"."directus_fields" WHERE "id" = 80;

DELETE FROM "public"."directus_fields" WHERE "id" = 81;

DELETE FROM "public"."directus_fields" WHERE "id" = 82;

DELETE FROM "public"."directus_fields" WHERE "id" = 83;

DELETE FROM "public"."directus_fields" WHERE "id" = 84;

DELETE FROM "public"."directus_fields" WHERE "id" = 85;

DELETE FROM "public"."directus_fields" WHERE "id" = 86;

DELETE FROM "public"."directus_fields" WHERE "id" = 87;

DELETE FROM "public"."directus_fields" WHERE "id" = 88;

DELETE FROM "public"."directus_fields" WHERE "id" = 89;

DELETE FROM "public"."directus_fields" WHERE "id" = 90;

DELETE FROM "public"."directus_fields" WHERE "id" = 91;

DELETE FROM "public"."directus_fields" WHERE "id" = 92;

DELETE FROM "public"."directus_fields" WHERE "id" = 93;

DELETE FROM "public"."directus_fields" WHERE "id" = 94;

DELETE FROM "public"."directus_fields" WHERE "id" = 95;

DELETE FROM "public"."directus_fields" WHERE "id" = 96;

DELETE FROM "public"."directus_fields" WHERE "id" = 97;

DELETE FROM "public"."directus_fields" WHERE "id" = 98;

SELECT setval(pg_get_serial_sequence('"public"."directus_fields"', 'id'), max("id"), true) FROM "public"."directus_fields";

--- END SYNCHRONIZE TABLE "public"."directus_fields" RECORDS ---

--- BEGIN SYNCHRONIZE TABLE "public"."directus_relations" RECORDS ---

DELETE FROM "public"."directus_relations" WHERE "id" = 1;

DELETE FROM "public"."directus_relations" WHERE "id" = 2;

DELETE FROM "public"."directus_relations" WHERE "id" = 3;

DELETE FROM "public"."directus_relations" WHERE "id" = 4;

DELETE FROM "public"."directus_relations" WHERE "id" = 5;

DELETE FROM "public"."directus_relations" WHERE "id" = 6;

DELETE FROM "public"."directus_relations" WHERE "id" = 7;

DELETE FROM "public"."directus_relations" WHERE "id" = 8;

DELETE FROM "public"."directus_relations" WHERE "id" = 9;

DELETE FROM "public"."directus_relations" WHERE "id" = 10;

DELETE FROM "public"."directus_relations" WHERE "id" = 11;

DELETE FROM "public"."directus_relations" WHERE "id" = 12;

DELETE FROM "public"."directus_relations" WHERE "id" = 13;

DELETE FROM "public"."directus_relations" WHERE "id" = 14;

DELETE FROM "public"."directus_relations" WHERE "id" = 15;

DELETE FROM "public"."directus_relations" WHERE "id" = 16;

DELETE FROM "public"."directus_relations" WHERE "id" = 17;

DELETE FROM "public"."directus_relations" WHERE "id" = 18;

DELETE FROM "public"."directus_relations" WHERE "id" = 19;

DELETE FROM "public"."directus_relations" WHERE "id" = 20;

DELETE FROM "public"."directus_relations" WHERE "id" = 21;

DELETE FROM "public"."directus_relations" WHERE "id" = 22;

DELETE FROM "public"."directus_relations" WHERE "id" = 23;

DELETE FROM "public"."directus_relations" WHERE "id" = 24;

DELETE FROM "public"."directus_relations" WHERE "id" = 25;

DELETE FROM "public"."directus_relations" WHERE "id" = 26;

DELETE FROM "public"."directus_relations" WHERE "id" = 27;

DELETE FROM "public"."directus_relations" WHERE "id" = 28;

DELETE FROM "public"."directus_relations" WHERE "id" = 29;

DELETE FROM "public"."directus_relations" WHERE "id" = 30;

DELETE FROM "public"."directus_relations" WHERE "id" = 31;

SELECT setval(pg_get_serial_sequence('"public"."directus_relations"', 'id'), max("id"), true) FROM "public"."directus_relations";

--- END SYNCHRONIZE TABLE "public"."directus_relations" RECORDS ---
