extern crate diesel;
extern crate kiotlogdb;
extern crate serde_json;
extern crate uuid;

use self::kiotlogdb::*;
use self::models::*;
use self::diesel::prelude::*;

fn main() {
    use uuid::Uuid;
    use kiotlogdb::schema::devices::dsl::*;
    use kiotlogdb::schema::sensor_types::dsl::*;
    use kiotlogdb::schema::conversions::dsl::*;

    let connection = establish_connection();
    let results = devices
        .limit(5)
        .load::<Device>(&connection)
        .expect("Error loading devices");

    println!("Displaying {} devices", results.len());
    for d in results {
        println!(
            "{}: {} - {:?} - {:?} - {:?}",
            d.id, d.device, d.meta, d.auth, d.frame,
        );
        println!();
    }

    let device_uuid = Uuid::parse_str("f4078979-11e5-414f-928e-6fb2690e1cf5").unwrap();

    let first_device = devices
        .find(device_uuid)
        .get_result::<Device>(&connection)
        .expect("Error loading device");
    
    let device_sensors = Sensor::belonging_to(&first_device)
        .load::<Sensor>(&connection)
        .expect("Error loading sensors");
    
    println!("{:?}", first_device);
    
    for s in device_sensors {
        println!("  {:?}", s);
    
        let st = sensor_types
            .find(s.sensor_type_id)
            .get_result::<SensorType>(&connection)
            .expect("Error loading sensor_type");
    
        let c = conversions
            .find(s.conversion_id)
            .get_result::<Conversion>(&connection)
            .expect("Error loading conversion");
    
        println!("    {:?}", st);
        println!("    {:?}", c);
        println!();
    }
}
