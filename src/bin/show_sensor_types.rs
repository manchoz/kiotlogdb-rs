extern crate diesel;
extern crate kiotlogdb;
extern crate serde_json;

use self::kiotlogdb::*;
use self::models::*;
use self::diesel::prelude::*;

fn main() {
    use kiotlogdb::schema::sensor_types::dsl::*;

    let connection = establish_connection();
    let results = sensor_types
        .limit(5)
        .load::<SensorType>(&connection)
        .expect("Error loading sensor_types");

    println!("Displaying {} sensor_types", results.len());
    for sensor_type in results {
        println!(
            "{}: {} - {:?} - {}",
            sensor_type.id, sensor_type.name, sensor_type.meta, sensor_type.kind
        );
        // println!("{}", serde_json::to_string(&sensor_type)?)
    }
}
