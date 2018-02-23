use uuid::Uuid;
use serde_json;
use diesel::deserialize::Queryable;
use diesel::pg::Pg;

#[derive(Queryable, Debug)]
pub struct Conversion {
    pub id: Uuid,
    pub fun: String,
    pub enabled: bool,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct SensorTypeMeta {
    pub min: i32,
    pub max: i32,
}

#[derive(Debug, Identifiable)]
pub struct SensorType {
    pub id: Uuid,
    pub name: String,
    pub meta: SensorTypeMeta,
    pub kind: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct SensorMeta {
    pub name: String,
    pub description: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct SensorFmt {
    pub fmt_chr: String,
    pub index: i32,
}

#[derive(Identifiable, Associations, Debug)]
#[belongs_to(Device, Conversion, SensorType)]
pub struct Sensor {
    pub id: Uuid,
    pub meta: SensorMeta,
    pub fmt: SensorFmt,
    pub conversion_id: Uuid,
    pub sensor_type_id: Uuid,
    pub device_id: Uuid,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct DeviceMeta {
    pub name: String,
    pub description: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct DeviceAuthKlsn {
    pub key: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct DeviceAuthBasic {
    pub token: String,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct DeviceAuth {
    pub klsn: DeviceAuthKlsn,
    pub basic: DeviceAuthBasic,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct DeviceFrame {
    pub bigendian: bool,
    pub bitfields: bool,
}

#[derive(Debug, Identifiable)]
pub struct Device {
    pub id: Uuid,
    pub device: String,
    pub meta: DeviceMeta,
    pub auth: DeviceAuth,
    pub frame: DeviceFrame,
}

use schema::sensor_types;

impl Queryable<sensor_types::SqlType, Pg> for SensorType {
    type Row = (Uuid, String, Option<serde_json::Value>, String);

    fn build(row: Self::Row) -> Self {
        let default_stm = SensorTypeMeta { min: 0, max: 100 };
        let stm = match row.2 {
            None => default_stm,
            Some(stm_j) => match serde_json::from_value(stm_j) {
                Err(_) => default_stm,
                Ok(stm) => stm,
            },
        };

        SensorType {
            id: row.0,
            name: row.1.to_lowercase(),
            meta: stm,
            kind: row.3.to_lowercase(),
        }
    }
}

use schema::sensors;

impl Queryable<sensors::SqlType, Pg> for Sensor {
    type Row = (Uuid, serde_json::Value, serde_json::Value, Uuid, Uuid, Uuid);

    fn build(row: Self::Row) -> Self {
        let default_sm = SensorMeta {
            name: "Sensor".to_owned(),
            description: "Default Sensor".to_owned(),
        };
        let sm = match serde_json::from_value(row.1) {
            Err(_) => default_sm,
            Ok(sm) => sm,
        };
        let default_fmt = SensorFmt {
            fmt_chr: "B".to_owned(),
            index: 0,
        };
        let fmt = match serde_json::from_value(row.2) {
            Err(_) => default_fmt,
            Ok(fmt) => fmt,
        };

        Sensor {
            id: row.0,
            meta: sm,
            fmt: fmt,
            conversion_id: row.3,
            sensor_type_id: row.4,
            device_id: row.5,
        }
    }
}

use schema::devices;

impl Queryable<devices::SqlType, Pg> for Device {
    type Row = (
        Uuid,
        String,
        serde_json::Value,
        serde_json::Value,
        serde_json::Value,
    );

    fn build(row: Self::Row) -> Self {
        use rand::{OsRng, Rng};
        use base64::encode;

        let default_dm = DeviceMeta {
            name: "Device".to_owned(),
            description: "Default Device".to_owned(),
        };
        let dm = match serde_json::from_value(row.2) {
            Err(_) => default_dm,
            Ok(dm) => dm,
        };

        let mut key = [0u8; 32];
        let mut token = [0u8; 32];
        let mut rng = OsRng::new().unwrap();
        rng.fill_bytes(&mut key);
        rng.fill_bytes(&mut token);

        let default_da = DeviceAuth {
            klsn: DeviceAuthKlsn { key: encode(&key) },
            basic: DeviceAuthBasic {
                token: encode(&token),
            },
        };
        let da = match serde_json::from_value(row.3) {
            Err(_) => default_da,
            Ok(da) => da,
        };

        let default_df = DeviceFrame {
            bigendian: true,
            bitfields: false,
        };
        let df = match serde_json::from_value(row.4) {
            Err(_) => default_df,
            Ok(df) => df,
        };

        Device {
            id: row.0,
            device: row.1,
            meta: dm,
            auth: da,
            frame: df,
        }
    }
}
