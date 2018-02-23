table! {
    conversions (id) {
        id -> Uuid,
        fun -> Text,
        enabled -> Bool,
    }
}

table! {
    devices (id) {
        id -> Uuid,
        device -> Text,
        meta -> Jsonb,
        auth -> Jsonb,
        frame -> Jsonb,
    }
}

table! {
    sensor_types (id) {
        id -> Uuid,
        name -> Text,
        meta -> Nullable<Jsonb>,
        kind -> Text,
    }
}

table! {
    sensors (id) {
        id -> Uuid,
        meta -> Jsonb,
        fmt -> Jsonb,
        conversion_id -> Uuid,
        sensor_type_id -> Uuid,
        device_id -> Uuid,
    }
}

joinable!(sensors -> conversions (conversion_id));
joinable!(sensors -> devices (device_id));
joinable!(sensors -> sensor_types (sensor_type_id));

allow_tables_to_appear_in_same_query!(
    conversions,
    devices,
    sensor_types,
    sensors,
);
