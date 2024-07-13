BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "page_uri_mapping" (
    "id" bigserial PRIMARY KEY,
    "pageUri" text NOT NULL,
    "pageId" bigint NOT NULL,
    "pageData" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "page_widget_mapping" (
    "id" bigserial PRIMARY KEY,
    "pageId" bigint NOT NULL,
    "widgetId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "widget" (
    "id" bigserial PRIMARY KEY,
    "widgetId" bigint NOT NULL,
    "widgetType" text NOT NULL,
    "widgetData" text NOT NULL,
    "widgetName" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "widget_widget_mapping" (
    "id" bigserial PRIMARY KEY,
    "parentWidget" bigint NOT NULL,
    "childWidgetId" bigint
);


--
-- MIGRATION VERSION FOR pokedyn
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('pokedyn', '20240710171855037', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240710171855037', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20240710172012739', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240710172012739', "timestamp" = now();


COMMIT;
