-- +goose Up
SET default_tablespace = '';
SET default_table_access_method = heap;
CREATE TABLE public.directus_activity
(
    id          integer                                            NOT NULL,
    action      character varying(45)                              NOT NULL,
    "user"      uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip          character varying(50),
    user_agent  character varying(255),
    collection  character varying(64)                              NOT NULL,
    item        character varying(255)                             NOT NULL,
    comment     text,
    origin      character varying(255)
);
CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;
CREATE TABLE public.directus_collections
(
    collection              character varying(64)                                    NOT NULL,
    icon                    character varying(30),
    note                    text,
    display_template        character varying(255),
    hidden                  boolean                DEFAULT false                     NOT NULL,
    singleton               boolean                DEFAULT false                     NOT NULL,
    translations            json,
    archive_field           character varying(64),
    archive_app_filter      boolean                DEFAULT true                      NOT NULL,
    archive_value           character varying(255),
    unarchive_value         character varying(255),
    sort_field              character varying(64),
    accountability          character varying(255) DEFAULT 'all'::character varying,
    color                   character varying(255),
    item_duplication_fields json,
    sort                    integer,
    "group"                 character varying(64),
    collapse                character varying(255) DEFAULT 'open'::character varying NOT NULL
);
CREATE TABLE public.directus_dashboards
(
    id           uuid                                                            NOT NULL,
    name         character varying(255)                                          NOT NULL,
    icon         character varying(30)    DEFAULT 'dashboard'::character varying NOT NULL,
    note         text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color        character varying(255)
);
CREATE TABLE public.directus_fields
(
    id                 integer                             NOT NULL,
    collection         character varying(64)               NOT NULL,
    field              character varying(64)               NOT NULL,
    special            character varying(64),
    interface          character varying(64),
    options            json,
    display            character varying(64),
    display_options    json,
    readonly           boolean               DEFAULT false NOT NULL,
    hidden             boolean               DEFAULT false NOT NULL,
    sort               integer,
    width              character varying(30) DEFAULT 'full'::character varying,
    translations       json,
    note               text,
    conditions         json,
    required           boolean               DEFAULT false,
    "group"            character varying(64),
    validation         json,
    validation_message text
);
CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;
CREATE TABLE public.directus_files
(
    id                uuid                                               NOT NULL,
    storage           character varying(255)                             NOT NULL,
    filename_disk     character varying(255),
    filename_download character varying(255)                             NOT NULL,
    title             character varying(255),
    type              character varying(255),
    folder            uuid,
    uploaded_by       uuid,
    uploaded_on       timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by       uuid,
    modified_on       timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset           character varying(50),
    filesize          bigint,
    width             integer,
    height            integer,
    duration          integer,
    embed             character varying(200),
    description       text,
    location          text,
    tags              text,
    metadata          json
);
CREATE TABLE public.directus_flows
(
    id             uuid                                                         NOT NULL,
    name           character varying(255)                                       NOT NULL,
    icon           character varying(30),
    color          character varying(255),
    description    text,
    status         character varying(255)   DEFAULT 'active'::character varying NOT NULL,
    trigger        character varying(255),
    accountability character varying(255)   DEFAULT 'all'::character varying,
    options        json,
    operation      uuid,
    date_created   timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created   uuid
);
CREATE TABLE public.directus_folders
(
    id     uuid                   NOT NULL,
    name   character varying(255) NOT NULL,
    parent uuid
);
CREATE TABLE public.directus_migrations
(
    version     character varying(255) NOT NULL,
    name        character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE public.directus_notifications
(
    id          integer                NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status      character varying(255)   DEFAULT 'inbox'::character varying,
    recipient   uuid                   NOT NULL,
    sender      uuid,
    subject     character varying(255) NOT NULL,
    message     text,
    collection  character varying(64),
    item        character varying(255)
);
CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;
CREATE TABLE public.directus_operations
(
    id           uuid                   NOT NULL,
    name         character varying(255),
    key          character varying(255) NOT NULL,
    type         character varying(255) NOT NULL,
    position_x   integer                NOT NULL,
    position_y   integer                NOT NULL,
    options      json,
    resolve      uuid,
    reject       uuid,
    flow         uuid                   NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
CREATE TABLE public.directus_panels
(
    id           uuid                                   NOT NULL,
    dashboard    uuid                                   NOT NULL,
    name         character varying(255),
    icon         character varying(30)    DEFAULT NULL::character varying,
    color        character varying(10),
    show_header  boolean                  DEFAULT false NOT NULL,
    note         text,
    type         character varying(255)                 NOT NULL,
    position_x   integer                                NOT NULL,
    position_y   integer                                NOT NULL,
    width        integer                                NOT NULL,
    height       integer                                NOT NULL,
    options      json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);
CREATE TABLE public.directus_permissions
(
    id          integer               NOT NULL,
    role        uuid,
    collection  character varying(64) NOT NULL,
    action      character varying(10) NOT NULL,
    permissions json,
    validation  json,
    presets     json,
    fields      text
);
CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;
CREATE TABLE public.directus_presets
(
    id               integer                                                              NOT NULL,
    bookmark         character varying(255),
    "user"           uuid,
    role             uuid,
    collection       character varying(64),
    search           character varying(100),
    layout           character varying(100) DEFAULT 'tabular'::character varying,
    layout_query     json,
    layout_options   json,
    refresh_interval integer,
    filter           json,
    icon             character varying(30)  DEFAULT 'bookmark_outline'::character varying NOT NULL,
    color            character varying(255)
);
CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;
CREATE TABLE public.directus_relations
(
    id                      integer                                                     NOT NULL,
    many_collection         character varying(64)                                       NOT NULL,
    many_field              character varying(64)                                       NOT NULL,
    one_collection          character varying(64),
    one_field               character varying(64),
    one_collection_field    character varying(64),
    one_allowed_collections text,
    junction_field          character varying(64),
    sort_field              character varying(64),
    one_deselect_action     character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);
CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;
CREATE TABLE public.directus_revisions
(
    id         integer                NOT NULL,
    activity   integer                NOT NULL,
    collection character varying(64)  NOT NULL,
    item       character varying(255) NOT NULL,
    data       json,
    delta      json,
    parent     integer
);
CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;
CREATE TABLE public.directus_roles
(
    id           uuid                                                                      NOT NULL,
    name         character varying(100)                                                    NOT NULL,
    icon         character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description  text,
    ip_access    text,
    enforce_tfa  boolean               DEFAULT false                                       NOT NULL,
    admin_access boolean               DEFAULT false                                       NOT NULL,
    app_access   boolean               DEFAULT true                                        NOT NULL
);
CREATE TABLE public.directus_sessions
(
    token      character varying(64)    NOT NULL,
    "user"     uuid,
    expires    timestamp with time zone NOT NULL,
    ip         character varying(255),
    user_agent character varying(255),
    share      uuid,
    origin     character varying(255)
);
CREATE TABLE public.directus_settings
(
    id                      integer                                                      NOT NULL,
    project_name            character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url             character varying(255),
    project_color           character varying(50)  DEFAULT NULL::character varying,
    project_logo            uuid,
    public_foreground       uuid,
    public_background       uuid,
    public_note             text,
    auth_login_attempts     integer                DEFAULT 25,
    auth_password_policy    character varying(100),
    storage_asset_transform character varying(7)   DEFAULT 'all'::character varying,
    storage_asset_presets   json,
    custom_css              text,
    storage_default_folder  uuid,
    basemaps                json,
    mapbox_key              character varying(255),
    module_bar              json,
    project_descriptor      character varying(100),
    translation_strings     json,
    default_language        character varying(255) DEFAULT 'en-US'::character varying    NOT NULL,
    custom_aspect_ratios    json
);
CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;
CREATE TABLE public.directus_shares
(
    id           uuid NOT NULL,
    name         character varying(255),
    collection   character varying(64),
    item         character varying(255),
    role         uuid,
    password     character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start   timestamp with time zone,
    date_end     timestamp with time zone,
    times_used   integer                  DEFAULT 0,
    max_uses     integer
);
CREATE TABLE public.directus_users
(
    id                  uuid                                                        NOT NULL,
    first_name          character varying(50),
    last_name           character varying(50),
    email               character varying(128),
    password            character varying(255),
    location            character varying(255),
    title               character varying(50),
    description         text,
    tags                json,
    avatar              uuid,
    language            character varying(255) DEFAULT NULL::character varying,
    theme               character varying(20)  DEFAULT 'auto'::character varying,
    tfa_secret          character varying(255),
    status              character varying(16)  DEFAULT 'active'::character varying  NOT NULL,
    role                uuid,
    token               character varying(255),
    last_access         timestamp with time zone,
    last_page           character varying(255),
    provider            character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data           json,
    email_notifications boolean                DEFAULT true
);
CREATE TABLE public.directus_webhooks
(
    id          integer                                                   NOT NULL,
    name        character varying(255)                                    NOT NULL,
    method      character varying(10) DEFAULT 'POST'::character varying   NOT NULL,
    url         character varying(255)                                    NOT NULL,
    status      character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data        boolean               DEFAULT true                        NOT NULL,
    actions     character varying(100)                                    NOT NULL,
    collections character varying(255)                                    NOT NULL,
    headers     json
);
CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;
ALTER TABLE ONLY public.directus_activity
    ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);
ALTER TABLE ONLY public.directus_fields
    ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);
ALTER TABLE ONLY public.directus_notifications
    ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);
ALTER TABLE ONLY public.directus_permissions
    ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);
ALTER TABLE ONLY public.directus_presets
    ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);
ALTER TABLE ONLY public.directus_relations
    ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);
ALTER TABLE ONLY public.directus_revisions
    ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);
ALTER TABLE ONLY public.directus_settings
    ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);
ALTER TABLE ONLY public.directus_webhooks
    ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);



INSERT INTO public.directus_migrations
VALUES ('20201028A', 'Remove Collection Foreign Keys', '2023-03-27 13:51:30.268355+00');
INSERT INTO public.directus_migrations
VALUES ('20201029A', 'Remove System Relations', '2023-03-27 13:51:30.270672+00');
INSERT INTO public.directus_migrations
VALUES ('20201029B', 'Remove System Collections', '2023-03-27 13:51:30.272668+00');
INSERT INTO public.directus_migrations
VALUES ('20201029C', 'Remove System Fields', '2023-03-27 13:51:30.276937+00');
INSERT INTO public.directus_migrations
VALUES ('20201105A', 'Add Cascade System Relations', '2023-03-27 13:51:30.30068+00');
INSERT INTO public.directus_migrations
VALUES ('20201105B', 'Change Webhook URL Type', '2023-03-27 13:51:30.303929+00');
INSERT INTO public.directus_migrations
VALUES ('20210225A', 'Add Relations Sort Field', '2023-03-27 13:51:30.306308+00');
INSERT INTO public.directus_migrations
VALUES ('20210304A', 'Remove Locked Fields', '2023-03-27 13:51:30.308273+00');
INSERT INTO public.directus_migrations
VALUES ('20210312A', 'Webhooks Collections Text', '2023-03-27 13:51:30.310826+00');
INSERT INTO public.directus_migrations
VALUES ('20210331A', 'Add Refresh Interval', '2023-03-27 13:51:30.312562+00');
INSERT INTO public.directus_migrations
VALUES ('20210415A', 'Make Filesize Nullable', '2023-03-27 13:51:30.316645+00');
INSERT INTO public.directus_migrations
VALUES ('20210416A', 'Add Collections Accountability', '2023-03-27 13:51:30.319614+00');
INSERT INTO public.directus_migrations
VALUES ('20210422A', 'Remove Files Interface', '2023-03-27 13:51:30.32145+00');
INSERT INTO public.directus_migrations
VALUES ('20210506A', 'Rename Interfaces', '2023-03-27 13:51:30.348919+00');
INSERT INTO public.directus_migrations
VALUES ('20210510A', 'Restructure Relations', '2023-03-27 13:51:30.359987+00');
INSERT INTO public.directus_migrations
VALUES ('20210518A', 'Add Foreign Key Constraints', '2023-03-27 13:51:30.364962+00');
INSERT INTO public.directus_migrations
VALUES ('20210519A', 'Add System Fk Triggers', '2023-03-27 13:51:30.377866+00');
INSERT INTO public.directus_migrations
VALUES ('20210521A', 'Add Collections Icon Color', '2023-03-27 13:51:30.379632+00');
INSERT INTO public.directus_migrations
VALUES ('20210525A', 'Add Insights', '2023-03-27 13:51:30.390118+00');
INSERT INTO public.directus_migrations
VALUES ('20210608A', 'Add Deep Clone Config', '2023-03-27 13:51:30.392032+00');
INSERT INTO public.directus_migrations
VALUES ('20210626A', 'Change Filesize Bigint', '2023-03-27 13:51:30.398711+00');
INSERT INTO public.directus_migrations
VALUES ('20210716A', 'Add Conditions to Fields', '2023-03-27 13:51:30.400738+00');
INSERT INTO public.directus_migrations
VALUES ('20210721A', 'Add Default Folder', '2023-03-27 13:51:30.403404+00');
INSERT INTO public.directus_migrations
VALUES ('20210802A', 'Replace Groups', '2023-03-27 13:51:30.406404+00');
INSERT INTO public.directus_migrations
VALUES ('20210803A', 'Add Required to Fields', '2023-03-27 13:51:30.408534+00');
INSERT INTO public.directus_migrations
VALUES ('20210805A', 'Update Groups', '2023-03-27 13:51:30.410786+00');
INSERT INTO public.directus_migrations
VALUES ('20210805B', 'Change Image Metadata Structure', '2023-03-27 13:51:30.412935+00');
INSERT INTO public.directus_migrations
VALUES ('20210811A', 'Add Geometry Config', '2023-03-27 13:51:30.414968+00');
INSERT INTO public.directus_migrations
VALUES ('20210831A', 'Remove Limit Column', '2023-03-27 13:51:30.416567+00');
INSERT INTO public.directus_migrations
VALUES ('20210903A', 'Add Auth Provider', '2023-03-27 13:51:30.424998+00');
INSERT INTO public.directus_migrations
VALUES ('20210907A', 'Webhooks Collections Not Null', '2023-03-27 13:51:30.428471+00');
INSERT INTO public.directus_migrations
VALUES ('20210910A', 'Move Module Setup', '2023-03-27 13:51:30.431325+00');
INSERT INTO public.directus_migrations
VALUES ('20210920A', 'Webhooks URL Not Null', '2023-03-27 13:51:30.435221+00');
INSERT INTO public.directus_migrations
VALUES ('20210924A', 'Add Collection Organization', '2023-03-27 13:51:30.438282+00');
INSERT INTO public.directus_migrations
VALUES ('20210927A', 'Replace Fields Group', '2023-03-27 13:51:30.443239+00');
INSERT INTO public.directus_migrations
VALUES ('20210927B', 'Replace M2M Interface', '2023-03-27 13:51:30.444938+00');
INSERT INTO public.directus_migrations
VALUES ('20210929A', 'Rename Login Action', '2023-03-27 13:51:30.446484+00');
INSERT INTO public.directus_migrations
VALUES ('20211007A', 'Update Presets', '2023-03-27 13:51:30.449695+00');
INSERT INTO public.directus_migrations
VALUES ('20211009A', 'Add Auth Data', '2023-03-27 13:51:30.451284+00');
INSERT INTO public.directus_migrations
VALUES ('20211016A', 'Add Webhook Headers', '2023-03-27 13:51:30.452795+00');
INSERT INTO public.directus_migrations
VALUES ('20211103A', 'Set Unique to User Token', '2023-03-27 13:51:30.455793+00');
INSERT INTO public.directus_migrations
VALUES ('20211103B', 'Update Special Geometry', '2023-03-27 13:51:30.457612+00');
INSERT INTO public.directus_migrations
VALUES ('20211104A', 'Remove Collections Listing', '2023-03-27 13:51:30.459411+00');
INSERT INTO public.directus_migrations
VALUES ('20211118A', 'Add Notifications', '2023-03-27 13:51:30.468029+00');
INSERT INTO public.directus_migrations
VALUES ('20211211A', 'Add Shares', '2023-03-27 13:51:30.480653+00');
INSERT INTO public.directus_migrations
VALUES ('20211230A', 'Add Project Descriptor', '2023-03-27 13:51:30.483363+00');
INSERT INTO public.directus_migrations
VALUES ('20220303A', 'Remove Default Project Color', '2023-03-27 13:51:30.487605+00');
INSERT INTO public.directus_migrations
VALUES ('20220308A', 'Add Bookmark Icon and Color', '2023-03-27 13:51:30.489631+00');
INSERT INTO public.directus_migrations
VALUES ('20220314A', 'Add Translation Strings', '2023-03-27 13:51:30.491381+00');
INSERT INTO public.directus_migrations
VALUES ('20220322A', 'Rename Field Typecast Flags', '2023-03-27 13:51:30.493473+00');
INSERT INTO public.directus_migrations
VALUES ('20220323A', 'Add Field Validation', '2023-03-27 13:51:30.495421+00');
INSERT INTO public.directus_migrations
VALUES ('20220325A', 'Fix Typecast Flags', '2023-03-27 13:51:30.497423+00');
INSERT INTO public.directus_migrations
VALUES ('20220325B', 'Add Default Language', '2023-03-27 13:51:30.502063+00');
INSERT INTO public.directus_migrations
VALUES ('20220402A', 'Remove Default Value Panel Icon', '2023-03-27 13:51:30.506033+00');
INSERT INTO public.directus_migrations
VALUES ('20220429A', 'Add Flows', '2023-03-27 13:51:30.524463+00');
INSERT INTO public.directus_migrations
VALUES ('20220429B', 'Add Color to Insights Icon', '2023-03-27 13:51:30.526921+00');
INSERT INTO public.directus_migrations
VALUES ('20220429C', 'Drop Non Null From IP of Activity', '2023-03-27 13:51:30.529309+00');
INSERT INTO public.directus_migrations
VALUES ('20220429D', 'Drop Non Null From Sender of Notifications', '2023-03-27 13:51:30.531375+00');
INSERT INTO public.directus_migrations
VALUES ('20220614A', 'Rename Hook Trigger to Event', '2023-03-27 13:51:30.533866+00');
INSERT INTO public.directus_migrations
VALUES ('20220801A', 'Update Notifications Timestamp Column', '2023-03-27 13:51:30.537562+00');
INSERT INTO public.directus_migrations
VALUES ('20220802A', 'Add Custom Aspect Ratios', '2023-03-27 13:51:30.539431+00');
INSERT INTO public.directus_migrations
VALUES ('20220826A', 'Add Origin to Accountability', '2023-03-27 13:51:30.541659+00');



INSERT INTO public.directus_roles
VALUES ('77904037-82b9-4f1d-a8e6-c9efb8280eaa', 'Administrator', 'verified', '$t:admin_description', NULL, false, true,
        true);

SELECT pg_catalog.setval('public.directus_activity_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_fields_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_presets_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_relations_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_revisions_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);
SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);
ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);
ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);
ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);
ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);
ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);
ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections (collection);
ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users (id);
ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users (id);
ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders (id);
ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations (id);
ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions (id);
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files (id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files (id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files (id);
ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections (collection) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles (id) ON DELETE CASCADE;
ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users (id) ON DELETE SET NULL;
ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles (id) ON DELETE SET NULL;
REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
-- +goose Down
