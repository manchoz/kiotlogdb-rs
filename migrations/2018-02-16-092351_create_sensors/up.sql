-- Your SQL goes here
CREATE TABLE public.sensors (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	meta jsonb NOT NULL DEFAULT '{}'::jsonb,
	fmt jsonb NOT NULL DEFAULT '{}'::jsonb,
	conversion_id uuid NOT NULL,
	sensor_type_id uuid NOT NULL,
	device_id uuid NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (conversion_id) REFERENCES conversions(id) ON UPDATE CASCADE ON DELETE SET DEFAULT,
	FOREIGN KEY (device_id) REFERENCES devices(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (sensor_type_id) REFERENCES sensor_types(id) ON UPDATE CASCADE ON DELETE RESTRICT
)
WITH (
	OIDS=FALSE
) ;