-- Your SQL goes here

CREATE TABLE conversions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fun text DEFAULT 'id'::text NOT NULL,
    enabled bool DEFAULT true NOT NULL
);

ALTER TABLE ONLY conversions
    ADD CONSTRAINT conversions_pkey PRIMARY KEY (id);