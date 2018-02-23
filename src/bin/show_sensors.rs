extern crate diesel;
extern crate kiotlogdb;
extern crate serde_json;

use self::kiotlogdb::*;
use self::models::*;
use self::diesel::prelude::*;

fn main() {
    use kiotlogdb::schema::sensors::dsl::*;

    let connection = establish_connection();
    let results = sensors
        .limit(5)
        .load::<Sensor>(&connection)
        .expect("Error loading sensors");

    println!("Displaying {} sensors", results.len());
    for sensor in results {
        println!(
            "{}: {:?} - {:?} - {} {} {}",
            sensor.id, sensor.meta, sensor.fmt, sensor.conversion_id, sensor.sensor_type_id, sensor.device_id,
        );
        // println!("{}", serde_json::to_string(&sensor_type)?)
    }
}
