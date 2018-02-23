-- Your SQL goes here

CREATE TABLE sensor_types (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text DEFAULT 'generic'::text NOT NULL,
    meta jsonb DEFAULT '{}'::jsonb,
    kind text DEFAULT 'generic'::text NOT NULL
);

ALTER TABLE ONLY sensor_types
    ADD CONSTRAINT sensors_types_pkey PRIMARY KEY (id);