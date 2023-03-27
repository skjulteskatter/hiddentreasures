DROP DATABASE IF EXISTS app;

-- Needed so the migrations run
CREATE ROLE manager;
CREATE ROLE directus;
CREATE ROLE api;
CREATE ROLE builder;

-- Stuff should be owned by manager
GRANT manager TO bccm;

-- Otherwise DU cant manage the DB
GRANT manager TO directus;
GRANT manager TO builder;

-- Create DB with correct owner
CREATE DATABASE app WITH OWNER = manager ENCODING = 'UTF8' CONNECTION LIMIT = -1 IS_TEMPLATE = False;
