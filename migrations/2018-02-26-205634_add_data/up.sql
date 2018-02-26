INSERT INTO sensor_types (id, name, meta, kind) VALUES
	('2e9e5330-5bde-4f5b-9c1f-52c96d73a05e',	'DHT11_Temperature',	'{"max": 50, "min": 0}',	'temperature'),
	('d9508fcb-9061-41b6-a112-6849dd7c5739',	'DHT22_Humidity',	'{"max": 100, "min": 0}',	'humidity'),
	('8b4f41b0-48ef-4004-b30c-8560b52cd3b7',	'Generic',	'{}',	'generic'),
	('ae2f0f47-1e6d-4bbd-908b-d204857ba1bd',	'DHT22_Temperature',	'{"max": 125, "min": -40}',	'temperature'),
	('47cbfb77-d56a-4ade-b8b4-0860bdbfedd3',	'BME280_Temperature',	'{"max": 85, "min": -40}',	'temperature'),
	('af23a956-1622-441c-9e6d-509c96adc76c',	'BME280_Humidity',	'{"max": 100, "min": 0}',	'humidity'),
	('cd1f1dd1-8447-4372-a8c5-edb3f173346a',	'BME280_Pressure',	'{"max": 1100, "min": 300}',	'pressure'),
	('8c83e60b-dce2-4e8d-83b4-cbf633a31c6d',	'Generic_milliVolts',	'{}',	'voltage'),
	('6d2504fd-6a10-4295-aa9c-0b4d615941e2',	'DHT11_Humidity',	'{"max": 80, "min": 20}',	'humidity'),
	('f0548111-be7f-49db-a01c-ad8037d4a601',	'MKRFOX_Battery',	'{"max": 5000, "min": 0}',	'voltage'),
	('eab4c8d2-7d00-46f3-9492-92525bb3c67d',	'Generic_Temperature',	'{}',	'temperature'),
	('0cf155e9-f380-45ea-8392-b9fd6c589781',	'ATA8520_Temperature',	'{"max": 60, "min": -60}',	'temperature');

INSERT INTO conversions (id, fun, enabled) VALUES
    ('0c57d818-f542-45ff-b710-eae777124aed',	'float_to_int16', TRUE),
    ('a31dbdaa-1d56-4bc3-8ee6-facb2a9ada55',	'float_to_uint16', TRUE),
    ('5b635746-c7aa-4604-8f8d-0066fe84a5a2',	'id', TRUE),
    ('1fe37862-08d4-42a9-a74f-d890e36049ce',	'x10', TRUE),
    ('6b398b67-9767-4c45-8ac1-d6f71424019a',	'x100', TRUE),
    ('f8600146-8591-406f-bc0b-73d52ed5b7e0',	'x1000', TRUE),
    ('e792ccb9-cef3-44a1-914d-b93b141e2f68',	'float_to_int8', TRUE),
    ('d450ead7-92a5-4391-8bf8-9e7c45ceba80',	'float_to_uint8', TRUE);

INSERT INTO devices (id, device, meta, auth, frame) VALUES
    ('86d36df8-6468-4ce6-a54a-e13fdb9a8c57', '18B8D6', '{"name": "mkrfox-roaming", "description": "MKRFOX1200 @ Roaming"}', '{"basic": {"token": "fb2e2658-c6cd-498d-91e6-37ad92bbe89b"}}', '{"bigendian": false, "bitfields": false}'),
    ('bc7e1e9b-62d3-4c96-8874-983d5b405d0f', 'lopy-mancho', '{"name": "lopy-mancho", "description": "manchos LoPy"}', '{}', '{"bigendian": true, "bitfields": false}'),
    ('9e408a18-c0a1-46d9-8f20-c2d7435b78fb', 'trmpln-ardu-02', '{"name": "trmpln-ardu-02", "description": "manchos LoRaWAN device 02"}', '{}', '{"bigendian": true, "bitfields": false}'),
    ('98b32d84-a522-4a80-84bc-2bdabe65c0b5', '18A9E5', '{"name": "mkrfox-toolbox", "description": "MKRFOX1200 @ ToolBox"}', '{"basic": {"token": "afa1d877-f4f7-4b38-b559-48fd00d9ae1b"}}', '{"bigendian": false, "bitfields": false}'),
    ('5b20fcb9-667c-4b4d-b220-ca0592c59459', 'trmpln-ardu-01', '{"name": "trmpln-ardu-01", "description": "manchos LoRaWAN device 01"}', '{}', '{"bigendian": true, "bitfields": false}');

INSERT INTO sensors (id, meta, fmt, conversion_id, sensor_type_id, device_id) VALUES
    ('e03995dc-9691-43f3-abcb-fe617060e2ef', '{"name": "temperature"}', '{"index": 1, "fmt_chr": "h"}', '0c57d818-f542-45ff-b710-eae777124aed', '2e9e5330-5bde-4f5b-9c1f-52c96d73a05e', '98b32d84-a522-4a80-84bc-2bdabe65c0b5'),
    ('796c234f-4023-48b8-ba27-e5f31c3bd578', '{"name": "humidity"}', '{"index": 2, "fmt_chr": "H"}', 'a31dbdaa-1d56-4bc3-8ee6-facb2a9ada55', '6d2504fd-6a10-4295-aa9c-0b4d615941e2', '98b32d84-a522-4a80-84bc-2bdabe65c0b5'),
    ('43df5a85-d579-4de2-aac8-399258488cab', '{"name": "status"}', '{"index": 0, "fmt_chr": "B"}', '5b635746-c7aa-4604-8f8d-0066fe84a5a2', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', '98b32d84-a522-4a80-84bc-2bdabe65c0b5'),
    ('8991ba0d-6263-4a98-ba39-b39b527ba09a', '{"name": "temperature"}', '{"index": 1, "fmt_chr": "h"}', '0c57d818-f542-45ff-b710-eae777124aed', 'ae2f0f47-1e6d-4bbd-908b-d204857ba1bd', '86d36df8-6468-4ce6-a54a-e13fdb9a8c57'),
    ('acceb97a-abf7-458e-96ac-800ec3c2722c', '{"name": "humidity"}', '{"index": 2, "fmt_chr": "H"}', 'a31dbdaa-1d56-4bc3-8ee6-facb2a9ada55', 'd9508fcb-9061-41b6-a112-6849dd7c5739', '86d36df8-6468-4ce6-a54a-e13fdb9a8c57'),
    ('cb710293-fa09-4fc6-8e16-db8b8ad5ff2c', '{"name": "status"}', '{"index": 0, "fmt_chr": "B"}', '5b635746-c7aa-4604-8f8d-0066fe84a5a2', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', '86d36df8-6468-4ce6-a54a-e13fdb9a8c57'),
    ('c319187d-4d91-4d67-b6e6-f83f13e774c0', '{"name": "last_status"}', '{"index": 4, "fmt_chr": "B"}', '5b635746-c7aa-4604-8f8d-0066fe84a5a2', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', '86d36df8-6468-4ce6-a54a-e13fdb9a8c57'),
    ('9ebc099a-62bd-47cb-a71d-d9d615af12fc', '{"name": "temperature_internal"}', '{"index": 3, "fmt_chr": "h"}', '0c57d818-f542-45ff-b710-eae777124aed', '0cf155e9-f380-45ea-8392-b9fd6c589781', '98b32d84-a522-4a80-84bc-2bdabe65c0b5'),
    ('5e20265f-e176-4f75-8c81-ff219a9984e7', '{"name": "temperature_internal"}', '{"index": 3, "fmt_chr": "h"}', '0c57d818-f542-45ff-b710-eae777124aed', '0cf155e9-f380-45ea-8392-b9fd6c589781', '86d36df8-6468-4ce6-a54a-e13fdb9a8c57'),
    ('25284dde-5fbe-4db7-83d6-0f07985cfeb4', '{"name": "version"}', '{"index": 0, "fmt_chr": "B"}', '5b635746-c7aa-4604-8f8d-0066fe84a5a2', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', 'bc7e1e9b-62d3-4c96-8874-983d5b405d0f'),
    ('a8913d07-e72e-4411-9381-aa37dd3cf4dd', '{"name": "temperature"}', '{"index": 2, "fmt_chr": "h"}', '1fe37862-08d4-42a9-a74f-d890e36049ce', '47cbfb77-d56a-4ade-b8b4-0860bdbfedd3', 'bc7e1e9b-62d3-4c96-8874-983d5b405d0f'),
    ('1ed4cf02-c863-45d1-b8aa-4b4a850c0a81', '{"name": "pressure"}', '{"index": 3, "fmt_chr": "H"}', '1fe37862-08d4-42a9-a74f-d890e36049ce', 'cd1f1dd1-8447-4372-a8c5-edb3f173346a', 'bc7e1e9b-62d3-4c96-8874-983d5b405d0f'),
    ('5c88b98c-b99c-4e2c-8d59-826874730164', '{"name": "version"}', '{"index": 0, "fmt_chr": "B"}', '5b635746-c7aa-4604-8f8d-0066fe84a5a2', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', '9e408a18-c0a1-46d9-8f20-c2d7435b78fb'),
    ('b7ae3349-4a19-49fa-bd6c-152539ff79a9', '{"name": "temperature"}', '{"index": 2, "fmt_chr": "h"}', '1fe37862-08d4-42a9-a74f-d890e36049ce', '47cbfb77-d56a-4ade-b8b4-0860bdbfedd3', '9e408a18-c0a1-46d9-8f20-c2d7435b78fb'),
    ('82fcfac4-bdd8-4d95-9c51-e4f6772f18b9', '{"name": "pressure"}', '{"index": 3, "fmt_chr": "H"}', '1fe37862-08d4-42a9-a74f-d890e36049ce', 'cd1f1dd1-8447-4372-a8c5-edb3f173346a', '9e408a18-c0a1-46d9-8f20-c2d7435b78fb'),
    ('ddb85793-a9b8-4836-862c-ab1980ebfe9a', '{"name": "last_status"}', '{"index": 5, "fmt_chr": "B"}', 'd450ead7-92a5-4391-8bf8-9e7c45ceba80', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', '98b32d84-a522-4a80-84bc-2bdabe65c0b5'),
    ('4c0586f4-edf4-481f-b1f5-08959c236d3a', '{"name": "temperature"}', '{"index": 2, "fmt_chr": "h"}', '1fe37862-08d4-42a9-a74f-d890e36049ce', '47cbfb77-d56a-4ade-b8b4-0860bdbfedd3', '5b20fcb9-667c-4b4d-b220-ca0592c59459'),
    ('04a5e9f4-93a1-4a73-9529-5fd1f582f4eb', '{"name": "pressure"}', '{"index": 3, "fmt_chr": "H"}', '1fe37862-08d4-42a9-a74f-d890e36049ce', 'cd1f1dd1-8447-4372-a8c5-edb3f173346a', '5b20fcb9-667c-4b4d-b220-ca0592c59459'),
    ('16149acc-1554-4920-89ef-6eaf43023df9', '{"name": "version"}', '{"index": 0, "fmt_chr": "B"}', '5b635746-c7aa-4604-8f8d-0066fe84a5a2', '8b4f41b0-48ef-4004-b30c-8560b52cd3b7', '5b20fcb9-667c-4b4d-b220-ca0592c59459'),
    ('35d2d9ab-38f7-4edc-a486-c9de198048c3', '{"name": "battery"}', '{"index": 1, "fmt_chr": "H"}', 'f8600146-8591-406f-bc0b-73d52ed5b7e0', '8c83e60b-dce2-4e8d-83b4-cbf633a31c6d', '5b20fcb9-667c-4b4d-b220-ca0592c59459'),
    ('bcf930c3-ce5c-451b-ac01-7d0c9ddba949', '{"name": "battery"}', '{"index": 1, "fmt_chr": "H"}', 'f8600146-8591-406f-bc0b-73d52ed5b7e0', '8c83e60b-dce2-4e8d-83b4-cbf633a31c6d', 'bc7e1e9b-62d3-4c96-8874-983d5b405d0f'),
    ('c670ad5c-7e33-45be-b837-283014f55e37', '{"name": "battery"}', '{"index": 1, "fmt_chr": "H"}', 'f8600146-8591-406f-bc0b-73d52ed5b7e0', '8c83e60b-dce2-4e8d-83b4-cbf633a31c6d', '9e408a18-c0a1-46d9-8f20-c2d7435b78fb'),
    ('816dbf6b-1063-49b0-8e3c-226a1e3a004e', '{"name": "battery"}', '{"index": 4, "fmt_chr": "H"}', 'a31dbdaa-1d56-4bc3-8ee6-facb2a9ada55', 'f0548111-be7f-49db-a01c-ad8037d4a601', '98b32d84-a522-4a80-84bc-2bdabe65c0b5');
    