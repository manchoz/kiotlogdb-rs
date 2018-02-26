-- This file should undo anything in `up.sql`

DELETE FROM sensor_types WHERE id IN (
    '2e9e5330-5bde-4f5b-9c1f-52c96d73a05e',
    'd9508fcb-9061-41b6-a112-6849dd7c5739',
    '8b4f41b0-48ef-4004-b30c-8560b52cd3b7',
    'ae2f0f47-1e6d-4bbd-908b-d204857ba1bd',
    '47cbfb77-d56a-4ade-b8b4-0860bdbfedd3',
    'af23a956-1622-441c-9e6d-509c96adc76c',
    'cd1f1dd1-8447-4372-a8c5-edb3f173346a',
    '8c83e60b-dce2-4e8d-83b4-cbf633a31c6d',
    '6d2504fd-6a10-4295-aa9c-0b4d615941e2',
    'f0548111-be7f-49db-a01c-ad8037d4a601',
    'eab4c8d2-7d00-46f3-9492-92525bb3c67d',
    '0cf155e9-f380-45ea-8392-b9fd6c589781'
);
DELETE FROM conversions WHERE id IN (
    '0c57d818-f542-45ff-b710-eae777124aed',
    'a31dbdaa-1d56-4bc3-8ee6-facb2a9ada55',
    '5b635746-c7aa-4604-8f8d-0066fe84a5a2',
    '1fe37862-08d4-42a9-a74f-d890e36049ce',
    '6b398b67-9767-4c45-8ac1-d6f71424019a',
    'f8600146-8591-406f-bc0b-73d52ed5b7e0',
    'e792ccb9-cef3-44a1-914d-b93b141e2f68',
    'd450ead7-92a5-4391-8bf8-9e7c45ceba80'
);

DELETE FROM devices WHERE id IN (
    '86d36df8-6468-4ce6-a54a-e13fdb9a8c57',
    'bc7e1e9b-62d3-4c96-8874-983d5b405d0f',
    '9e408a18-c0a1-46d9-8f20-c2d7435b78fb',
    '98b32d84-a522-4a80-84bc-2bdabe65c0b5',
    '5b20fcb9-667c-4b4d-b220-ca0592c59459'
);
