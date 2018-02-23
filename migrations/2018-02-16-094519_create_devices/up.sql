-- Your SQL goes here
CREATE TABLE public.devices (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	device text NOT NULL,
	meta jsonb NOT NULL DEFAULT '{}'::jsonb,
	auth jsonb NOT NULL DEFAULT json_build_object('klsn', json_build_object('key', encode(gen_random_bytes(32), 'base64'::text)), 'basic', json_build_object('token', encode(gen_random_bytes(32), 'base64'::text))),
	frame jsonb NOT NULL DEFAULT '{"bigendian": true, "bitfields": false}'::jsonb,
	UNIQUE (device),
	PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;