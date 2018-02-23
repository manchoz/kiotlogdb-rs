# KiotlogDB.rs - KiotlogDB driver for Diesel.rs

KiotlogDB.rs is an experimental crate for interacting with [Kiotlog](https://github.com/kiotlog/kiotlog)'s Devices and Sensors catalog.

KiotlogDB is a PostgreSQL database which makes heavy uses of column types such as [UUID](https://www.postgresql.org/docs/10/static/datatype-uuid.html) and [JsonB](https://www.postgresql.org/docs/10/static/datatype-json.html).

I just started this crate to teach myself in Rust and to learn how to implement a full-mapped, strongly-typed, ORM implementation with application specific types (no generic `serde_json::Value`s) in Diesel.rs.

Other implementations:

- [Entity Framework Core in F#](https://github.com/kiotlog/kiotlogdbf)
- [Entity Framework Core in C#](https://github.com/kiotlog/kiotlogdb)
- Dapper ORM in F#

