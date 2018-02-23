extern crate diesel;
extern crate kiotlogdb;

use self::kiotlogdb::*;
use self::models::*;
use self::diesel::prelude::*;

fn main() {
    use kiotlogdb::schema::conversions::dsl::*;

    let connection = establish_connection();
    let results = conversions
        .filter(enabled.eq(true))
        .limit(5)
        .load::<Conversion>(&connection)
        .expect("Error loading conversions");

    println!("Displaying {} conversions", results.len());
    for conversion in results {
        println!("{}: {}", conversion.id, conversion.fun);
    }
}
